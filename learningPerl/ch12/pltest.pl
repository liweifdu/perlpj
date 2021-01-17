#!/usr/bin/perl

use strict;

# die "Oops! A file called '$filename' already exists.\n";
#     if -e $filename;

# warn "Config file is looking pretty old!\n"
#     if -M CONFIG > 28;

my @original_files = qw/ fred barney betty wilma pebbles dino bamm-bamm /;
my @big_old_files;
foreach my $filename (@original_files) {
    push @big_old_files, $filename
        if -s $filename > 100_000 and -A $filename > 90;
}

