package AuthHelper::Model::Account;

use Moo;

use AuthHelper::Schema;

sub search_by_name {
    my ( $self, $app, $user ) = @_;

    my $schema = _schema($app);
    my $result = $schema->resultset('Account')->search({ name => $user })->first;

    return $result;
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
