use v5.10;

open(my $fh, "strace perl ../tests/lsl.pl 2>&1 | grep clone | wc -l |");
$ligne = <$fh>;
chomp($ligne);
if ($ligne == 1) {
	exit 0;
} else {
	exit -1;
}
close($fh);
