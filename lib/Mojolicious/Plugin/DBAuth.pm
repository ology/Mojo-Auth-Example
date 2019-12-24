package Mojolicious::Plugin::DBAuth;

use Mojo::Base 'Mojolicious::Plugin';

use AuthHelper::Schema;
use Mojolicious::Plugin::Bcrypt;

sub register {
    my ( $self, $app ) = @_;

    $app->helper( auth => sub {
        my ($c) = @_;

        my $schema = _schema($app);
        my $result = $schema->resultset('Account')->search({ name => $c->param('username') })->single;

        return 1
            if $result && $c->bcrypt_validate( $c->param('password'), $result->password );
    } );
}

sub _schema {
    my ($app) = @_;

    my $config = $app->plugin('Config');
    my $db = $config->{db};

    my $dsn = sprintf 'dbi:%s:database=%s;host=%s;port=%d',
        $db->{type}, $db->{name}, $db->{host}, $db->{port};

    my $schema = AuthHelper::Schema->connect( $dsn, $db->{user}, $db->{pass} );

    return $schema;
}

1;
