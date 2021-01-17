#!/usr/bin/perl

use strict;

my $answer = int(1+rand(100));

my $Debug = $ENV{DEBUG} // 1;

print "Don't tell anyone, but the secret number is $answer.\n"
    if $Debug;

while (<STDIN>) {
    chomp;
    if (/quit|exit|\A\s*\z/i){
        print "Sorry you gave up, The number was $answer.\n";
        last;
    } elsif ($_ < $answer) {
        print "Too low\n";
    } elsif ($_ > $answer) {
        print "Too hight\n";
    } else {
        print "correct!\n";
        last;
    }
}


