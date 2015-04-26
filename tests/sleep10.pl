#!/usr/bin/perl -w
use v5.10;
use ensishell;

my $res;
eval {
	local $SIG{ALRM} = sub { exit -1 };
	alarm 15;
	$res = ensishell::executer("sleep 10");
	exit -1 if $res != 0;
};
exit $res;
