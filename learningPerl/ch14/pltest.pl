#!/usr/bin/perl

use strict;

# find string $where = index($big, $small)
# my $stuff = "Howdy world!";
# my $where1 = index($stuff, "w");
# my $where2 = index($stuff, "w", $where1 + 1);
# my $where3 = index($stuff, "w", $where2 + 1);
# my $last_slash = rindex("/etc/passwd", "/");

# my $fred = "Yabba dabba doo!";
# my $where1 = rindex($fred, "abba");
# my $where2 = rindex($fred, "abba", $where1 - 1);
# my $where3 = rindex($fred, "abba", $where2 - 1);

# operate string use substr $part = substr($string, $initial_position, $length)
# my $mineral = substr("Fred J. Flintstone", 8, 5);
# my $rock = substr "Fred J. Flintstone", 13, 1000;
# my $out = substr("some very long string", -3, 2);
# my $long = "some very very long string";
# my $right = substr($long, index($long, "l"));
# my $string = "Hello, world!";
# substr($string, 0, 5) = "Goodbye";
# substr($string, -20) =~ s/fred/barney/g;

# sprintf to format string
# sub big_money {
#     my $number = sprintf "%.2f", shift @_;
#     1 while $number =~ s/^(-?\d+)(\d\d\d)/$1,$2/;
#     $number =~ s/^(-?)/$1\$/;
#     $number;
# }
# print &big_money(12345678.9);

# sort by some user rules
# sub by_number{
#     if ($a < $b) { -1 } elsif ($a > $b) { 1 } else { 0 }
# }
# my @result = sort by_number @some_numbers;

# sub by_number { $a <=> $b }
# sub by_string { $a cmp $b }

# my @numbers = sort { $a <=> $b } @some_numbers;
# my @descending = reverse sort { $a <=> $b} @some_numbers;

# my %score = (
#     barney => 195,
#     fred => 205,
#     dino => 30,
# );
# my @winners = sort by_score keys %score;
# sub by_score {
#     $score{$b} <=> $score{$a}
# }
# print "@winners";

# my %score = (
#     "barney" => 195,
#     "fred"   => 205,
#     "dino"   => 30,
#     "bamm-bamm" => 195,
# );
# my @winners = sort by_score_and_name keys %score;
# sub by_score_and_name {
#     $score{$b} <=> $score{$a}
#         or
#     $a cmp $b
# }
# print "@winners\n";

# @patron_IDs = sort {
#     &fines($b) <=> &fines($a) or
#     $items{$b} <=> $items{$a} or
#     $family_name{$a} cmp $family_name{$b} or
#     $personal_name{$a} cmp $family_name{$b} or
#     $a <=> $b
# } @patron_IDs;








