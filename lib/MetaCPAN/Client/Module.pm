use strict;
use warnings;
package MetaCPAN::Client::Module;
# ABSTRACT: A Module data object
$MetaCPAN::Client::Module::VERSION = '1.007001';
use Moo;
extends 'MetaCPAN::Client::File';

1;

__END__

=pod

=encoding UTF-8

=head1 NAME

MetaCPAN::Client::Module - A Module data object

=head1 VERSION

version 1.007001

=head1 DESCRIPTION

This is currently the exact same as L<MetaCPAN::Client::File>.

=head1 ATTRIBUTES

Whatever L<MetaCPAN::Client::File> has.

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
