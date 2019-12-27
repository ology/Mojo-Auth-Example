package AuthHelper::Model::Role;

use Moo::Role;
use strictures 2;

sub schema {
    my ($self) = @_;

    my $config = $self->app->plugin('Config');
    my $db = $config->{db};

    my $dsn;
    if ( $db->{type} eq 'SQLite' ) {
        $dsn = sprintf 'dbi:%s:dbname=%s', $db->{type}, $db->{name};
    }
    else {
        $dsn = sprintf 'dbi:%s:database=%s;host=%s;port=%d',
            $db->{type}, $db->{name}, $db->{host}, $db->{port};
    }

    my $schema = AuthHelper::Schema->connect( $dsn, $db->{user}, $db->{pass} );

    return $schema;
}

1;
