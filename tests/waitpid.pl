use v5.10;

open(my $fh, "strace -f perl ../tests/lsl.pl 2>&1 | grep wait4 | wc -l |");
$ligne = <$fh>;
chomp($ligne);
if ($ligne > 0) {
	exit 0;
} else {
	exit -1;
}
close($fh);
