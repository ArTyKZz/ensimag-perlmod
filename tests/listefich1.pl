use v5.10;

open(my $fh, "perl ../tests/lsl.pl|");

my $wbin=0;
my $wlib=0;
my $droits=0;
while (my $ligne = <$fh>)
  {
    chomp($ligne);
    $wbin=1 if ( $ligne =~ m/bin/);
    $wlib=1 if ( $ligne =~ m/lib/);
    $droits=1 if ( $ligne =~ m/^dr.*root.*root.*sbin/);
}
close($fh);
if ($wbin == 1 && $wlib == 1 && $droits == 1) {
	exit 0;git add CM
} else {
	exit -1;
}

