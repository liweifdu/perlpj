#!/usr/bin/perl

use strict;

foreach ( glob( '*' ) ) {
    my( $atime, $mtime ) = map {
        my( $year, $month, $day ) = (localtime($_))[5,4,3];
        $year += 1900;
        $month += 1;
        sprintf '%4d-%02d-%02d', $year, $month, $day;
    } (stat)[8, 9];
    printf "%-20s %10d %10d\n", $_, $atime, $mtime;
}
