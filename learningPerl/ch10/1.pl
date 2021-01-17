#!/usr/bin/perl

use strict;

my $answer = int(1+rand(100));

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


