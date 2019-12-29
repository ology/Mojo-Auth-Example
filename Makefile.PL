use inc::Module::Install;

name        'auth-helper';
all_from    'auth-helper';
license     'perl';

requires    'Mojolicious::Lite';
requires    'Mojolicious::Plugin::Bcrypt';
requires    'DBIx::Class';
requires    'DBIx::Class::Schema::Config';

WriteAll;
