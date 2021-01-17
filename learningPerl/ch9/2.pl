#!/usr/bin/perl

use strict;

$^I = ".out";

while(<>){
    s/Fred/Larry/gi;
}


