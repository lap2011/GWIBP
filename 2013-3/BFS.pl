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

my @array = (0,1,2,3,4,5,6,7,8,9,10,11,12);

my $start = 0;

$stack->push( $array[$start] );

my $current = 1;
my $mark = 0;

while ( $stack->length() > 0 ){
	while ( defined($array[ 2*$mark+1 ]) ){
		$stack->push( $array[ 2*$mark+1 ] );
		$mark = 2*$mark+1;
	}
	while ( defined($array[ 2*$mark+2]) ){
		$stack->push( $array[ 2*$mark+2 ] );
		$mark = 2*$mark+2;
		while ( defined($array[ 2*$mark+1 ]) ){
		    $stack->push( $array[ 2*$mark+1 ] );
		    $mark = 2*$mark+1;
		}
	}
	
	$array[$mark] = undef;
	$mark = int(($mark-1)/2);
	print $stack->pop(),"         *";
}

