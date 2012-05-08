package perlgoat::Controller::User;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }
use DBI;

use Data::Dump qw/dump dd/;

=head1 NAME

perlgoat::Controller::User - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

}

sub login : Path('/login') {
    my ( $self, $c ) = @_;
    
    my $user = $c->req->param('username');
    my $pass = $c->req->param('password');
    my $sql = "SELECT * FROM admin WHERE username='$user' AND password ='$pass'";
    $c->log->debug($sql);
    my $dbh = DBI->connect("dbi:SQLite:dbname=perlgoat.db","","");
    my $sth = $dbh->prepare($sql);
    $sth->execute( );

    while ( my $hash = $sth->fetchrow_hashref ) {
      $c->response->cookies->{admin}    = { value => $hash->{admin} };
      $c->response->cookies->{userid}   = { value => $hash->{id} };
      $c->response->cookies->{username} = { value => $hash->{username} };
      $c->stash->{admin} = $hash->{admin};
    }

}

sub logout : Path('/logout') {
    my ( $self, $c ) = @_;
    $c->response->cookies->{admin}    = { value => 0 };
    $c->response->cookies->{userid}   = { value => 0 };
    $c->response->cookies->{username} = { value => 0 };
}


=head1 AUTHOR

Bjørn-Olav Strand

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
