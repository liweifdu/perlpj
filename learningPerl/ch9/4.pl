#!/usr/bin/perl

use strict;

$^I = ".bak";

while(<>){
    if(/\A#!/){
        $_ .= "## Copyright (C) 2020 by Yours Truly\n";
    }
    print;
}


