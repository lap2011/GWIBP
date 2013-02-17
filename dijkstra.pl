
use strict;

my @path = ();
my @lastpath = ();
my $count;
my $inputfile = "input";
my $max = 1000;

#read the file from input
sub readfile{
	open(FD,"input") or die "not find file $inputfile";
	foreach my $line (<FD>){
		my @keys = split(";",$line);
		my @line = ();
		foreach my $key (@keys){
			push(@line, $key);
		}
		push(@path, \@line)
	}
}

#set every 0 to 1000 except i=j
sub getpath{
	readfile;
	$count = $#path + 1;
	for ( my $i = 0; $i < $count; $i++){
		for ( my $j = 0; $j < $count; $j++){
			if ( $i != $j && $path[$i][$j] == 0){
				$path[$i][$j] = $max;
			}

		}
	}
}

#get dijkstra
sub dijkstra{
	getpath;
	my @shortpath = (); #stopre the shortest path
	my @visted = ();  #mark whether the node had been visted
	my $startnode = shift; #mark the start node
	my @vistpath = (); #every shor path
	for ( my $i = 0; $i < $count; $i++){
		$vistpath[$i] = "$startnode --> $i";
	}

	$shortpath[$startnode] = 0;
	$visted[$startnode] = 0;
	for ( my $t = 1; $t < $count; $t++){
		my $next = -1;
		my $min = 1000;
		for( my $i = 0; $i < $count; $i++){
			if( !defined($visted[$i]) and $path[$startnode][$i] < $min){
				$min = $path[$startnode][$i];
				$next = $i;
			}
		}

		$shortpath[$next] = $min;
		$visted[$next] = 0;

		for ( my $j = 0; $j < $count; $j++){
			if ( !defined($visted[$j]) and $path[$startnode][$next] + $path[$next][$j] < $path[$startnode][$j]){
				$path[$startnode][$j] = $path[$startnode][$next] +$path[$next][$j];
				$vistpath[$j] = " $vistpath[$next] --> $j";
			}
		}
	}

	for (my $i =0; $i < $count; $i++){
		print "from $startnode to $i' shortpath is $vistpath[$i], its length is $path[$startnode][$i]\n";
	}
	print "####################################################\n";
}

dijkstra(0);

