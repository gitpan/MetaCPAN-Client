use strict;
use warnings;
package MetaCPAN::Client::Release;
# ABSTRACT: A Release data object
$MetaCPAN::Client::Release::VERSION = '1.001001';
use Moo;

with 'MetaCPAN::Client::Role::Entity';

my @known_fields = qw<
    resources status date author maturity dependency id authorized
    download_url first archive version name version_numified license
    distribution stat provides tests abstract
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

MetaCPAN::Client::Release - A Release data object

=head1 VERSION

version 1.001001

=head1 DESCRIPTION

=head1 ATTRIBUTES

#head2 resources

#head2 status

#head2 date

#head2 author

#head2 maturity

#head2 dependency

#head2 id

#head2 authorized

#head2 download_url

#head2 first

#head2 archive

#head2 version

#head2 name

#head2 version_numified

#head2 license

#head2 distribution

#head2 stat

#head2 provides

#head2 tests

#head2 abstract

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
