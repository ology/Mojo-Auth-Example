package AuthHelper::Model::Account;

use Moo;
use strictures 2;

use AuthHelper::Schema;

has app => (
    is => 'ro',
);

has name => (
    is => 'ro',
);

sub search_by_name {
    my ($self) = @_;

    my $schema = $self->_schema();
    my $result = $schema->resultset('Account')->search({ name => $self->name })->first;

    return $result;
}

sub _schema {
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
