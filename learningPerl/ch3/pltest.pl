#!/usr/bin/perl

# $rocks[0] = 'bedrock';
# $rocks[1] = 'slate';
# $rocks[2] = 'lava';
# $rocks[3] = 'crushed rock';
# $rocks[99] = 'schist';

# $end = $#rocks;
# $number_of_rocks = $end + 1;
# $rocks[ $#rocks ] = 'hard rock';
# print "$rocks[99]\n";
# print "$rocks[-1]\n";

# @ quote total array
# @rocks = qw/ bedrock slate lava /;

# @array = 5..9;
# $fred = pop(@array);
# $barney = pop @array;
# pop @array;
# print "@array\n";

# push(@array, 0);
# push @array, 8;
# push @array, 1..10;
# @others = qw/ 9 0 2 1 0 /;
# push @array, @others;
# print "@array\n";

# @array = qw# dino fred barney #;
# $m = shift(@array);
# $n = shift @array;
# shift @array;
# $o = shift @array;
# unshift(@array, 5);
# unshift @array, 4;
# @others = 1..3;
# unshift @array, @others;
# print "@array\n";

# @array = qw( pebbles dino fred barney betty );
# @removed = splice @array, 2;
# print "@array\t@removed\n";
# @array = qw( pebbles dino fred barney betty );
# @removed = splice @array, 1, 2;
# print "@array\t@removed\n";
# @array = qw( pebbles dino fred barney betty );
# @removed = splice @array, 1, 2, qw(wilma);
# print "@array\t@removed\n";
# @array = qw( pebbles dino fred barney betty );
# @removed = splice @array, 1, 0, qw(wilma);
# print "@array\t@removed\n";

# @fred = qw(eating rocks is wrong);
# $fred = "right";
# print "this is $fred[3]\n";
# print "this is ${fred}[3]\n";
# print "this is $fred" . "[3]\n";
# print "this is $fred\[3]\n";

# @rocks = qw/ bedrock slate lava /;
# foreach $rock (@rocks) {
#     $rock = "\t$rock";
#     $rock .= "\n";
# }
# print "The rocks are:\n", @rocks;

# foreach (1..10) {
#     print "I can count to $_!\n";
# }

# @fred = 6..10;
# @barney = reverse(@fred);
# @wilma = reverse 6..10;
# @fred = reverse @fred;

# @rocks = qw/ bedrock slate rubble granite /;
# @sorted = sort(@rocks);
# @back = reverse sort @rocks;
# @rocks = sort @rocks;
# @numbers = sort 97..102;
# print "@numbers\n";

# @rocks = qw/ bedrock slate rubble granite /;
# while( my( $index, $value ) = each @rocks ) {
#     print "$index: $value\n";
# }

# @backwards = reverse qw/ yabba dabba doo /;
# $backwards = reverse qw/ yabba dabba doo /;
# print "@backwards\n";
# print "$backwards\n";

