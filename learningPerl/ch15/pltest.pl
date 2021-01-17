#!/usr/bin/perl

use strict;

# my $flag = 0;
# foreach my $key ( keys %names ) {
#     next unless $key =~ /Fred/;
#     $flag = $key;
#     last;
# }
# print "I found a key matching 'Fred'. It was $flag\n" if $flag;
# # the formal code can be simplified by ~~
# print "I found a key matching 'Fred'" if %names ~~ /Fred/;

# my $equal = 0;
# foreach my $index ( 0 .. $#names1 ) {
#     last unless $names1[$index] eq $names2[$index];
#     $equal++;
# }
# print "The arrays have the same elements!\n"
#     if $equal == @names1;
# # the formal code can be simplified by ~~
# print "The arrays have the same elements!"
#     if @names1 ~~ @names2;

# given is the same as switch in c
# given ( $ARGV[0] ) {
#     when ( 'Fred' ) { print "Name is Fred\n"; continue }
#     when ( /Fred/i ) { print "Name has Fred in it\n"; continue }
#     when ( /\AFred/ ) { print "Name starts with Fred\n" }
#     default { print "I don't see a Fred\n" }
# }

# foreach ( @names ) {
#     print "\nProcessing $_\n";
#     when ( 'Fred' ) { print "Name is Fred\n"; continue }
#     when ( /Fred/i ) { print "Name has Fred in it\n"; continue }
#     when ( /\AFred/ ) { print "Name starts with Fred\n" }
#     default { print "I don't see a Fred\n" }
# }

