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
$queue->en_quene( $array[$start] );

my $current = 1;

while ( $queue->{'length'} > 0 ){
	print "the $current level get: ";
	my @currentlist = 
}
