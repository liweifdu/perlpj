#!/usr/bin/perl

use strict;

sub total {
    my $sum = 0;
    foreach (@_) {
        $sum += $_;
    }
    return $sum;
}

my @fred = 1..1000;
my $fred_total = &total(@fred);
print "The total of 1 .. 1000 is $fred_total.\n";

