use strict;
use warnings;
use DDP;

use MetaCPAN::Client;

my $module =
    MetaCPAN::Client->new->module('Moo');

p $module->name;
p $module->data;

__END__

my %output = (
    AUTHOR  => $release->author,
    DATE    => $release->date,
    STATUS  => $release->status,
    VERSION => $release->version,
    TESTS   => $release->tests,
);

p %output;
