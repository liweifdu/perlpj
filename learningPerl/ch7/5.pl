#!/usr/bin/perl

use strict;

foreach( <> ){
    chomp;
    if(/([^\s])\1/){
        print;
        print "\n";
    }
}

