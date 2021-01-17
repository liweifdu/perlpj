#!/usr/bin/perl

use strict;

chomp(my $innums = <STDIN>);
my @nums = split /\s+/, $innums;

my @results = sort { $b <=> $a } @nums;

my $max_length = 0;

foreach (@results) {
    my $cur_length = length($_);
    $max_length = $cur_length if $cur_length > $max_length;
}

foreach (@results) {
    printf "%${max_length}s\n", $_;
}
