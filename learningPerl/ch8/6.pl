#!/usr/bin/perl

use strict;

while (<>) {
    chomp;
    if (/(\s+)$/) {
        print "$`<$&>\n";
    }
}

