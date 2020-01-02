use Test::More;
use Test::Mojo::Session;
use Mojo::File qw( path );
use Data::Dumper;

my $t = Test::Mojo::Session->new( path('auth-helper') );

# Allow 302 redirect responses
$t->ua->max_redirects(1);

# Test if the HTML login form exists
$t->get_ok('/')
  ->status_is(200)
  ->element_exists('form input[name="username"]')
  ->element_exists('form input[name="password"]')
  ->element_exists('form input[type="submit"]');

# Test login with valid credentials
$t->post_ok('/login' => form => {username => 'gene', password => 'abc123'})
  ->status_is(200)
  ->session_ok
  ->session_has('/auth')
  ->session_is('/auth' => '1')
  ->or(sub { diag Dumper $t->tx->res->json });

# Test accessing a protected page
$t->get_ok('/auth')
  ->status_is(200)
  ->content_like(qr/Authorized/);

# Test if HTML login form shows up again after logout
$t->get_ok('/logout')
  ->status_is(200)
  ->element_exists('form input[name="username"]')
  ->element_exists('form input[name="password"]')
  ->element_exists('form input[type="submit"]');

done_testing();
