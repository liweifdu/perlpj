#!/usr/bin/perl

use strict;
use warnings;

# --- patterns --------------------------------------------
# comments end of a line
my $comm_end_line = '(\s*\/\/.*)*\Z';

# main module pattern
my $mod_start_patt = '\A\s*module\s+(\w+\()' . $comm_end_line;
my $mod_io_patt = '\A\s*(\w+)\s*(\,*)' . $comm_end_line;
my $mod_end_patt = '\A\s*\)\;' . $comm_end_line;
my $mod_other_patt = '\A\s+(\S+.*)' . $comm_end_line;

# sub module pattern
my $sub_mod_io_patt = '\A\s*(\.\w+)\s*\(\s*(\w+)\s*\)(\,*)' . $comm_end_line;
my $sub_mod_with_param_start_patt = '\A\s*(\w+)\s+(\#\()' . $comm_end_line;
my $sub_mod_without_param_start_patt = '\A\s*(\w+)\s+(\w+\()' . $comm_end_line;

# --- parameters ------------------------------------------
# module
my $top_io_name_max_len;
my $top_io_width_max_len = 0;

# sub module with parameters
my @sub_with_param_io_name_max_len;
my $sub_with_param_io_name_max_len;
my @sub_with_param_io_con_max_len;
my $sub_with_param_io_con_max_len;

# sub module without parameters
my @sub_without_param_io_name_max_len;
my $sub_without_param_io_name_max_len;
my @sub_without_param_io_con_max_len;
my $sub_without_param_io_con_max_len;

# parameter
my $param_name_max_len = 0;
my $param_width_max_len = 0;

# reg and wrie
my $reg_or_wire_name_max_len = 0;
my $reg_or_wire_width_max_len = 0;

# --- main ------------------------------------------------
foreach my $filename (@ARGV) {
    if( -e $filename) {
        print "processing $filename...\n";
        &get_param($filename);
        &run_main($filename);
        print "process $filename done!\n";
    }else{
        print "the origin file not exist\n";
        print "would you want to generate a template, <yes/no>:";
        chomp(my $confirm = <STDIN>);
        if($confirm =~ /yes/i){
            print "generate a new file $filename\n";
            &init($filename);
        }else{
            next;
        }
    }
}

# --- sub -------------------------------------------------
sub get_param{
    my $filename = shift;
    open my $filehandle, '<', $filename
        or die "can't read $filename: $!";
    while(<$filehandle>){
        # module parameter get
        if(/$mod_start_patt/../$mod_end_patt/){
            if(/$mod_start_patt/){
                $top_io_name_max_len = 0;
            }elsif(/$mod_io_patt/){
                my $string = (split /\s+/, $_)[1];
                $top_io_name_max_len = length($string) if length($string) > $top_io_name_max_len;
            }
        }

        # sub module with parameter's parameter get
        elsif(/$sub_mod_with_param_start_patt/../$mod_end_patt/){
            if(/$sub_mod_with_param_start_patt/){
                $sub_with_param_io_name_max_len = 0;
                $sub_with_param_io_con_max_len = 0;
            }elsif(/$mod_end_patt/){
                push @sub_with_param_io_name_max_len, $sub_with_param_io_name_max_len;
                push @sub_with_param_io_con_max_len, $sub_with_param_io_con_max_len;
            }elsif(/$sub_mod_io_patt/){
                $sub_with_param_io_name_max_len = length($1) if length($1) > $sub_with_param_io_name_max_len;
                $sub_with_param_io_con_max_len = length($2) if length($2) > $sub_with_param_io_con_max_len;
            }
        }

        # sub module without parameter's parameter get
        elsif(/$sub_mod_without_param_start_patt/../$mod_end_patt/){
            if(/$sub_mod_without_param_start_patt/){
                $sub_without_param_io_name_max_len = 0;
                $sub_without_param_io_con_max_len = 0;
            }elsif(/$mod_end_patt/){
                push @sub_without_param_io_name_max_len, $sub_without_param_io_name_max_len;
                push @sub_without_param_io_con_max_len, $sub_without_param_io_con_max_len;
            }elsif(/$sub_mod_io_patt/){
                $sub_without_param_io_name_max_len = length($1) if length($1) > $sub_without_param_io_name_max_len;
                $sub_without_param_io_con_max_len = length($2) if length($2) > $sub_without_param_io_con_max_len;
            }
        }

        # parameter's parameter get
        elsif(/\A\s*
               (?<type>(parameter|localparam))
               \s+(?<name>\S+)\s*
               \=\s*(?<width>\S.*)\;
               (?<comment>$comm_end_line)
              /x){
            my @string = split /\s+/, "$+{width}"; # remove space between parameter's width and ";"
            my $string1 = "$+{name}";
            my $string2 = join " ", @string;
            $param_name_max_len = length($string1) if length($string1) > $param_name_max_len;
            $param_width_max_len = length($string2) if length($string2) > $param_width_max_len;
        }

        # reg or wire parameter get
        elsif(/\A\s*
               (wire|reg)\s*
               (\[\S+)*\s*
               (\S*\])*\s*
               (\S+)\s*\;
               /x){
            $reg_or_wire_name_max_len = length($4) if length($4) > $reg_or_wire_name_max_len;
            if($2){
                $reg_or_wire_width_max_len = length($2) if length($2) > $reg_or_wire_width_max_len;
            }
        }

        # input or output parameter get
        elsif(/\A\s*
               (in|out)put\s+
               (reg)*\s*
               (\[\S+)*\s*
               (\S*\])*\s*
               (\S+)\s*\;
               /x){
            if($3){
                $top_io_width_max_len = length($3) if length($3) > $top_io_width_max_len;
            }
        }
    }
    close($filehandle);
}

