package Mojolicious::Plugin::MyAuth;

use Mojo::Base 'Mojolicious::Plugin';

sub register {
    my ( $self, $app ) = @_;

    $app->helper( auth => sub {
        my ( $self, $user, $pass ) = @_;
        return 1
            if $self->param('username') eq $user
                and $self->param('password') eq $pass;
    });
}

1;

