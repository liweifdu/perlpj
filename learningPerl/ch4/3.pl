#!/usr/bin/perl

use strict;

sub total {
    my $sum = 0;
    foreach (@_) {
        $sum += $_;
    }
    return $sum;
}

sub above_average {
    my @result;
    my $sum = &total(@_);
    my $average= $sum / @_;
    foreach (@_) {
        if($_ > $average){
            push @result, $_;
        }
    }
    return @result;
}

my @fred = above_average(1..10);
print "\@fred is @fred\n";
print "(Should be 6 7 8 9 10)\n";
my @barney = above_average(100, 1..10);
print "\@barney is @barney\n";
print "(Should be just 100)\n";
