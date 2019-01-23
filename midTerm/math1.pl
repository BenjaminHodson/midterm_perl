#!/usr/bin/perl
use strict;


sub shannon {
    my ($ref)=@_; # @_ is the special array that holds 
                  # the arguments passed to the subroutine
    my @probs = @{$ref};
    my $shannon_entropy=0;
    my $numterms = scalar(@probs);
    my $index;
    for $index (0..$numterms-1) {
        $shannon_entropy += $probs[$index]*log($probs[$index]);
    }
    $shannon_entropy = -$shannon_entropy;
    return $shannon_entropy;
}

my @fair_die = (1/6,1/6,1/6,1/6,1/6,1/6);
my @loaded_die = (1/10,1/10,1/10,1/10,1/10,1/2);
my $fairnum = shannon(\@fair_die);
my $loadednum = shannon(\@loaded_die);
print "fair shannon entropy = $fairnum\n";
print "loaded shannon entropy = $loadednum\n";

my @fairThrows = (1,2,3,4,5,6);
my @loadedThrows = (1,2,3,4,5,6,6,6,6,6);

my $loadedRandom = rand(11);
my @fair;
my @loaded;
my $count;
my @counts;
my @loadedCounts;
for my $diceI(0..1000){
my $fairRandom = rand(6);
my $fairSide = $fairThrows[$fairRandom];
if ($fairSide == 6){
$count++;
}else{
push @counts, $count;
$count = 0;
}
push @fair, $fairSide;
}

my $loadedCount;
for my $diceL(0..1000){
my $loadedRandom = rand(6);
my $loadedSide = $loadedThrows[$loadedRandom];
if ($loadedSide == 6){
$loadedCount++;
}else{
push @loadedCounts, $loadedCount;
$loadedCount = 0;
}
push @loaded, $loadedSide;
}

use List::Util 'max';
my $max = max( @counts );
my $loadedMax = max( @loadedCounts );

	print "$max\n $loadedMax\n";





 




