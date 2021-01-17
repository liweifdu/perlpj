#!/usr/bin/perl

print "please input the first number\n";
$num1 = <STDIN>;
( $num1 =~ /^-?\d+(\.\d+)?$/ ) or die "Error, input must be a digital\n" ;
print "please input the second number\n";
$num2 = <STDIN>;
( $num2 =~ /^-?\d+(\.\d+)?$/ ) or die "Error, input must be a digital\n" ;

print "the multiply of input is " . $num1 * $num2 . "\n";
