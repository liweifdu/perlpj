#!/usr/bin/perl

use strict;

print "please input the origin string: ";
chomp(my $ori_str = <STDIN>);
print "please input the sub string: ";
chomp(my $sub_str = <stdin>);

my $index = 0;

while(index($ori_str, $sub_str, $index) > 0) {
    $index = index($ori_str, $sub_str, $index);
    print $index . " ";
    $index++;
}
print "\n";




