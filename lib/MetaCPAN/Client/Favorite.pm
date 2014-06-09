use strict;
use warnings;
package MetaCPAN::Client::Favorite;
# ABSTRACT: A Favorite data object
$MetaCPAN::Client::Favorite::VERSION = '1.005000';
use Moo;

with 'MetaCPAN::Client::Role::Entity';

my @known_fields = qw<date user release id author distribution>;

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

MetaCPAN::Client::Favorite - A Favorite data object

=head1 VERSION

version 1.005000

=head1 DESCRIPTION

    my $favorite = $mcpan->favorite( {
        distribution => 'Moose'
    } );

This represents a MetaCPAN favorite entity.

=head1 ATTRIBUTES

=head2 date

Date of the favorite.

=head2 user

The user ID (B<not> PAUSE ID) of who favorited.

=head2 release

The release that was favorited.

=head2 id

The favorite ID.

=head2 author

The PAUSE ID of the user who favorited.

=head2 distribution

The distribution that was favorited.

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
