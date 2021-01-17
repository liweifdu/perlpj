#!/usr/bin/perl

use strict;

# $_ = "He's out bowling with Barney tonight.";
# s/Barney/Fred/;
# print "$_\n";

# use /g, /s, /i, /x, /r
# my $original = 'Fred ate 1 rib';

# my $copy = $original;
# $copy =~ s/\d+ ribs?/10 ribs/;

# (my $copy = $original) =~ s/\d+ ribs?/10 ribs/;

# my $copy = $original  =~ s/\d+ ribs?/10 ribs/r;

# $_ = "I saw Barney with Fred.";
# s/(fred|barney)/\U$1/gi;
# print;
# print "\n";
# s/(fred|barney)/\L$1/gi;
# print;
# print "\n";
# s/(\w+) with (\w+)/\U$2\E with $1/i;
# print;
# print "\n";
# s/(fred|barney)/\u$1/gi;
# print;
# print "\n";
# s/(fred|barney)/\u\L$1/gi;
# print;
# print "\n";

# my $name = 'lihua';
# print "Hello, \L\u$name\E, would you like to play a game?\n";

# my @fields = split /:/, "abc:def:g:h";
# my @fields = split /:/, "abc:def::g:h";
# my $some_input = "This   is a \t          test.\n";
# my @args = split /\s+/, $some_input;
# my @args = split; #the same as split /\s+/, $_;

# my $x = join ":", 4, 6, 8, 10, 12;
# my @values = split /:/, $x;
# my $z = join "-", @values;

# my $text = "Fred dropped a 5 ton granite block on Mr. Slate";
# my @words = ($text =~ /([a-z]+)/ig);
# print "Result: @words\n";

# my $data = "Barney Rubble Fred Flintstone Wilma Flintstone";
# my %last_name = ($data =~ /(\w+)\s+(\w+)/g);
# foreach my $key (keys %last_name) {
#     print "$key => $last_name{$key}\n";
# }
# while ( my($key, $value) = each %last_name) {
#     print "$key => $last_name{$key}\n";
# }

#avaricious and not greedy match
#gready + and not gready +?
# $_ = "fred and barney went bowling last night";
# print $& if (/fred.+barney/);
# print $& if (/fred.+?barney/);

# $_ = "I'm talking about the cartoon with Fred and <BOLD>Wilma</BOLD>!\n";
# s#<BOLD>(.*)</BOLD>#$1#g;
# print $_;
# $_ = "I thought you said Fred and <BOLD>Velma</BOLD>, not <BOLD>Wilma</BOLD>!\n";
# s#<BOLD>(.*?)</BOLD>#$1#g;
# print $_;

# $_ = "I'm much better\nthan Barney is\nat bowling,\nWilma.\n";
# print;
# print "Found 'wilma' at start of line\n" if /^wilma\b/im;

# open FILE, $filename
#     or die "Can't open '$filename': $!";
# my $lines = join '', <FILE>;
# $lines =~ s/^/$filename: /gm;

chomp(my $date = `date`);
$^I = ".bak";

while (<>) {
    s/^Author:.*/Author: Randal L. Schwartz/;
    s/^Phone:.*\n//;
    s/^Date:.*/Date: $date/;
    print;
}

#you can use perl -p -i.bak -w -e 's/Randall/Randal/g' fred*.dat







