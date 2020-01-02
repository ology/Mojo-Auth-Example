use Mojo::Base -strict;
use Test::More;
use Test::Mojo;
use Mojo::File qw( path );

my $t = Test::Mojo->new( path('auth-helper') );

my $config = $t->app->config;

isa_ok $config, 'HASH';

isa_ok $t->app->schema, 'AuthHelper::Schema';

is $t->app->auth( $config->{test_user}, $config->{test_pass} ), '1', 'auth';

isa_ok $t->app->add( 'test-' . time(), $config->{test_pass} ), 'AuthHelper::Schema::Result::Account';

isa_ok $t->app->accounts, 'AuthHelper::Schema::ResultSet::Account';

done_testing();
