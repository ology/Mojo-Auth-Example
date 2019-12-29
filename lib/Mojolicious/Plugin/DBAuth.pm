package Mojolicious::Plugin::DBAuth;

use Mojo::Base 'Mojolicious::Plugin';

use Mojolicious::Plugin::Bcrypt;

use AuthHelper::Schema;

sub register {
    my ( $self, $app ) = @_;

    $app->helper( schema => sub {
        my ($c) = @_;

        my $schema = AuthHelper::Schema->connect('auth');

        return $schema;
    } );

    $app->helper( auth => sub {
        my ($c) = @_;

        my $result = $c->schema->resultset('Account')->search_by_name( $c->param('username') );

        return 1
            if $result && $c->bcrypt_validate( $c->param('password'), $result->password );
    } );

    $app->helper( add => sub {
        my ($c) = @_;

        return 0
            unless $c->param('username') && $c->param('password');

        my $result = $c->schema->resultset('Account')->create_new(
            $c->param('username'),
            $c->bcrypt( $c->param('password') )
        );

        return $result;
    } );

}

1;
