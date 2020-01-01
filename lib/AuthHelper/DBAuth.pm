package AuthHelper::DBAuth;

use Mojo::Base 'Mojolicious::Plugin';

use AuthHelper::Schema;

sub register {
    my ( $self, $app ) = @_;

    $app->helper( schema => sub {
        my ($c) = @_;

        return state $schema = AuthHelper::Schema->connect( $c->config('database') );
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

    $app->helper( accounts => sub {
        my ($c) = @_;

        my $result = $c->schema->resultset('Account');

        return $result;
    } );

}

1;
