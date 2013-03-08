use stack;
use queue;
use strict;

my $stack = new stack();
$stack->push('gg');
$stack->push('aa');
$stack->push('123');
print $stack->toString(),"\n";
print $stack->pop(),"afdsafsafZ\n";
print $stack->toString(),"\n";
$stack->pop();
print $stack->toString(),"\n";
$stack->pop();
print $stack->toString(),"\n";

my $queue=queue->new();  
$queue->en_queue(1);  
$queue->en_queue('a');  
$queue->en_queue('2');  
print $queue->toString(),"\n";  
$queue->de_queue();  
print $queue->toString();
