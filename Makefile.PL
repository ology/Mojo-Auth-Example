use inc::Module::Install;

name        'auth-helper';
all_from    'auth-helper';
license     'perl';

requires    'Mojolicious';
requires    'Mojolicious::Plugin::Bcrypt';
requires    'DBIx::Class';
requires    'DBIx::Class::Schema::Config';

auto_install(
    make_args   => '',   # option(s) for CPAN::Config
    force       => 1,    # pseudo-option to force install
    do_once     => 1,    # skip previously failed modules
);

WriteAll;
