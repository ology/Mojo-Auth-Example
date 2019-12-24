package Mojolicious::Plugin::DBAuth;

use Mojo::Base 'Mojolicious::Plugin';

use AuthHelper::Model::Account;
use Mojolicious::Plugin::Bcrypt;

sub register {
    my ( $self, $app ) = @_;

    $app->helper( auth => sub {
        my ($c) = @_;

        my $account = AuthHelper::Model::Account->new;
        my $result = $account->search_by_name( $app, $c->param('username') );

        return 1
            if $result && $c->bcrypt_validate( $c->param('password'), $result->password );
    } );
}

1;
