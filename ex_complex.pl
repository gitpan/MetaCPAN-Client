use strict;
use warnings;
use Data::Printer;
use MetaCPAN::Client;

my $authors =
    MetaCPAN::Client->new->author({
        either => [
            { name => 'Dave *'  },
            { name => 'David *' },
        ]
    });

my %output = (
    TOTAL => $authors->total,
    NAMES => [
        map { my $x=$authors->next; [$x->name,$x->pauseid] }
        0 .. 9
    ],
);

p %output;
