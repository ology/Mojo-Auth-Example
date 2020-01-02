# Mojolicious Authorization Example
Simplistic, Mojolicious::Lite + DBIx::Class + Bcrypt user authorization example

Postres instructions:

> createdb auth

> psql auth < auth-helper.sql

> perl bin/add-auth-user foo abc123

> prove -lr t

> http://127.0.0.1:3000 
