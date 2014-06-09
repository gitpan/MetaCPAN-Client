use strict;
use warnings;
package MetaCPAN::Client::Pod;
# ABSTRACT: A Pod object
$MetaCPAN::Client::Pod::VERSION = '1.005000';
use Moo;

has name => ( is => 'ro', required => 1 );

my @known_formats = qw<
    html plain x_pod x_markdown
>;

foreach my $format (@known_formats) {
    has $format => (
        is      => 'ro',
        lazy    => 1,
        default => sub {
            my $self = shift;
            return $self->_request( $format );
        },
    );
}

sub _request {
    my $self   = shift;
    my $ctype  = shift || "plain";

    $ctype =~ s/_/-/;

    my $name = $self->name;

    require MetaCPAN::Client::Request;

    return
        MetaCPAN::Client::Request->new->fetch(
            "pod/${name}?content-type=text/${ctype}"
        );
}


1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MetaCPAN::Client::Pod - A Pod object

=head1 VERSION

version 1.005000

=head1 SYNOPSIS

  use strict;
  use warnings;
  use MetaCPAN::Client;
  
  my $pod = MetaCPAN::Client->new->pod('Moo');
  
  print $pod->html;

=head1 DESCRIPTION

=head1 ATTRIBUTES

=head2 name

=head2 x_pod

=head2 html

=head2 x_markdown

=head2 plain

Get the plaintext version of the documentation

  $pod = MetaCPAN::Client->new->pod( "MetaCPAN::Client" );
  print $pod->plain;

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
