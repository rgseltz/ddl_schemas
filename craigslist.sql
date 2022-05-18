DROP DATABASE craigslist_db;
CREATE DATABASE craigslist_db;
\c craigslist_db;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(15) UNIQUE NOT NULL,
    password VARCHAR(15) UNIQUE NOT NULL,
    contact TEXT NOT NULL,
    region TEXT
);


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    item TEXT NOT NULL,
    description TEXT NOT NULL,
    price REAL NOT NULL,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories(id) ON DELETE SET NULL,
    region TEXT REFERENCES region(name)
);

INSERT INTO users (username, password, contact) 
VALUES
('zingbaba21', 'holyshmackle94', 'sculpta454@zingba.com');

INSERT INTO users (username, password, contact)
VALUES
('nobelboy5', 'stimXt54', 'genius@google.com');

INSERT INTO users (username, password, contact)
VALUES
('lootkilla74', 'ldisp3', 'moneyman23@yahoo.com');