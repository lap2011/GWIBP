#
#===============================================================================
#
#         FILE: queue.pm
#
#  DESCRIPTION: 
#
#        FILES: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: LiangAiping (), 
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 2013年03月08日 11时18分58秒
#     REVISION: ---
#===============================================================================

package queue;

use strict;
use warnings;

sub new {
	my $self = {
		arr=>[],
		length=>0,
	};
	return bless $self;
}

sub en_queue{
	my $self = shift;
	my $data = shift;
	$self->{'length'} = $self->{'length'} + 1;
	push(@{$self->{'arr'}},$data);
}

sub de_queue{
	my $self = shift;
	$self->{'length'} = $self->{'length'} - 1;
	return shift @{$self->{'arr'}};
}

sub toString{
	my $self = shift;
	return @{$self->{arr}};
}

sub length{
	my $self = shift;
	return $self->{'length'};
}

1;
