#!/usr/bin/perl
#-------------------------------------------------------------------------------
    #
    #  The confidential and proprietary information contained in this file may
    #  only be used by a person authorised under and to the extent permitted
    #  by a subsisting licensing agreement from XK Silicon.
    #
    #                   (C) COPYRIGHT 2020 XK Silicon.
    #                       ALL RIGHTS RESERVED
    #
    #  This entire notice must be reproduced on all copies of this file
    #  and copies of this file may only be made by a person if such person is
    #  permitted to do so under the terms of a subsisting license agreement
    #  from XK Silicon.
    #
    #  Revision       : 112933
    #  Release        : XK265
    #
#-------------------------------------------------------------------------------
    #
    #  Filename       : getYFromYuvCore.pl
    #  Author         : Huang Leilei
    #  Status         : phase 002
    #  Reset          : 2021-04-14
    #  Description    : extract a Y file from a YUV file
    #
#-------------------------------------------------------------------------------

# open input file
open FPT, "< $ARGV[0]";
binmode(FPT);

# get width and height
my $width  = $ARGV[1];
my $height = $ARGV[2];
my $frame = $ARGV[3];

for(my $i = 0; $i < $frame; $i++){
    read(FPT, $buf, $height * $width);
    print $buf;

    read(FPT, $buf, $height * $width / 4);
    print $buf;

    read(FPT, $buf, $height * $width / 4);
    print $buf;
}