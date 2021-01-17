#!/usr/bin/perl

use strict;

my $filename = 'path/to/sample_text';
open my $fh, '<', $filename
    or die "Can't open '$filename': $!";
chomp(my @strings = <FILE>);
while(1) {
    print 'Please enter a pattern: ';
    chomp(my $pattern = <STDIN>);
    last if $pattern =~ /\As*\Z/;
    my @matches = eval {
        grep /$pattern/, @strings;
    };
    if ($@) {
        print "Error: $@";
    }else{
        my $count = @matches;
        print "There were $count matching strings:\n",
            map "$_\n", @matches;
    }
    print "\n";
}
