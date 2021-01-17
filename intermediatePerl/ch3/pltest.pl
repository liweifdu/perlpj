#!/usr/bin/perl

use strict;
use warnings;

my @input_numbers = (1, 2, 4, 8, 16, 32, 64);

# my @bigger_than_10 = grep $_ > 10, @input_numbers;
# my @end_in_4 = grep /4$/, @input_numbers;

# my @odd_digit_sum = grep digit_sum_is_odd($_), @input_numbers;
# sub digit_sum_is_odd {
#     my $input = shift;
#     my @digits = split //, $input;
#     my $sum;
#     $sum += $_ for @digits;
#     return $sum % 2;
# }

# my @odd_digit_sum = grep {
#     my $sum;
#     $sum += $_ for split //;
#     $sum % 2;
# } @input_numbers;

# print "@odd_digit_sum\n";

# my @result = map $_ + 100, @input_numbers;
# print "@result\n";
my @result = map {$_,  3 * $_ } @input_numbers;
print "@result\n";



