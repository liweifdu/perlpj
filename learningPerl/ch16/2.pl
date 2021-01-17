#!/usr/bin/perl

use strict;

open STDOUT, '>', 'ls.out' or die "can't write to ls.out: $!";
open STDERR, '>', 'ls.err' or die "can't write to ls.err: $!";
chdir '/' or die "can't chdir to root directory: $!";
exec 'ls', '-l' or die "Can't exec ls: $!";
