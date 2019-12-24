CREATE TABLE account (
    id SERIAL,
    name text NOT NULL,
    password text NOT NULL,
    created timestamp with time zone
);

ALTER TABLE account OWNER TO gene;

ALTER TABLE ONLY account
    ADD CONSTRAINT idx_16395_primary PRIMARY KEY (id);
