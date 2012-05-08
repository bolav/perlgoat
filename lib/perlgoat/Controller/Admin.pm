package perlgoat::Controller::Admin;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use Data::Dump qw/dump dd/;
=head1 NAME

perlgoat::Controller::Admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


sub auto :Private {
    my ($self, $c) = @_;

    my $admin_cookie = $c->req->cookie('admin');
    if ($admin_cookie and $admin_cookie->value) {
        $c->stash->{admin} = 1;
    }
    else {
        $c->response->cookies->{admin} = { value => 0 };
    }
}

=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    if (!$c->stash->{admin}) {
         $c->response->redirect( $c->uri_for('/login') );
    }
}

sub adduser :Local {
    my ( $self, $c ) = @_;

    my $user = $c->req->param('username');
    my $pass = $c->req->param('password');
    my $name = $c->req->param('name');
    my $admin = $c->req->param('admin');
    my $sql = "INSERT INTO admin (name,username,password,admin) VALUES ('$name','$user','$pass','$admin')";
    my $dbh = DBI->connect("dbi:SQLite:dbname=perlgoat.db","","");
    my $sth = $dbh->do($sql);
    $c->log->debug($sql);
}


=head1 AUTHOR

Bjørn-Olav Strand

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
