CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    name text NOT NULL UNIQUE,
    password text NOT NULL,
    created timestamptz NOT NULL DEFAULT current_timestamp
);
