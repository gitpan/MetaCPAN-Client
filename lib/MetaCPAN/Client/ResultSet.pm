use strict;
use warnings;
package MetaCPAN::Client::ResultSet;
# ABSTRACT: A Result Set
$MetaCPAN::Client::ResultSet::VERSION = '1.000001';
use Moo;
use Carp;

has scroller => (
    is       => 'ro',
    isa      => sub {
        ref $_[0] eq 'Search::Elasticsearch::Scroll'
            or croak 'scroller must be an Search::Elasticsearch::Scroll object';
    },
    handles  => ['total'],
    required => 1,
);

has type => (
    is       => 'ro',
    isa      => sub {
        croak 'Invalid type' unless
            grep { $_ eq $_[0] } qw<author distribution favorite
                                   file module rating release>;
    },
    required => 1,
);

has facets => (
    is      => 'ro',
    lazy    => 1,
    builder => '_get_facets',
);

sub _get_facets {
    my $self = shift;

    return $self->scroller->facets || {};
}


sub next {
    my $self   = shift;
    my $result = $self->scroller->next;

    defined $result
        or return;

    my $class = 'MetaCPAN::Client::' . ucfirst $self->type;
    return $class->new_from_request( $result->{'_source'} );
}


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MetaCPAN::Client::ResultSet - A Result Set

=head1 VERSION

version 1.000001

=head1 DESCRIPTION

Object representing a result from Elastic Search. This is used for the complex
(as in non-simple) queries to MetaCPAN. It provides easy access to the scroller
and facets.

=head1 ATTRIBUTES

=head2 scroller

An L<Search::Elasticsearch::Scroll> object

=head2 type

The entity of the result set. Available types:

=over 4

=item * author

=item * distribution

=item * module

=item * release

=item * favorite

=item * file

=back

=head2 facets

The facets available in the Elastic Search response.

=head1 METHODS

=head2 next

Iterator call to fetch the next result set object.

=head2 total

Iterator call to fetch the total amount of objects available in result set.

=head1 AUTHORS

=over 4

=item *

Sawyer X <xsawyerx@cpan.org>

=item *

Mickey Nasriachi <mickey@cpan.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2014 by Sawyer X.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
