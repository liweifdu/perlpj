#!/usr/bin/perl

print "please input a number\n";
$num = <STDIN>;
( $num =~ /^-?\d+(\.\d+)?$/ ) or die "Error, input must be a digital\n" ;

print "please input a string\n";
chomp($str = <STDIN>);
( $str =~ /^[-a-zA-Z]+$/ ) or die "Error, input must be a string\n" ;

print $str x $num . "\n";
