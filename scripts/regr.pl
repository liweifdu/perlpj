#!/usr/bin/perl -w

use strict;
use Getopt::Long;
use File::Find;
use File::Basename;

# --- parse command arguments ----------------------------
my $help = 0;
my $paralNum = 2;
my $frameMulti = 1;
my $mode = 'regr';
my $tcListDir = '/home/liwei/test/tc';
my $tvListDir = '/home/liwei/test/tv';
my $simLogDir = 'base_run/log';

GetOptions (
    'help|?'       => \$help,
    'paralNum=s'   => \$paralNum;
    'frameMulti=s' => \$frameMulti,
    'mode=s'       => \$mode,
    'tcDir=s'      => \$tcListDir,
    'tvDir=s'      => \$tvListDir,
    'logDir=s'     => \$simLogDir,
);

if($help){
    print "-p: set parallel submit jobs number\n";
    print "-f: set multi frame number\n";
    print "-m : set run mode\n";
    print " -> regr: regression all exist case without tcmp dcmp elab\n";
    print " -> rerun: regression all failed case without tcmp dcmp elab\n";
    print " -> rstregr: regression all exist case with tcmp dcmp elab\n";
    print " -> rstrerun: regression all failed case with tcmp dcmp elab\n";
    print "-tc: set test case directory\n";
    print "-tv: set test vector directory\n";
    print "-l: set simulation log directory\n";
    exit;
}else{
    print "===============================================\n";
    print " -> PARALLEL NUM: $paralNum\n";
    print " -> MULTI FRAME : $frameMulti\n";
    print " -> RUN MODE    : $mode\n";
    print " -> TC DIR      : $tcListDir\n";
    print " -> TV DIR      : $tvListDir\n";
    print " -> SIM LOG DIR : $simLogDir\n";
    print "===============================================\n";
}

# --- global vars ----------------------------------------
my $regrRpt = 'result.rpt';
my $regrFailRptPattern = '\A(.*) failed\Z';
my @testName = ();

# --- main process ---------------------------------------
if($mode eq 'regr') {
    &getNewCase($frameMulti);
}elsif($mode eq 'rerun') {
    &getFailCase();
}elsif($mode eq 'rstregr') {
    &rstDesign();
    &getNewCase($frameMulti);
}elsif($mode eq 'rstrerun') {
    &rstDesign();
    &getFailCase();
}else{
    die "error command of run mode \"$mode\"\n";
}

&regrCase();

# --- fetch process --------------------------------------
sub getNewCase{
    my $frameMulti = shift;
    my @tcList = ();
    my @tvList = ();
    my @multiTvList = ();

    # NOTE: for some simple case, opendir is faster than find!
    opendir(TCDIR, $tcListDir) or die "cannot open tc directory, $!\n";
    opendir(TVDIR, $tvListDir) or die "cannot open tv directory, $!\n";

    # find(\&tcwanted, $tcListDir);
    # sub tcwanted {
    #     unless (-d){
    #         $_ !~/.*\.svn.*/ && $_ =~m/.*_case\.sv/ && push @tcList, basename($_, ".sv");
    #     }
    # }

    # find(\&tvwanted, $tvListDir);
    # sub tvwanted{
    #     -d && $_ !~ /.*\.svn.*/ && $_ =~ m/case_.*/ && push @tvList, substr(basename($_), 5);
    # }

    while(my $tcName = readdir TCDIR) {
        #$tcName !~/.*\.svn.*/ && $tcName =~m/tc_base_.*_case\.sv/ && push @tcList, basename($tcName, ".sv");
        if($tcName =~ m/tc_base_case\.sv/){
            push @tcList, basename($tcName, ".sv");
        }elsif($tcName =~ m/tc_other_case\.sv/){
            push @tcList, basename($tcName, ".sv");
        }
    }

    while(my $tvName = readdir TVDIR) {
        $tvName !~ /.*\.svn.*/ && $tvName =~ m/case_00.*/ && push @tvList, substr(basename($tvName), 5);
    }

    closedir TCDIR;
    closedir TVDIR;

    # rearrange for multiframe setting
    foreach my $tcName (@tcList){
        my $cntMulti = 1;
        my $tvName = '';
        for(my $i = 0; $i <= $#tvList; $i++){
            if($cntMulti == 1) {
                $tvName .= $tvList[$i];
            }else{
                $tvName = $tvName . ',' . $tvList[$i];
            }

            # store test name and
            # reset pointer of multiFrame count
            if($cntMulti == $frameMulti || $i == $#tvList){
                my $seedName = time;
                push @testName, "$tcName $tvName $seedName";
                # print "$tcName $tvName $seedName\n";
                $tvName = '';
                $cntMulti = 1;
            }else{
                $cntMulti += 1;
            }
        }
    }
}

