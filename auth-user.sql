CREATE TABLE account (
    id SERIAL,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created timestamp with time zone
);

ALTER TABLE account OWNER TO gene;

ALTER TABLE ONLY account
    ADD CONSTRAINT idx_16395_primary PRIMARY KEY (id);
