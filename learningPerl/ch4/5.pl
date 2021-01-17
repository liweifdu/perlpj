#!/usr/bin/perl

use strict;

my @ref_name;
my @cur_name;

sub greet {
    @cur_name = @_;
    if (@ref_name){
        print "Hi @cur_name! I've seen: @ref_name\n";
    }else{
        print "Hi @cur_name! You are the first one here!\n";
    }
    push @ref_name, @cur_name;
}

&greet( "Fred" );
&greet( "Barney" );
&greet( "Wilma" );
&greet( "Betty" );
    


