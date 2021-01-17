#!/usr/bin/perl

use strict;

print "input numbers of print length\n";
chomp(my $length = <STDIN>);
my $offset = ($length / 10 + 1);
print "input strings\n";
foreach ( <STDIN> ) {
    chomp;
    printf "%${length}s\n", $_;
}
print "1234567890" x $offset. "\n";


