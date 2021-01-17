#!/usr/bin/perl

use strict;

foreach my $file (@ARGV) {
    my $attribs = &attributes($file);
    print "'$file' $attribs.\n";
}

sub attributes {
    my $file = shift @_;
    return "does not exist" unless -e $file;

    my @attrib;
    push @attrib, "readable" if -r $file;
    push @attrib, "writable" if -w $file;
    push @attrib, "executable" if -x $file;
    return "exists" unless @attrib;
    'is ' . join " and ", @attrib;
}
