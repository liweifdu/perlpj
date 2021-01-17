#!/usr/bin/perl

use strict;

# my $mtime = (stat $some_file)[9];

# my($card_num, $count) = (split /:/)[1, 5];
# my($first, $last) = (sort @names)[0, -1];

# my @names = qw{zero one two three four five six seven eight nine};
# my @numbers = (@names)[9, 0, 2, 1, 0];
# print "Bedrock @numbers\n";
# my @numbers = @names[9, 0, 2, 1, 0];

# my $new_home_phone = "555-6099";
# my $new_address = "99380 Red ROck West";
# @items[2,3] = ($new_address, $new_home_phone);

# my %score = qw(
#     barney => '195',
#     fred => '205',
#     dino => '34',
#     );

# my @three_scores = ($score{"barney"}, $score{"fred"}, $score{"dino"});
# my @three_scores = @score{ qw/ barney fred dino / };

# grep and map
# my @odd_numbers;
# foreach (1..1000) {
#     push @odd_numbers, $_ if $_ %2;
# }
# my @odd_numbers = grep { $_ % 2 } 1..1000;

# my @matching_lines = grep { /\bfred\b/i } <$fh>;
# my @matching_lines = grep /\bfred\b/i, <$fh>;
# my $line_count = @matching_lines;
# my $line_count = grep /\bfred\b/i, <$fh>;

sub big_money {
    my $number = sprintf "%.2f", shift @_;
    1 while $number =~ s/^(-?\d+)(\d\d\d)/$1,$2/;
    $number =~ s/^(-?)/$1\$/;
    $number;
}

my @data = (4.75, 1.5, 2, 1234, 6.9456, 12345678.9, 29.95);
my @formatted_data;

# foreach (@data) {
#     push @formatted_data, & big_money($_);
# }
@formatted_data = map { &big_money($_) } @data;
print "@formatted_data\n";
print "The money numbers are:\n",
    map { sprintf("%25s\n", &big_money($_) ) } @data;

print "Some powers of two are:\n",
    map "\t" . ( 2 ** $_ ) . "\n", 0..15;




