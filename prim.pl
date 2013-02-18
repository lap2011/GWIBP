#! /usr/bin/perl -w

use strict;

my $filepath = "input3";
my @matrix = ();
my $count;
my $max = 1000;

#read file from path
sub readfile{
	open(FD,$filepath) or die "$filepath not exitst!";
	foreach my $line (<FD>){
		my @keys = split(";",$line);
		my @path = ();
		foreach my $key (@keys){
			push(@path, $key);
		}
		push(@matrix,\@path);
	}
}

#change file from 0 to 1000
sub getpath{
	readfile;
	$count = $#matrix + 1;
	for ( my $i = 0 ; $i < $count ; $i++){
		for ( my $j = 0; $j < $count ; $j++){
			if ( $i != $j && $matrix[$i][$j] == 0 ){
				$matrix[$i][$j] = $max;
			}
		}
	}
}

sub prim{
	getpath;
	my $startnode = shift;#select where to start
	my @dist = (); #select the min path
	my @mark = (); #mark whether it has been accessed
	my @path = (); #store the path
	my $sum = 0; #store the sum length

#init the first node
	for ( my $i = 0; $i < $count; $i++){
		$dist[$i] = $matrix[$startnode][$i];
	}

	$mark[$startnode] = 0;
	push(@path, "$startnode");

    #start to add node
	for ( my $j = 1; $j < $count; $j++){
        #select the min node
		my $min = $max;
		my $location = -1;	
		for ( my $i = 0; $i < $count; $i++){
			print "       the $j dist is $dist[$i]\n";
		}

		for ( my $i = 1; $i < $count; $i++){
			if( !defined($mark[$i]) and $dist[$i] < $min){
				$location = $i;
				$min = $dist[$i];
			}
		}

        push(@path, " --> $location");
		$mark[$location] = 0;
		$sum = $sum + $dist[$location];

		#print " $j get location $location min $min \n";
		#print "############################################\n";

        #update the dist
		for ( my $i = 1; $i < $count; $i++){
			if ( !defined($mark[$i]) and $matrix[$location][$i] < $dist[$i] ){
				$dist[$i] = $matrix[$location][$i];
			}
		}
	}

	print "the shortest path sum is: $sum\n";
	for ( my $i = 0; $i < $count; $i++){
		print "from $i has $path[$i] ";
		print "       the dist is $dist[$i]\n";
	}
}


prim(1);
