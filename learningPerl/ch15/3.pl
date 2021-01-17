#!/usr/bin/perl

use 5.010;

use strict;

for (@ARGV) {
    print "Processing $_\n";
    when ( ! -e ) { print "\tFile does not exist!\n" }
    when ( -r _ ) { print "\tReadable!\n"; continue }
    when ( -w _ ) { print "\tWritable!\n"; continue }
    when ( -x _ ) { print "\tExecutable!\n"; continue }
}