sub getFailCase{
    #analysis origin report to get fail case
    open my $oriRptFh, '<', $regrRpt
        or die "can't read $regrRpt: $!";

    while(<$oriRptFh>){
        if(/$regrFailRptPattern/){
            push @testName, $1;
        }
    }

    # foreach my $tmpName (@testName){
    #   print "$tmpName\n";
    # }
}

# --- reset process --------------------------------------
sub rstDesign{
    system 'make clean_all tcmp dcmp elab';
}

# --- regression process ---------------------------------
sub regrCase{
    my $timeBgnAll = time;

    # fork multi process
    my $cntParal   = 1;
    my @paralJob   = ();
    my @paralJobId = ();
    my $cntPass    = 0;
    my $cntFail    = 0;

    for(my $i = 0; $i <= $#testName; $i++){
        if($cntParal == $paralNum || $i == $#testName){
            # note done current parallel time
            my $timeBgn = time;
            push @paralJob, $testName[$i];
            my($tcName, $tvName, $seedName) = split /\s+/, $testName[$i];

            # submit job and store jobid
            my $jobId = `bsub make run ccov=on tc=$tcName case=$tvName seed=$seedName pl=UVM_NONE`;
            $jobId = $1 if $jobId =~ m/(\d+)/;
            push @paralJobId, $jobId;

            # print job log
            print "jobId $jobId: bsub make run ccov=on tc=$tcName case=$tvName seed=$seedName pl=UVM_NONE\n";

            # wait job done and print time
            while(){
                #wait ten second
                sleep 10;

                # note current second time and job
                my $timeEnd = time;
                my $numJob = 0;
                foreach (@paralJobId){
                    $numJob += `bjobs 2>&1 | grep "$_" -c`;
                }

                # if current no sim job left, break loop
                last if ($numJob == 0);

                # print time log per second
                my $timeLog =
                sprintf("    delta time: %d min %d s; run time: %d min %d s (jobs: %d)    ",
                             int(($timeEnd-$timeBgn) / 60)                                 ,
                             (($timeEnd-$timeBgn) - int(($timeEnd-$timeBgn)/60)*60)        ,
                             int(($timeEnd-$timeBgnAll) / 60)                              ,
                             (($timeEnd-$timeBgnAll) - int(($timeEnd-$timeBgnAll)/60)*60)  ,
                             $numJob
                         );
                print "$timeLog\r";
            }

            # check and print log
            foreach (@paralJob) {
                ($tcName, $tvName, $seedName) = split /\s+/, $_;
                my $runLog = "$simLogDir/${tcName}${tvName}_$seedName/run.log";
                my $flgPass = `grep "PASSED" $runLog`;
                if($flgPass ne ""){
                    $cntPass += 1;
                    system "echo \"$_ passed\" >> $regrRpt";

                    # remove pass log
                    system "rm -rf $simLogDir/${tcName}${tvName}_$seedName/";
                }else{
                    $cntFail += 1;
                    system "echo \"$_ failed\" >> $regrRpt";
                }
            }

            # print time log
            my $timeEnd = time;
            my $timeLog =
            sprintf("    delta time: %d min %d s; run time: %d min %d s               ",
                         int(($timeEnd-$timeBgn) / 60)                                 ,
                         (($timeEnd-$timeBgn) - int(($timeEnd-$timeBgn)/60)*60)        ,
                         int(($timeEnd-$timeBgnAll) / 60)                              ,
                         (($timeEnd-$timeBgnAll) - int(($timeEnd-$timeBgnAll)/60)*60)
                     );
            print "$timeLog\n";

            my $remainLog = sprintf(" -> REMAIN:%d", $#testName-$cntFail-$cntPass);
            print "=============================GROUP REGRESS RESULT========================\n";
            print " -> FAIL:$cntFail\n";
            print " -> PASS:$cntPass\n";
            print "$remainLog\n";
            print "=========================================================================\n";

            #reset temp variables
            @paralJob   = ();
            @paralJobId = ();
            $cntParal   = 1;
        }else{
            push @paralJob, $testName[$i];
            my($tcName, $tvName, $seedName) = split /\s+/, $testName[$i];

            # submit job
            my $jobId = `bsub make run ccov=on tc=$tcName case=$tvName seed=$seedName pl=UVM_NONE`;
            $jobId = $1 if $jobId =~ m/(\d+)/;
            push @paralJobId, $jobId;

            # print job log
            print "jobId $jobId: bsub make run ccov=on tc=$tcName case=$tvName seed=$seedName pl=UVM_NONE\n";

            $cntParal += 1;
        }
    }
}
