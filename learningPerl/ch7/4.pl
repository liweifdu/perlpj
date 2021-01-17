#!/usr/bin/perl

use strict;

foreach( <> ){
    chomp;
    if(/\b[A-Z][a-z]+\b/){
        print;
    }
}

