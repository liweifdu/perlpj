#!/usr/bin/perl

use strict;

# chdir '/etc' or die "cannot chdir to /etc: $!";
# my @all_files = glob '*';
# my @pl_files = glob '*.pl';
# print @all_files;
# print @pl_files;

# my $dir_to_process = '/etc';
# opendir my $dh, $dir_to_process or die "Cannot open $dir_to_process:$!";
# foreach my $file (readdir $dh) {
#     print "one file in $dir_to_process is $file\n";
# }
# closedir $dh;
# while (my $name = readdir $dh) {
#     next unless $name =~ /\.d$/;
#     print "one file in $dir_to_process is $name\n";
# }

# use File::Spec::Functions;
# opendir my $somedir, $dirname or die "Cannot open $dirname: $!";
# while (my $name = readdir $somedir) {
#     next if $name =~ /^\./;
#     $name = catfile( $dirname, $name );
#     next unless -f $name and -r $name;
# }

# unlink 'slate', 'bedrock', 'lava';
# unlink qw(slate bedrock lava);
# unlink glob '*.o';
# my $successful = unlink "slate", "bedrock", "lava";
# print "I deleted $successful file(s) just now\n";
# rename 'old', 'new';
# rename 'over_there/some/place/some_file' => 'some_file';

# foreach my $file (glob "*.old") {
#     my $newfile = $file;
#     $newfile =~ s/\.old$/.new/;
#     if (-e $newfile) {
#         warn "can't rename $file to $newfile: $newfile exists\n";
#     }elsif(rename $file => $newfile) {
# 
#     }else{
#         warn "rename $file to $newfile failed:$!\n";
#     }
# }

# mkdir 'fred', 0755 or warn "Cannot make fred directory: $!";
# my ($name, $perm) = @ARGV;
# mkdir $name, oct($perm) or die "cannot create $name: $!";
# foreach my $dir (qw(fred barney betty)) {
#     unlink glob "$dir/* $dir/.*";
#     rmdir $dir or warn "cannot rmdir $dir: $!\n";
# }

# chmod 0755, 'fred', 'barney';
# my $user = 1004;
# my $group = 100;
# chown $user, $group, glob '*.o';
# defined(my $user = getpwnam 'merlyn') or die 'bad user';
# defined(my $group = getpwnam 'users') or die 'bad user';
# chown $user, $group, glob '/home/merlyn/*';

# foreach (1..10) {
#     my $filename = "$_.log";
#     open my $filehandle, ">>", $filename or die "can't open $filename";
#     close $filehandle;
# }






