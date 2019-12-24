-- PostgreSQL
CREATE TABLE account (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    created TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- SQLite
-- CREATE TABLE account (
--     id INTEGER PRIMARY KEY AUTOINCREMENT,
--     name TEXT NOT NULL UNIQUE,
--     password TEXT NOT NULL,
--     created DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
-- );

-- MySQL
-- CREATE TABLE account (
--     id INT PRIMARY KEY AUTO_INCREMENT,
--     name VARCHAR(255) NOT NULL UNIQUE,
--     password VARCHAR(255) NOT NULL,
--     created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP()
-- );
