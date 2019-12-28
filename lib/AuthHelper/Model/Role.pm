package AuthHelper::Model::Role;

use Moo::Role;
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

1;
