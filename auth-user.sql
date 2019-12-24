CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    name text NOT NULL,
    password text NOT NULL,
    created timestamp with time zone
);

ALTER TABLE account OWNER TO gene;
