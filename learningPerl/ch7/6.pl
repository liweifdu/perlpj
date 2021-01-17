#!/usr/bin/perl

use strict;

foreach( <> ){
    chomp;
    if(/^(wilma).*(fred)$/){
        print;
        print "\n";
    }elsif(/^(fred).*(wilma)$/){
        print;
        print "\n";
    }
}

