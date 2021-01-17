#!/usr/bin/perl

use strict;

$^I = ".out";

while(<>){
    chomp;
    s/Fred/\n/gi;
    s/Wilma/Fred/gi;
    s/\n/Wilma/g;
    print "$_\n";
}


