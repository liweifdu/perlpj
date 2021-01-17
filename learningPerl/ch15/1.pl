#!/usr/bin/perl

use 5.010;

use strict;

my $Verbose = $ENV{VERBOSE} // 1;
my $secret = int(1 + rand(100));

print "Don't tell anyone, but the secret number is $secret.\n"
    if $Verbose;

LOOP: {
    print "Please enter a guess from 1 to 100: ";
    chomp(my $guess = <STDIN>);
    my $found_it = 0;

    given( $guess ) {
        when( ! /\A\d+\Z/ ) { print "Not a number!\n" }
        when( $_ > $secret ) { print "Too High!\n" }
        when( $_ < $secret ) { print "Too Low!\n" }
        default              { print "Just right!\n"; $found_it++ }
    }
    last LOOP if $found_it;
    redo LOOP;
}