sub run_main{
    my $filename = shift;
    my $tmpname = $filename . ".tmp";
    my $name_max_len;
    my $con_max_len;
    open my $filehandle, '<', $filename
        or die "can't read $filename: $!";
    open my $tmphandle, '>', $tmpname
        or die "can't write $tmpname: $!";
    while(<$filehandle>){
        # format module
        if(/$mod_start_patt/../$mod_end_patt/){
            if(/$mod_start_patt/){
                print $tmphandle "module" . " " . "$1" . "\n";
            }elsif(/$mod_end_patt/){
                print $tmphandle ");" . "\n";
            }elsif(/$mod_io_patt/){
                print $tmphandle " "x8
                               . sprintf("%-${top_io_name_max_len}s", $1)
                               . " "
                               . "$2"
                               . "\n";
            }else{
                if(/$mod_other_patt/){
                    print $tmphandle " " x 8 . "$1" . "\n";
                }else{
                    print $tmphandle "$_";
                }
            }
        }

        # format sub module with parameters
        elsif(/$sub_mod_with_param_start_patt/../$mod_end_patt/){
            if(/$sub_mod_with_param_start_patt/){
                $name_max_len = shift(@sub_with_param_io_name_max_len);
                $con_max_len = shift(@sub_with_param_io_con_max_len);
                print $tmphandle " " x 4 . "$1" . " " . "$2" . "\n";
            }elsif(/$mod_end_patt/){
                print $tmphandle " " x 4 . ");" . "\n";
            }elsif(/\A\s*(\)\S+\()/){
                print $tmphandle " " x 4 . "$1\n";
            }elsif(/$sub_mod_io_patt/){
                print $tmphandle " "x8
                               . sprintf("%-${name_max_len}s", $1)
                               . " "
                               . "( "
                               . sprintf("%-${con_max_len}s ", $2)
                               . ")$3"
                               . "\n";
            }else{
                if(/$mod_other_patt/){
                    print $tmphandle " " x 8 . "$1" . "\n";
                }else{
                    print $tmphandle "$_";
                }
            }
        }

        # format sub module without parameters
        elsif(/$sub_mod_without_param_start_patt/../$mod_end_patt/){
            if(/$sub_mod_without_param_start_patt/){
                $name_max_len = shift(@sub_without_param_io_name_max_len);
                $con_max_len = shift(@sub_without_param_io_con_max_len);
                print $tmphandle " " x 4 . "$1" . " " . "$2" . "\n";
            }elsif(/$mod_end_patt/){
                print $tmphandle " " x 4 . ");" . "\n";
            }elsif(/$sub_mod_io_patt/){
                print $tmphandle " "x8
                               . sprintf("%-${name_max_len}s", $1)
                               . " "
                               . "( "
                               . sprintf("%-${con_max_len}s ", $2)
                               . ")$3"
                               . "\n";
            }else{
                if(/$mod_other_patt/){
                    print $tmphandle " " x 8 . "$1" . "\n";
                }else{
                    print $tmphandle "$_";
                }
            }
        }

        # format input or output
        elsif(/\A\s*
                  (?<io>(in|out)put)\s+
                  (?<type>(reg)*)\s*
                  (?<width>(\[.*\])*)\s*
                  (?<name>\w+)\s*\;
                  (\s*\/\/.*)*\Z
              /x){
            my $string;
            if("$+{width}"){
                my @width = split /\s+/, "$+{width}";
                $string = sprintf("%-${top_io_width_max_len}s", $width[0]) . "-1:0]";
            }else{
                $string = " " x ($top_io_width_max_len + 5);
            }

            print $tmphandle " " x 4
                           . sprintf("%-6s ", "$+{io}")
                           . sprintf("%-3s ", "$+{type}")
                           . "$string "
                           . sprintf("%-${top_io_name_max_len}s ;\n", "$+{name}");
        }

        # format parameter
        elsif(/\A\s*
               (?<type>(parameter|localparam))
               \s+(?<name>\S+)\s*
               \=\s*(?<width>\S.*)\;
               (?<comment>$comm_end_line)
              /x){
            my @width = split /\s+/, "$+{width}";
            my $string = join " ", @width;
            print $tmphandle " " x 4
                           . sprintf("%-10s ", "$+{type}")
                           . sprintf("%-${param_name_max_len}s ", "$+{name}")
                           . "= "
                           . sprintf("%-${param_width_max_len}s ;", "$string")
                           . "$+{comment}\n"
        }

        # format wire and reg
        elsif(/\A\s*
                  (?<type>(wire|reg))\s+
                  (?<width>(\[.*\])*)\s*
                  (?<name>(\w+))\s*\;
                  (\s*\/\/.*)*\Z
              /x){
            my $string;
            if("$+{width}"){
                my @width = split /\s+/, "$+{width}";
                $string = sprintf("%-${reg_or_wire_width_max_len}s", $width[0]) . "-1:0]";
            }else{
                $string = " " x ($reg_or_wire_width_max_len + 5);
            }

            print $tmphandle " " x 4
                           . sprintf("%-4s ", "$+{type}")
                           . "$string "
                           . sprintf("%-${reg_or_wire_name_max_len}s", "$+{name}")
                           . ";\n";
        }

        # other code
        else{
            print $tmphandle "$_";
        }
    }
    close($filehandle);
}

