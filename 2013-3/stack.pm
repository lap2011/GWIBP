package stack;

use strict;
use Data::Dumper;

sub new{
	my $self = {
		arr=>[],
		length=>0,
	};
	return bless $self;
}

sub push{
	my $self = shift;
	my $data = shift;
	push(@{$self->{'arr'}},$data);
    $self->{'length'}=$self->{'length'}+1;
}

sub pop{
	my $self = shift;
	$self->{'length'} = $self->{'length'}-1;
	return pop @{$self->{'arr'}};
}

sub toString{
	my $self = shift;
	return @{$self->{'arr'}};
}

sub length{
	my $self = shift;
	return $self->{'length'};
}

1;
