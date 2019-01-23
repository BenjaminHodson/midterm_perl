
#!/usr/bin/perl
use strict;

sub shannon {
    my ($ref)=@_; # @_ is the special array that holds 
                  # the arguments passed to the subroutine
    my @probs = @{$ref};
    my $shannon_entropy=0.0;
    my $numterms = scalar(@probs);
    my $index;
    for $index (0..$numterms-1) {
        $shannon_entropy += $probs[$index]*log($probs[$index]);
    }
    $shannon_entropy = -$shannon_entropy;
    return $shannon_entropy;
}

sub relative_entropy {
    my ($refP,$refQ)=@_; 
    my @Pprobs = @{$refP};
    my @Qprobs = @{$refQ};
    my $num_P_terms = scalar(@Pprobs);
    my $num_Q_terms = scalar(@Qprobs);
    if ($num_P_terms != $num_Q_terms) {
        print "Pprobs an Qprobs have diff number of prob terms\n";
        die;
    }
    my $relative_entropy=0;
    my $index;
    for $index (0..$num_P_terms-1) {
        my $p = $Pprobs[$index];
        my $q = $Qprobs[$index];
        $relative_entropy += $p*log($p/$q);
    }
    return $relative_entropy;
}


sub count_to_freq {
    my ($ref)=@_;
    my @counts = @{$ref};
    my $numterms = scalar(@counts);
    my @probs;
    my $total_count=0;
    for my $index (0..$numterms-1) {
        $total_count+=$counts[$index];
    }
    for my $index (0..$numterms-1) {
        $probs[$index] = $counts[$index]/$total_count;
    }
    return @probs;
}

my $choice;
my @die = (1,2,3,4,5,6); 
my $die_size = scalar(@die); 
my %rolls;  
my @probs1;
my @probs2;
my $num_rolls = 50000;
for my $i(0..1) {
	for my $index(0..$num_rolls) {
		$choice = int(rand($die_size));
		$rolls{$die[$choice]}++; 	
	} 
		my @values;
	for my $index(1..6) {
		push @values, $rolls{$index};
	}

	my @probs; 
	@probs = count_to_freq(\@values); 
 
	print "---------\n";
	for my $index(0..5) {
		print $die[$index].": ".sprintf("%.2f",$probs[$index])."\n";
	} 
	if($i == 0) {
	@probs1 = @probs;
	}
	else {
	@probs2 = @probs;
	}
	
	
}
print"\n";
print "first die: ".sprintf("%.5f",shannon(\@probs1))."\n";
print "second die: ".sprintf("%.5f",shannon(\@probs2))."\n";

my $sum = relative_entropy(\@probs1,\@probs2) + relative_entropy(\@probs2,\@probs1);
print "relative entropy: ".sprintf("%.5f",$sum)."\n";


