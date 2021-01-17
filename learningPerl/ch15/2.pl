#!/usr/bin/perl

use 5.010;

use strict;

for (1 .. 105) {
    my $what = '';
    given ($_) {
        when (not $_ % 3) { $what .= ' Fizz'; continue }
        when (not $_ % 5) { $what .= ' Buzz'; continue }
        when (not $_ % 7) { $what .= ' Sausage'; }
    }
    print "$_$what\n";
}

