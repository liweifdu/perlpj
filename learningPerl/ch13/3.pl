#!/usr/bin/perl

use strict;

print "please input a directory: \n";
chomp(my $indir = <STDIN>);
my $dir;
if($indir =~ /\A\s+\z/) {
    $dir = '/home/liwei';
}else{
    $dir = $indir;
}

chdir $dir or die "cannot chdir to $dir: $!";
my @name = glob '*';
push @name, glob '.*';

@name = sort @name;
print "@name";




