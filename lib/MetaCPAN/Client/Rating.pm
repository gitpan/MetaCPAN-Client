use strict;
use warnings;
package MetaCPAN::Client::Rating;
# ABSTRACT: A Rating data object
$MetaCPAN::Client::Rating::VERSION = '1.001001';
use Moo;

with 'MetaCPAN::Client::Role::Entity';

my @known_fields = qw<
    date release author details
    rating distribution helpful user
>;

foreach my $field (@known_fields) {
    has $field => (
        is      => 'ro',
        lazy    => 1,
        default => sub {
            my $self = shift;
            return $self->data->{$field};
        },
    );
}

sub _known_fields { return \@known_fields }

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MetaCPAN::Client::Rating - A Rating data object

=head1 VERSION

version 1.001001

=head1 DESCRIPTION

=head1 ATTRIBUTES

=head2 date

=head2 release

=head2 author

=head2 details

=head2 rating

=head2 distribution

=head2 helpful

=head2 user

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
