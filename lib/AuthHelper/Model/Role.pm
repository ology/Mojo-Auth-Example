package AuthHelper::Model::Role;

use Moo::Role;
use strictures 2;

use AuthHelper::Schema;

sub _schema {
    my ($self) = @_;

    my $dsn;

    if ( $self->conf->{type} eq 'SQLite' ) {
        $dsn = sprintf 'dbi:%s:dbname=%s', $self->conf->{type}, $self->conf->{name};
    }
    else {
        $dsn = sprintf 'dbi:%s:database=%s;host=%s;port=%d',
            $self->conf->{type}, $self->conf->{name}, $self->conf->{host}, $self->conf->{port};
    }

    my $schema = AuthHelper::Schema->connect( $dsn, $self->conf->{user}, $self->conf->{pass} );

    return $schema;
}

1;
