use strict;
use FileHandle;
my $input_fh = new FileHandle "gendata2";

my @data;
my $data_index=-1;
while (<$input_fh>) {
    $data_index++;
    chop;
    $data[$data_index]=$_;
}

my $data_length = scalar(@data);
my $sig_count;
my $index;
my $last_index=0;
for $index (0..$data_length-1) {
    my $value = $data[$index];
    my $past_avg=0;
    if ($index>4) {
        $past_avg += $data[$index-5];
        $past_avg += $data[$index-4];
        $past_avg += $data[$index-3];
        $past_avg += $data[$index-2];
        $past_avg += $data[$index-1];
    }
    $past_avg=$past_avg/5;
    my $start_drop_percentage=0.6;
    if ($value<$start_drop_percentage*$past_avg) {
        if ($index>$last_index+20) {
            print "possible start region at index=$index\n";
            $sig_count++;
        }
        $last_index=$index;
    }
}
print "signal count = $sig_count\n";