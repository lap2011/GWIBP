#! /usr/bin/perl

use threads;
use IO::Socket::INET;
use strict;

my @openport;

sub scan{
	my ($host,@ports,$proto) = @_;

	foreach my $port (@ports){
		my $socket = new IO::Socket::INET(
				PeerHost => $host,
				PeerPort => $port,
				Proto    => $proto,
				);

		if($socket){
		    print $port,"is  open!\n";
			push(@openport, $port);
		    $socket->close();
		}
    
	}
}

sub thread{
	my $host = shift;
    my @ports = (1..65535);
	my $length = 65535/4;
	my $thr0 = threads->new(\&scan, $host, @ports[1..$length], 'tcp');
	my $thr1 = threads->new(\&scan, $host, @ports[$length+1..$length*2], 'tcp');
	my $thr2 = threads->new(\&scan, $host, @ports[$length*2+1..$length*3], 'tcp');
	my $thr3 = threads->new(\&scan, $host, @ports[$length*3+1..65535], 'tcp');
	$thr0->join();
	$thr1->join();
	$thr2->join();
	$thr3->join();
}

thread('127.0.0.1');
#scan('127.0.0.1',29,'tcp');
foreach my $accessport (@openport){
	print $accessport," is open!";
}
