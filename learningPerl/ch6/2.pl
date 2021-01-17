#!/usr/bin/perl

use strict;

my %hash;

print "please input names:\n";
foreach( <> ){
    chomp;
    if(exists $hash{$_}) {
        $hash{$_}++;
    }else{
        $hash{$_} = 1;
    }
}

print "the statics of input is:\n";
while ( my ($key, $value) = each %hash ){
    print "$key => $value\n";
}




