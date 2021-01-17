#!/usr/bin/perl

use strict;

use File::Basename;
use File::Spec;

my $symlink = $ARGV[0] eq 's';
shift @ARGV if $symlink;

my($src, $dst) = @ARGV;

if(-d $dst) {
    my $basename = basename $src;
    $dst = File::Spec->catfile($dst, $basename);
}

if ($symlink) {
    symlink $src, $dst
        or die "can't make soft link '$src' to '$dst': $!\n";
}else{
    link $src, $dst
        or die "can't make hard link '$src' to '$dst': $!\n";
}



