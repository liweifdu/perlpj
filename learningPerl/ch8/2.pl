#!/usr/bin/perl

use strict;

while (<>) {
    chomp;
    if (/a\b/) {
        print "Matched: |$`<$&>$'|\n";
    }else{
        print "No match: |$_|\n";
    }
}

