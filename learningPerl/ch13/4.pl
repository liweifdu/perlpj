#!/usr/bin/perl

use strict;

foreach (@ARGV) {
    unlink or die "can't remove $_: $!";
}


