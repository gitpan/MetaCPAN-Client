use strict;
use warnings;
package MetaCPAN::Client::File;
# ABSTRACT: A File data object
$MetaCPAN::Client::File::VERSION = '1.003000';
use Moo;
use Carp;

with 'MetaCPAN::Client::Role::Entity';

my @known_fields = qw<
    status date author maturity directory indexed documentation id
    module authorized pod_lines version binary name version_numified release
    path description stat distribution level sloc abstract slop mime
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

sub pod {
    my $self   = shift;
    my $ctype  = shift || "plain";
    $ctype = lc($ctype);

    grep { $ctype eq $_ } qw<html plain x-pod x-markdown>
        or croak "wrong content-type for POD requested";

    my $name = $self->module->[0]{name};

    require MetaCPAN::Client::Request;

    return
        MetaCPAN::Client::Request->new->fetch(
            "pod/${name}?content-type=text/${ctype}"
        );
}


1;

__END__

=pod

=head1 NAME

MetaCPAN::Client::File - A File data object

=head1 VERSION

version 1.003000

=head1 DESCRIPTION

=head1 ATTRIBUTES

=head2 status

=head2 date

=head2 author

=head2 maturity

=head2 directory

=head2 indexed

=head2 documentation

=head2 id

=head2 module

=head2 authorized

=head2 pod_lines

=head2 version

=head2 binary

=head2 name

=head2 version_numified

=head2 release

=head2 path

=head2 description

=head2 stat

=head2 distribution

=head2 level

=head2 sloc

=head2 abstract

=head2 slop

=head2 mime

=head1 METHODS

=head2 pod

    my $pod = $module->pod(); # default = plain
    my $pod = $module->pod($type);

Returns the POD content for the module/file.

Takes a type as argument.

Supported types: B<plain>, B<html>, B<x-pod>, B<x-markdown>.

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
