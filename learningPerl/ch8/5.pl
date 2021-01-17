#!/usr/bin/perl

use strict;

while (<>) {
    chomp;
    if (/(?<word>\b\w*a\b)(?<after>.{0,5})/) {
        print "Matched: |$`<$&>$'|\n";
        print "'word' contains '$+{word}'\n";
        print "the characters after match are '$+{after}'\n";
    }else{
        print "No match: |$_|\n";
    }
}

