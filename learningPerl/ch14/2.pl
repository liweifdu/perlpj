#!/usr/bin/perl

use strict;

my %last_name = qw{
    fred flintstone
    Wilma Flintstone
    Barney Rubble
    betty rubble
    Bamm-Bamm Rubble
    PEBBLES FLINTSTONE
};

sub by_fst_lst_name {
    "\L$last_name{$a}" cmp "\L$last_name{$b}"
        or
    "\L$a" cmp "\L$b"
}

my @result = sort by_fst_lst_name keys %last_name;

foreach (@result) {
    print "$_ $last_name{$_}\n";
}
