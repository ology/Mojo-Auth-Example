package AuthHelper::Model::Account;

use Moo;
use strictures 2;

use AuthHelper::Schema;

has schema => (
    is      => 'ro',
    builder => 1,
);

sub _build_schema {
    my ($self) = @_;
    return AuthHelper::Schema->connect('auth');
}

has name => (
    is => 'ro',
);

has password => (
    is => 'ro',
);

sub search_by_name {
    my ($self) = @_;

    my $result = $self->schema->resultset('Account')->search({ name => $self->name })->first;

    return $result;
}

sub create {
    my ($self) = @_;

    my $result = $self->schema->resultset('Account')->create(
        {
            name     => $self->name,
            password => $self->password,
        }
    );

    return $result;
}

1;
