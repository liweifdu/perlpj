#!/usr/bin/perl

use strict;
use warnings;

my $input;
my @rank = (0, 36000, 144000, 300000, 420000, 660000, 960000);
my @bias = (0, 2520, 16920, 31920, 52920, 85920, 181920);
my @tax = (0.03, 0.1, 0.2, 0.25, 0.3, 0.35, 0.45);

print "*** PLEASE INPUT YOUR INCOME CASE IN A FORMAT BELOW *************\n";
print "*** INCOME1 FORMAT '<TOTAL/M> <JIXIAO/M> <ZHUANXIANG/M>': ";
chomp($input = <STDIN>);
my ($shui_qian_shou_ru, $ji_xiao, $zhuan_xiang_fu_jia_kou_chu) = split /\s+/, $input;
print "*** PLEASE INPUT YOUR GONGJIJIN RATE IN A FORMAT BELOW **********\n";
print "*** GONGJIJIN RATE '<FLOAT/M>': ";
chomp($input = <STDIN>);
my $gongjijin_rate = $input;

my $one_year_shou_ru = &one_year_income($shui_qian_shou_ru, $ji_xiao, $zhuan_xiang_fu_jia_kou_chu, $gongjijin_rate);

sub one_year_income{
    my ($shui_qian_shou_ru, $ji_xiao, $zhuan_xiang_fu_jia_kou_chu, $gongjijin_rate) = @_;
    my $wu_xian_yi_jin = ($shui_qian_shou_ru - $ji_xiao) * (0.08 + 0.02 + 0.005 + $gongjijin_rate);
    
    print "\nfor a normal year, every month your income is!\n";
    my $lei_ji_shou_ru = 0;
    my $lei_ji_jian_chu_fei_yong = 0;
    my $lei_ji_zhuan_xiang_kou_chu = 0;
    
    my $lei_ji_ying_na_shui_suo_de_e = 0;
    my $lei_ji_ying_na_shui_e = 0;
    my $lei_ji_yi_jiao_shui_e = 0;
    
    my $ben_yue_ying_jiao_shui_e = 0;
    my $ben_yue_shi_ji_shou_ru = 0;
    my $ben_nian_shi_ji_shou_ru = 0;
    for (1..12){
        $lei_ji_jian_chu_fei_yong += 5000;
        $lei_ji_shou_ru += $shui_qian_shou_ru;
        $lei_ji_zhuan_xiang_kou_chu += ($wu_xian_yi_jin + $zhuan_xiang_fu_jia_kou_chu);
    
        $lei_ji_ying_na_shui_suo_de_e = $lei_ji_shou_ru - $lei_ji_jian_chu_fei_yong - $lei_ji_zhuan_xiang_kou_chu;
        $lei_ji_ying_na_shui_e = &tax_cal($lei_ji_ying_na_shui_suo_de_e);
        $ben_yue_ying_jiao_shui_e = $lei_ji_ying_na_shui_e - $lei_ji_yi_jiao_shui_e;
        $lei_ji_yi_jiao_shui_e = $lei_ji_ying_na_shui_e;
    
        $ben_yue_shi_ji_shou_ru = $shui_qian_shou_ru - $wu_xian_yi_jin - $ben_yue_ying_jiao_shui_e;
        $ben_nian_shi_ji_shou_ru += $ben_yue_shi_ji_shou_ru;
        print "the {$_}th month: ben_yue_shi_ji_shou_ru -> $ben_yue_shi_ji_shou_ru, ben_yue_ying_jiao_shui_e -> $ben_yue_ying_jiao_shui_e, wu_xian_yi_jin -> $wu_xian_yi_jin\n";
    }
    print "for a normal year, your total income is $ben_nian_shi_ji_shou_ru, your total personal tax is $lei_ji_ying_na_shui_e\n";
    return $ben_nian_shi_ji_shou_ru;
}

sub tax_cal{
    my $num = shift;
    if($num < $rank[1]){
        $num * $tax[0] - $bias[0];
    }
    elsif($num < $rank[2]){
        $num * $tax[1] - $bias[1];
    }
    elsif($num < $rank[3]){
        $num * $tax[2] - $bias[2];
    }
    elsif($num < $rank[4]){
        $num * $tax[3] - $bias[3];
    }
    elsif($num < $rank[5]){
        $num * $tax[4] - $bias[4];
    }
    elsif($num < $rank[6]){
        $num * $tax[5] - $bias[5];
    }
    else{
        $num * $tax[6] - $bias[6];
    }
}



