use strict;

my $filepath = "input";
my @path = ();
my $max = 1000;
my $count = 0;

#read file from input2
sub readfile{
	open(FD, $filepath) or die "$filepath not exist!";
	foreach my $line (<FD>){
		my @keys = split(";",$line);
		my @line = ();
		foreach my $key (@keys) {
			print " $key ";
			push (@line, $key);
		}
		print "\n";
		push(@path, \@line);
	}
}

#set every 0 to max 
sub changepath{
	readfile;
	$count = $#path + 1;
	for ( my $i = 0 ; $i < $count ; $i++){
		for ( my $j =0 ; $j < $count ; $j++){
			if ($path[$i][$j] == 0 and $i != $j){
				$path[$i][$j] = $max;
			}
		}
	}
}

#floyd
sub floyd{
	changepath;
	for ( my $k = 0; $k < $count; $k++){
		for ( my $i = 0; $i < $count; $i++){
			for ( my $j = 0; $j < $count; $j++){
				if( $path[$j][$i]+$path[$i][$k] < $path[$j][$k] ){
					$path[$j][$k] = $path[$j][$i] + $path[$i][$k];
				}
			}
		}
	}
}

floyd;
for ( my $i = 0; $i < $count; $i++){
	for ( my $j = 0; $j < $count; $j++){
		print " $path[$i][$j] ";
	}
	print "\n";
}