sub init{
    my $filename = shift;
    open my $filehandle, '>', $filename
        or die "can't write $filename: $!";

    my $user = $ENV{'USER'};
    my $time = `date`;

    # add verilog header
    print $filehandle "//" . "=" x 60 . "\n";
    print $filehandle "// " . "FILE NAME: " . "$filename\n";
    print $filehandle "// " . "AUTHOR: " . "$user\n";
    print $filehandle "// " . "ID: " . "E01417\n";
    print $filehandle "// " . "CONTACT INFORMATION: $user\@cambricon.com\n";
    print $filehandle "//" . "-" x 60 . "\n";
    print $filehandle "// " . "PROJECT:\n";
    print $filehandle "// " . "RELEASE VERSION:\n";
    print $filehandle "// " . "VERSION DESCRIPTION:\n";
    print $filehandle "// " . "RELEASE DATE: $time";
    print $filehandle "//" . "-" x 60 . "\n";
    print $filehandle "// " . "PURPOSE:\n";
    print $filehandle "//\n" x 2;
    print $filehandle "// " . "PARAMETERS:\n";
    print $filehandle "// " . "PARAMETER NAME    RANGE   DESCRIPTION    DEFAULT VALUE\n";
    print $filehandle "//\n";
    print $filehandle "//" . "-" x 60 . "\n";
    print $filehandle "// " . "CLOCK:\n";
    print $filehandle "// " . "RESET:\n";
    print $filehandle "//" . "-" x 60 . "\n";
    print $filehandle "// " . "MODIFICATION HISTORY:\n";
    print $filehandle "// " . "DATE    BY    REVISION    CHANGE DESCRIPTION\n";
    print $filehandle "//" . "=" x 60 . "\n" x 2;

    # add verilog structure
    print $filehandle "module (\n";
    print $filehandle " " x 8 . "// input and output indent with 8 spaces!";
    print $filehandle "\n" x 5;
    print $filehandle ");";
    print $filehandle "\n" x 2;
    print $filehandle "//*** " . "PARAMETER " . "*" x 55;
    print $filehandle "\n" x 5;
    print $filehandle "//*** " . "I/O " . "*" x 61;
    print $filehandle "\n" x 5;
    print $filehandle "//*** " . "REG/WIRE " . "*" x 56;
    print $filehandle "\n" x 5;
    print $filehandle "//*** " . "MAIN BODY " . "*" x 55;
    print $filehandle "\n" x 5;
    print $filehandle "//--- " . "fsm " . "-" x 30;
    print $filehandle "\n" x 5;
    print $filehandle "    " . "//*** " . "some info " . "*" x 20;
    print $filehandle "\n" x 5;
    print $filehandle "//*** " . "DEBUG " . "*" x 59 . "\n";
    print $filehandle "    " . "\`ifdef DBUG\n";
    print $filehandle "    " . "\`endif\n";
    print $filehandle "endmodule";
}

