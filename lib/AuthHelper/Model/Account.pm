package AuthHelper::Model::Account;

use Moo;
use strictures 2;

with('AuthHelper::Model::Role');

use AuthHelper::Schema;

has conf => (
    is => 'ro',
);

has name => (
    is => 'ro',
);

has password => (
    is => 'ro',
);

sub search_by_name {
    my ($self) = @_;

    my $schema = $self->schema();
    my $result = $schema->resultset('Account')->search({ name => $self->name })->first;

    return $result;
}

sub create {
    my ($self) = @_;

    my $schema = $self->schema();
    my $result = $schema->resultset('Account')->create(
        {
            name     => $self->name,
            password => $self->password,
        }
    );

    return $result;
}

1;
