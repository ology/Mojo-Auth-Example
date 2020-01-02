use Mojo::Base -strict;
use Test::More;
use Test::Mojo;
use Mojo::File qw( path );
use Data::Dumper;

my $t = Test::Mojo->new( path('auth-helper') );

isa_ok $t->app->schema, 'AuthHelper::Schema';

is $t->app->auth( 'gene', 'abc123' ), '1', 'auth';

isa_ok $t->app->add( 'test-' . time(), 'foo' ), 'AuthHelper::Schema::Result::Account';

isa_ok $t->app->accounts, 'AuthHelper::Schema::ResultSet::Account';

done_testing();
