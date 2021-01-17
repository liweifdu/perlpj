#!/usr/bin/perl

use strict;

my %do_these;
foreach (@ARGV) {
    $do_these{$_} = 1;
}

while (<>) {
    if (/\A## Copyright/) {
        delete $do_these{$ARGV};
    }
}

@ARGV = sort keys %do_these;
$^I = ".bak";

while(<>){
    if(/\A#!/){
        $_ .= "## Copyright (C) 2020 by Yours Truly\n";
    }
    print;
}

