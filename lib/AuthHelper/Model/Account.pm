package AuthHelper::Model::Account;

use Moo;
use strictures 2;

with('AuthHelper::Model::Role');

use AuthHelper::Schema;

has app => (
    is => 'ro',
);

has name => (
    is => 'ro',
);

sub search_by_name {
    my ($self) = @_;

    my $schema = $self->schema();
    my $result = $schema->resultset('Account')->search({ name => $self->name })->first;

    return $result;
}

1;
