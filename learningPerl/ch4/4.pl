#!/usr/bin/perl

use strict;

my @ref_name;
my @cur_name;

sub greet {
    @cur_name = @_;
    if (@ref_name){
        print "Hi @cur_name! @ref_name is also here!\n";
    }else{
        print "Hi @cur_name! You are the first one here!\n";
    }
    @ref_name = @cur_name;
}

&greet( "Fred" );
&greet( "Barney" );
    


