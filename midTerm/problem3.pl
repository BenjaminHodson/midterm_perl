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

my @fairThrows = [1,2,3,4,5,6];
my $numFair = scalar(@fairThrows);
my @loadedThrows = [1,2,3,4,5,6,6,6,6,6];
my $numFair = scalar(@loadedThrows);
my $fairRandom = rand(6);
my $loadedRandom = rand(11);
my @fair = [];

for my $diceI(0..1000){
my $fairSide = $fairThrows[$fairRandom];
push @fair, $fairSide;



}
	print "Array: @fair\n";




 




