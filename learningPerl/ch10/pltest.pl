#!/usr/bin/perl

use strict;

# unless, the back of if
# unless ($fred =~ /\A[A-Z_]\w*\z/i) {
#     print "The value of \$fred doesn't look like a Perl identifier name .\n";
# }

# until, the back of while
# until ($j > $i) {
#     $j *= 2;
# }

# please be more simple
# print "$n is a negative number.\n" if $n < 0;

# baker block
# {
#     print "Please enter a number: ";
#     chomp(my $n = <STDIN>);
#     my $root = sqrt $n;
#     print "The square root of $n is  $root.\n";
# }

# for loop
# for (my $i = 1; $i <= 10; $i++) {
#     print "I can count to $i!\n";
# }
# foreach (1..10) {
#     print "I can count to $_\n";
# }

# last is the same as break in c
# next is the same as continue in c, jump this loop, continue do next loop
# redo is unique, redo this loop
# foreach (1..10) {
#     print "Iteration numbers $_.\n\n";
#     print "Please choose: last, next, redo, or none of the avove? ";
#     chomp(my $choice = <STDIN>);
#     print "\n";
#     last if $choice =~ /last/i;
#     next if $choice =~ /next/i;
#     redo if $choice =~ /redo/i;
#     print "That wasn't any of the choices... onward!\n\n";
# }
# print "That's all, folks!\n";

# label block and control loop
# LINE: while (<>) {
#     foreach (split) {
#         last LINE if /__END__/;
#         ...
#     }
# }

# short-circuit is not the same as c, && ||
# use defined-or //
# foreach my $try ( 0, undef, '0', 1, 25 ) {
#     print "Trying [$try] ---> ";
#     my $value = $try // 'default';
#     print "\tgot [$value]\n";
# }

# some usefull rules
# ($m < $n) && ($m = $n);
# if ($m < $n) { $m = $n };







