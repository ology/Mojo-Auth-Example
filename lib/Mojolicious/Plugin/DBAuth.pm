package Mojolicious::Plugin::DBAuth;

use Mojo::Base 'Mojolicious::Plugin';

use AuthHelper::Model::Account;
use Mojolicious::Plugin::Bcrypt;

sub register {
    my ( $self, $app ) = @_;

    my $config = $app->plugin('Config');

    $app->helper( auth => sub {
        my ($c) = @_;

        return 0
            unless $c->param('username');

        my $account = AuthHelper::Model::Account->new(
            conf => $config->{db},
            name => $c->param('username'),
        );

        my $result = $account->search_by_name();

        return 1
            if $result && $c->bcrypt_validate( $c->param('password'), $result->password );
    } );

    $app->helper( add => sub {
        my ($c) = @_;

        return 0
            unless $c->param('username') && $c->param('password');

        my $account = AuthHelper::Model::Account->new(
            conf     => $config->{db},
            name     => $c->param('username'),
            password => $c->bcrypt( $c->param('password') ),
        );

        my $result = $account->create();

        return $result ? 1 : 0;
    } );

}

1;
