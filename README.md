# Mojolicious Authorization Example
Simplistic, Mojolicious::Lite + DBIx::Class + Bcrypt user authorization example

Postgres instructions:

> perl Makefile.PL

> make installdeps

> Fix the user and password in dbic.yaml

> createdb auth

> psql auth < auth-helper.sql

> perl bin/add-auth-user foo abc123

> prove -l t

> morbo auth-helper # Then browse to http://127.0.0.1:3000 
