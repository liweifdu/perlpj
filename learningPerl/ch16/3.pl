#!/usr/bin/perl

use strict;

if (`date` =~ /\AS/) {
    print "go play!\n";
}else{
    print "get to work!\n";
}
