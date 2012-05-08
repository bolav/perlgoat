package perlgoat::Controller::List;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

perlgoat::Controller::List - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    my $dbh = DBI->connect("dbi:SQLite:dbname=perlgoat.db","","");
    my $sth = $dbh->prepare("SELECT * FROM admin");
    $sth->execute( );
    
    my $res = [];

    while ( my $hash = $sth->fetchrow_hashref ) {
        push @$res, $hash;
    }
    $c->stash->{res} = $res;
}


=head1 AUTHOR

Bjørn-Olav Strand

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
