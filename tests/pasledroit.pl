#!/usr/bin/perl -w
use v5.10;
use ensishell;
my $nb = 1;
my $res;
$nb = $ARGV[0] if (@ARGV > 0);
while ( $nb > 0 ) {
	$res = ensishell::executer("/usr");
	$nb--;
}
exit $res;
