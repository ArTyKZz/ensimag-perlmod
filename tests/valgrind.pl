use v5.10;

open(my $fh, "valgrind perl ../tests/lsl.pl 2>&1 | grep bin | wc -l |");
$ligne = <$fh>;
chomp($ligne);
if ($ligne == 2) {
	exit 0;
} else {
	exit -1;
}
close($fh);
