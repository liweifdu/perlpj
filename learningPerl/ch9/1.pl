#!/usr/bin/perl

use strict;

print "input the match pattern:\n";
chomp(my $what = <STDIN>);
print "input the test string:\n";
while(<STDIN>) {
    chomp;
    if(/($what){3,}/) {
        print "match it, $`<$&>$'\n";
    }else{
        print "cannot match!\n";
    }
}
