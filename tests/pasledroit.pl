#!/usr/bin/perl -w
use v5.10;
use ensishell;

my $res;

$res = ensishell::executer("/usr");
say "res: $res";
exit -1 if $res != 255; # -1 non signé

exit 0;
