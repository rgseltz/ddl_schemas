DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic



  CREATE TABLE airlines (
  id SERIAL PRIMARY KEY, 
  name TEXT UNIQUE
  );

  CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
  ); 
  
  CREATE TABLE passengers (
  id SERIAL PRIMARY KEY, 
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL
  );

  CREATE TABLE cities (
  id  SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  country_id INTEGER REFERENCES countries(id) ON DELETE SET NULL
  );

  CREATE TABLE tickets (
  id SERIAL PRIMARY KEY, 
  passenger_id INTEGER REFERENCES passengers ON DELETE CASCADE,
  airline_id INTEGER REFERENCES airlines,
  departure DATE,
  arrival DATE,
  from_country_id INTEGER REFERENCES countries(id),
  to_country_id INTEGER REFERENCES countries(id),
  from_city_id INTEGER REFERENCES cities(id),
  to_city_id INTEGER REFERENCES cities(id),
  seat VARCHAR(3)
  );

INSERT INTO airlines (name) 
VALUES ('United'), ('British Airways'), ('Delta'), ('TUI Fly Belgium'), ('Air China'), ('American Airlines'), ('Avianca Brasil');

INSERT INTO countries (name)
VALUES ('United States'), ('Japan'), ('United Kingdom'), ('Mexico'), ('France'), ('Morocco'), ('UAE'), ('China'), ('Brazil'), ('Chile');

INSERT INTO cities (name, country_id) 
VALUES ('Washington DC', 1), ('Seattle', 1), ('Tokyo',2), ('London', 3), ('Los Angeles', 1), ('Las Vegas', 1), ('',), ('', ),