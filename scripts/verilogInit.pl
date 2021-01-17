#!/usr/bin/perl

use strict;
use warnings;

my $user = $ENV{'USER'};
my $time = `date`;

foreach my $filename (@ARGV) {
    #open a newfile
    if( -e $filename) {
        print "PLEASE  : input add/rewrite/quit\n";
        print "*add    : add header at start of $filename\n";
        print "*rewrite: clean $filename and add header\n";
        print "*quit   : do nothing\n";
        chomp(my $confirm = <STDIN>);
        if($confirm =~ /add/i) {
            print "Start add header to the $filename\n";
            open my $tmpfilehandle, '>', "tmp"
                or die "Can't create temp file: $!";
            open my $filehandle, '<', $filename
                or die "Can't read '$filename': $!";
            &add_header(*$tmpfilehandle, $filename);
            while( <$filehandle> ){
                print $tmpfilehandle $_;
            }
            rename "tmp", $filename or die "cannot rewrite:$!";
            close($tmpfilehandle);
            close($filehandle);
        }elsif($confirm =~ /rewrite/i){
            warn "the $filename\'s contents will be cleared!\n";
            open my $filehandle, '>', $filename
                or die "Can't rewrite '$filename': $!";
            &add_header(*$filehandle, $filename);
            &add_struct(*$filehandle);
            close($filehandle);
        }else{
            next;
        }
    }else{
        print "create a new file named $filename\n";
        open my $filehandle, '>', $filename
            or die "Can't create '$filename': $!";
        &add_header(*$filehandle, $filename);
        &add_struct(*$filehandle);
        close($filehandle);
    }
}

#add header to the file
sub add_header{
    my ($fh, $filename) = @_;
    print $fh "//" . "=" x 60 . "\n";
    print $fh "// " . "FILE NAME: " . "$filename\n";
    print $fh "// " . "AUTHOR: " . "$user\n";
    print $fh "// " . "ID: " . "E01417\n";
    print $fh "// " . "CONTACT INFORMATION: $user\@cambricon.com\n";
    print $fh "//" . "-" x 60 . "\n";
    print $fh "// " . "PROJECT:\n";
    print $fh "// " . "RELEASE VERSION:\n";
    print $fh "// " . "VERSION DESCRIPTION:\n";
    print $fh "// " . "RELEASE DATE: $time\n";
    print $fh "//" . "-" x 60 . "\n";
    print $fh "// " . "PURPOSE:\n";
    print $fh "//\n";
    print $fh "//\n";
    print $fh "// " . "PARAMETERS:\n";
    print $fh "// " . "PARAMETER NAME    RANGE   DESCRIPTION    DEFAULT VALUE\n";
    print $fh "//\n";
    print $fh "//" . "-" x 60 . "\n";
    print $fh "// " . "CLOCK:\n";
    print $fh "// " . "RESET:\n";
    print $fh "//" . "-" x 60 . "\n";
    print $fh "// " . "MODIFICATION HISTORY:\n";
    print $fh "// " . "DATE    BY    REVISION    CHANGE DESCRIPTION\n";
    print $fh "//" . "=" x 60 . "\n";
}

sub add_struct{
    my $fh = shift;
    for (1..5) {
        print $fh "\n";
    }
    print $fh "//*** " . "PARAMETER " . "*" x 55;
    for (1..5) {
        print $fh "\n";
    }
    print $fh "//*** " . "I/O " . "*" x 61;
    for (1..5) {
        print $fh "\n";
    }
    print $fh "//*** " . "REG/WIRE " . "*" x 56;
    for (1..5) {
        print $fh "\n";
    }
    print $fh "//*** " . "MAIN BODY " . "*" x 55;
    for (1..5) {
        print $fh "\n";
    }
    print $fh "//--- " . "fsm " . "-" x 30;
    for (1..5) {
        print $fh "\n";
    }
    print $fh "    " . "//*** " . "some info " . "*" x 20;
    for (1..5) {
        print $fh "\n";
    }
    print $fh "//*** " . "DEBUG " . "*" x 59 . "\n";
    print $fh "    " . "\`ifdef DBUG\n";
    print $fh "    " . "\`endif\n";
    print $fh "endmodule";
}

