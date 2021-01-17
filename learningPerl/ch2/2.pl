#!/usr/bin/perl

$pi = 3.141592654;
print "please input the radius of cycle\n";
$r = <STDIN>;

( $r =~ /^-?\d+(\.\d+)?$/ ) or die "Error, input must be a digital\n" ;

print $r * 2 * $pi . "\n";
