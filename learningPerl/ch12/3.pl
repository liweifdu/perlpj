#!/usr/bin/perl

use strict;

print "Looking for my files that are readable and writable\n";
die "No filespecified!\n" unless @ARGV;

foreach my $file (@ARGV) {
    print "$file is readable and writable\n" if -o -r -w $file;
}

