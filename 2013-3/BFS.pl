#!/usr/bin/env perl 
#===============================================================================
#
#         FILE: BFS.pl
#
#        USAGE: ./BFS.pl  
#
#  DESCRIPTION: 
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: LiangAiping (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2013年03月08日 11时58分15秒
#     REVISION: ---
#===============================================================================

use stack;
use strict;
use warnings;
use Data::Dumper;
use utf8;


my $debug = 1;
my $stack = new stack();

my @array = (0,1,2,3,4,5,6,7);

my $start = 0;

$stack->push( $array[$start] );

my $current = 1;
while ( $stack->length() > 0 ){
	print "the $current level get num:";
	my @currentlist = ();
	while ( $stack->length() > 0 ){
		print $stack->pop(),"  ";
		push(@currentlist,$start);
		$start++;
	    if ( $debug == 0){
		    print "now get the start: $start\n";
	    }
	}
	print "\n";
	if ( $debug == 0){
		print Dumper(\@currentlist)," \n++++++++++++++++\n";
	}
	for( my $i = $#currentlist; $i >=0; $i--){
		my $key = $currentlist[$i];
		if ( defined($array[2*$key+2]) ){
			$stack->push($array[2*$key+2]);
		}
		if ( defined($array[2*$key+1]) ){
			$stack->push($array[2*$key+1]);
		}
	}
	if ( $debug == 0){
		print $stack->toString(),"\n";
	}

    @currentlist = ();
	$current++;
}
