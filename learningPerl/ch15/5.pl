#!/usr/bin/perl

use 5.010;

use strict;

say "Checking the number <$ARGV[0]>";

my $favorite = 666;

given( $ARGV[0] ) {
    when ( ! /\A\d+\Z/ ) { say "Not a number!" }

    my @divisors = &divisors( $_ );
    when (@divisors ~~ 2) { say "$_ is even"; continue}
    when (!(@divisors ~~ 2)) { say "$_ is odd"; continue}
    when (@divisors ~~ $favorite) { say "$_ is divisible by my favorite number"; continue}
    when ($favorite) { say "$_ is my favorite number"; continue }

    my @empty;
    when (@divisors ~~ @empty) { say "Number is prime" }
    default { say "$_ is divisible by @divisors" }
}

sub divisors {
    my $number = shift;
    my @divisors = ();
    foreach my $divisor ( 2 .. $number/2 ) {
        push @divisors, $divisor unless $number % $divisor;
    }
    return @divisors;
}
