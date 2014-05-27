use strict;
use warnings;
use Data::Printer;
use MetaCPAN::Client;

my $release =
    MetaCPAN::Client->new->release({
        
    });



for ( 0 .. 10 ) {
    my $r = $release->next;
    p $r->name;
}
