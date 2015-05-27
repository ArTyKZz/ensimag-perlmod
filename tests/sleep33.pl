#!/usr/bin/perl -w
use v5.10;
use ensishell;

my $res;
eval {
	local $SIG{ALRM} = sub { exit -1 };
	alarm 15;
	my $debut = time;
	$res = ensishell::executer("sleep 3");
	exit -1 if $res != 0;
	$res = ensishell::executer("sleep 3");
	exit -1 if $res != 0;
	$res = ensishell::executer("sleep 3");
	exit -1 if $res != 0;
	my $fin = time;
	exit -1 if ($fin - $debut) < 9;
};
exit $res;
