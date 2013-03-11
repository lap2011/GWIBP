#! /usr/bin/perl -w
#
use strict;
use queue;
use Data::Dumper;
use utf8;

my $debug = 0;

my $queue = new queue();

my @array = (0,1,2,3,4,5,6,7);

my $start = 0;
$queue->en_queue( $array[$start] );

my $current = 1;
my $location = 0;

while ( $queue->{'length'} > 0 ){
	print "the $current level get: ";
# out  queue the current child
	my $output = $queue->de_queue();

	print "$output ";
# enter queue the left child and right child
	if ( defined( $array[2*$location+1] ) ){
		$queue->en_queue($array[2*$location+1]);
	}
	if ( defined( $array[2*$location+2] ) ){
		$queue->en_queue($array[2*$location+2]);
	}

	$current++;
    $location++;
	print "\n";
}
