package perlgoat::View::TT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    render_die         => 1,
    WRAPPER            => 'site/wrapper.tt',
);

=head1 NAME

perlgoat::View::TT - TT View for perlgoat

=head1 DESCRIPTION

TT View for perlgoat.

=head1 SEE ALSO

L<perlgoat>

=head1 AUTHOR

Bjørn-Olav Strand

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
