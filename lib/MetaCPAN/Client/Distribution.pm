use strict;
use warnings;
package MetaCPAN::Client::Distribution;
# ABSTRACT: A Distribution data object
$MetaCPAN::Client::Distribution::VERSION = '1.001000';
use Moo;

with 'MetaCPAN::Client::Role::Entity';

my @known_fields = qw<name bugs>;

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

MetaCPAN::Client::Distribution - A Distribution data object

=head1 VERSION

version 1.001000

=head1 DESCRIPTION

    my $dist = $mcpan->distribution('MetaCPAN-Client');

This represents a MetaCPAN distribution entity.

=head1 ATTRIBUTES

=head2 name

Distribution's name.

=head2 bugs

Distribution's bug information.

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
