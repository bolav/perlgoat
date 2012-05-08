use strict;
use warnings;
use Test::More;


use Catalyst::Test 'perlgoat';
use perlgoat::Controller::List;

ok( request('/list')->is_success, 'Request should succeed' );
done_testing();
