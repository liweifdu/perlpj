#!/usr/bin/perl

@names = qw/ fred betty barney dino wilma pebbles bamm-bamm /;

while( <STDIN> ) {
    chomp;
    push @index, $_;
}

foreach $index (@index) {
    print "$names[$index - 1]\n";
}
    

