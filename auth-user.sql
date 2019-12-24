CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    password text NOT NULL,
    created timestamp NOT NULL DEFAULT current_timestamp
);
