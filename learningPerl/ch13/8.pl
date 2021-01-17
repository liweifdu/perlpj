#!/usr/bin/perl

use strict;

foreach ( glob( '.* *' ) ) {
    my $dst = readlink $_;
    print "$_ -> $dst\n" if defined $dst;
}
