#!/usr/bin/perl

use strict;

# sub sum_of_fred_and_barney {
#     print "Hey, you called the sum_of_fred_and_barney subroutine!\n";
#     $fred + $barney;
# }

# $fred = 3;
# $barney = 4;
# $wilma = &sum_of_fred_and_barney;
# print "\$wilma is $wilma.\n";

# $betty = 3 * &sum_of_fred_and_barney;
# print "\$betty is $betty.\n";

# $n = &max(10,15);
# sub max {
#     if ($_[0] > $_[1]) {
#         $_[0];
#     }else{
#         $_[1];
#     }
# }

# sub max {
#     if (@_ != 2) {
#         print "WARNING! &max should get exactly two arguments!\n";
#     }
#     my($m, $n);
#     ($m, $n) = @_;
#     if ($m > $n) { $m } else { $n }
# }
# $result1 = &max(10, 15);
# $result2 = &max(10, 11, 12);

# my $maximum = &max(3, 5, 10, 4, 6);
# sub max {
#     my($max_so_far) = shift @_;
#     foreach (@_) {
#         if ($_ > $max_so_far) {
#             $max_so_far = $_;
#         }
#     }
#     $max_so_far;
# }
# print "$maximum\n";

# my @names = qw/ fred barney betty dino wilma pebbles bamm-bamm /;
# my $result = &which_element_is("dino", @names);
# sub which_element_is {
#     my($what, @array) = @_;
#     foreach (0..$#array) {
#         if ($what eq $array[$_]) {
#             return $_;
#         }
#     }
#     -1;
# }
# print "$result\n";

# my $fred = 11;
# my $barney = 6;
# sub list_from_fred_to_barney {
#     if ($fred < $barney) {
#         $fred..$barney;
#     }else{
#         reverse $barney..$fred;
#     }
# }
# my @c = &list_from_fred_to_barney;
# print "@c\n";

# use 5.010;

# &running_sum( 5, 6 );
# &running_sum( 1..3 );
# &running_sum( 4 );

# sub running_sum {
#     state $sum = 0;
#     state @numbers;

#     foreach my $number ( @_ ) {
#         push @numbers, $number;
#         $sum += $number;
#     }

#     print "The sum of (@numbers) is $sum\n";
# }




