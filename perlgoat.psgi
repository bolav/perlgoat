use strict;
use warnings;

use perlgoat;

my $app = perlgoat->apply_default_middlewares(perlgoat->psgi_app);
$app;

