use strict;
use warnings;
use Test::More;


use Catalyst::Test 'perlgoat';
use perlgoat::Controller::User;

ok( request('/user')->is_success, 'Request should succeed' );
done_testing();
