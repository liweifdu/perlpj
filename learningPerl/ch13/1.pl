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
opendir my $dh, $dir or die "cannot open $dir: $!";
my @name;
while ( my $name = readdir $dh) {
    next if $name eq '.' or $name eq '..' or $name =~ /^\./;
    push @name, $name . "\n";
}
@name = sort @name;
print @name;




