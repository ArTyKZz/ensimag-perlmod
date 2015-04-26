#!/usr/bin/perl -w
use v5.10;
use ensishell;

my $res;

$res = ensishell::executer("ls -l /existepas");
exit -1 if $res != 2; # ls renvoie 2 si le fichier existe pas

exit 0;
