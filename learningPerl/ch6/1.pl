#!/usr/bin/perl

use strict;

my %hash = (
    fred => 'flintstone',
    barney => 'rubble',
    wilma => 'flintstone',
);

print "please input a first name:\n";
chomp(my $fst_name = <STDIN>);

if (exists $hash{$fst_name}) {
    print "I knew who he/she is!, $fst_name $hash{$fst_name} right?\n";
}else{
    print "sorry, I have never seen this man!\n";
}

