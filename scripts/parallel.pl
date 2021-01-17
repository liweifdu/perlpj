#!/usr/bin/perl

use strict;
use warnings;
use Parallel::ForkManager;

my $max_processes = 2;
my $pm = Parallel::ForkManager->new($max_processes)

foreach (1..10){
    my $pid = $pm->start and next;

    print "processing $_\n";
    sleep 3;

    $pm->finish;
}

