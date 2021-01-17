#!/usr/bin/perl

while ( <STDIN> ){
    chomp;
    push @strings, $_;
}

@strings = sort @strings;
print "@strings\n";
foreach $string (@strings) {
    print "$string\n";
}
