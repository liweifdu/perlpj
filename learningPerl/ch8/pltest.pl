#!/usr/bin/perl

use strict;

# use m// to match, just like qw//

# some modifier /a, /i, /s, /x, or use together
# $_ = "I saw Barney\ndown at the bowling alley\nwith Fred\nlast night.\n";
# if (m{
#         barney
#         .*
#         fred
#     }six
#    ) {
#        print "That string mentions Fred after Barney!\n";
#    }

# please use \A and \z instead of ^ $, if you just want match begin of a string
# the exactly meanning of ^ $ are beginning/end of line
# \A \z are beginning/end of string

# my $some_other = "I dream of betty rubble.";
# if ($some_other =~ /\brub/) {
#     print "Aye, there's the rub.\n";
# }

# my $what = shift @ARGV;
# while (<>) {
#     if (/\A($what)/) {
#         print "We saw $what in beginning of $_";
#     }
# }
#

# $_ = "Hello there, neighbor";
# if (/(\S+) (\S+), (\S+)/) {
#     print "words were $1 $2 $3\n";
# }

# match but not catch, ?:
# if (/(bronto)?saurus (steak|burger)/) {
#     print "Fred wants a $2\n";
# }
# if (/(?:bronto)?saurus (steak|burger)/) {
#     print "Fred wants a $1\n";
# }

# match and catch with label ?<label>
# my $names = 'Fred or Barney';
# if ($names =~ m/(?<name1>\w+) (?:and|or) (?<name2>\w+)/ ) {
#     print "I saw $+{name1} and $+{name2}\n";
# }
# my $names = 'Fred Flintstone and Wilma Flintstone';
# if ($names =~ m/(?<last_name>\w+) and \w+ \g{last_name}/ ) {
#     print "I saw $+{last_name}\n";
# }

# three special catch variables, match $&, before match $`, end match $'
# if ("Hello there, neighbor" =~ /\s(\w+),/) {
#     print "That was ($`)($&)($').\n";
# }

# a pattern match test code
# while (<>) {
#     chomp;
#     if (/YOUR_PATTERN_GOES_HERE/) {
#         print "Matched: |$`<$&>$'|\n";
#     }else{
#         print "No match: |$_|\n";
#     }
# }










