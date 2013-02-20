#! /usr/bin/perl -w

use strict;

sub euclidean{
	my ($num1, $num2) = @_;
	if ( $num1 % $num2 == 0 ){
		return $num2;
	} else {
		my $middle = $num1 % $num2;
		euclidean($num2, $middle);
	}
}

print "please input the fitst number\n";
my $number1 = <STDIN>;
print "please input the second number\n";
my $number2 = <STDIN>;
if ( $number1 > $number2){
    print "the result is ",euclidean($number1, $number2),"\n";
}  else {
	print "the result is ",euclidean($number2, $number1),"\n";
}
