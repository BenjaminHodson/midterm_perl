
use strict;
use FileHandle;
print "hello\n";



my $gen_value = 100*rand();
print "$gen_value\n";



my $data_range=100;
my $output_fh = new FileHandle ">gendata";

my $output_fh2 = new FileHandle ">gendata2";


my $index;
my $data_length = 1000;
for $index (0..$data_length-1) {
    $gen_value = $data_range*rand();
    print "$gen_value\n";
#   $output_fh->print("$gen_value\n");
}


if (0) {
my $data_length = 1000;
for $index (0..$data_length-1) {
    $gen_value = $data_range*rand();
    my $int_gen_val = int($gen_value);
    print "$int_gen_val\n";
    my $line_index;
    for $line_index (0..$data_range-1) {
        if ($line_index == $int_gen_val) {
            $output_fh->print("*");
        } 
        else {
            $output_fh->print(" ");
        }
        if ($line_index == $data_range-1) {
            $output_fh->print("\n");
        }
    }
}
}

my $pi = 3.1415;



my $event_number = 100;
my $event_index=0;
for $event_index (0..$event_number) {

# no indent>>>>>>>>>>>>
my $mean = 120;
my $sigma = 10;
my $data_length = 1000*rand();
for $index (0..$data_length-1) {
    # use Box-Muller transform
    my $gen_value1 = rand()+0.00000001;
    my $gen_value2 = rand()+0.00000001;
    my $Z1 = sqrt(-2*log($gen_value1)) * sin(2*$pi*$gen_value2);
    my $Z2 = sqrt(-2*log($gen_value1)) * cos(2*$pi*$gen_value2);
    my $X1 = $mean + $Z1 * $sigma;
    my $X2 = $mean + $Z2 * $sigma;

    my $int_gen_val = int($X1);
    print "$int_gen_val\n";
    $output_fh2->print("$int_gen_val\n");
    my $line_index;
    for $line_index (0..$data_range-1) {
        if ($line_index == $int_gen_val) {
            $output_fh->print("*");
        } 
        else {
            $output_fh->print(" ");
        }
        if ($line_index == $data_range-1) {
            $output_fh->print("\n");
        }
    }

    my $int_gen_val = int($X2);
    print "$int_gen_val\n";
    $output_fh2->print("$int_gen_val\n");
    my $line_index;
    for $line_index (0..$data_range-1) {
        if ($line_index == $int_gen_val) {
            $output_fh->print("*");
        } 
        else {
            $output_fh->print(" ");
        }
        if ($line_index == $data_range-1) {
            $output_fh->print("\n");
        }
    }
}

my $mean = 50;
my $sigma = 5;
my $data_length = 200*rand();
for $index (0..$data_length-1) {
    # use Box-Muller transform
    my $gen_value1 = rand()+0.00000001;
    my $gen_value2 = rand()+0.00000001;
    my $Z1 = sqrt(-2*log($gen_value1)) * sin(2*$pi*$gen_value2);
    my $Z2 = sqrt(-2*log($gen_value1)) * cos(2*$pi*$gen_value2);
    my $X1 = $mean + $Z1 * $sigma;
    my $X2 = $mean + $Z2 * $sigma;

    my $int_gen_val = int($X1);
    print "$int_gen_val\n";
    $output_fh2->print("$int_gen_val\n");
    my $line_index;
    for $line_index (0..$data_range-1) {
        if ($line_index == $int_gen_val) {
            $output_fh->print("*");
        } 
        else {
            $output_fh->print(" ");
        }
        if ($line_index == $data_range-1) {
            $output_fh->print("\n");
        }
    }

    my $int_gen_val = int($X2);
    print "$int_gen_val\n";
    $output_fh2->print("$int_gen_val\n");
    my $line_index;
    for $line_index (0..$data_range-1) {
        if ($line_index == $int_gen_val) {
            $output_fh->print("*");
        } 
        else {
            $output_fh->print(" ");
        }
        if ($line_index == $data_range-1) {
            $output_fh->print("\n");
        }
    }
}
# end no indent <<<<<<<<<<<<<<<<<<

}



for my $diceI(0..1000){
my $fairSide = $fairThrows[5];
push @fair, $fairSide;

}
	print "Array: @fair\n";
