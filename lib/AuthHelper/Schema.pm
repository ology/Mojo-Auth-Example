use utf8;
package AuthHelper::Schema;

use strict;
use warnings;

use base 'DBIx::Class::Schema::Config'; # NOTE ::Config which allows schema connect

__PACKAGE__->load_namespaces;

1;
