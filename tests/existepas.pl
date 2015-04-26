#!/usr/bin/perl -w
use v5.10;
use ensishell;
use POSIX;

my $res;

$res = ensishell::executer("/existepas toto tutu");
exit -1 if $res != 255; # -1 non signé comme résultat

exit 0;
