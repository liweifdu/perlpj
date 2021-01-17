#!/usr/bin/perl

while( <STDIN> ) {
    chomp;
    push @array, $_;
}

@array = reverse @array;
print "@array\n";


