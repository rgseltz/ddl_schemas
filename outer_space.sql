-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

CREATE TABLE galaxies
(
  id SERIAL PRIMARY KEY,
  galaxy_name TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moon_name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies(id) ON DELETE SET NULL
);

CREATE TABLE stars
(
  id SERIAL PRIMARY KEY,
  star_name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies(id) ON DELETE SET NULL
);

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  planet_name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  star_id INTEGER REFERENCES stars(id) ON DELETE CASCADE,
  galaxy_id INTEGER REFERENCES galaxies(id) ON DELETE CASCADE,
  moon_id INTEGER REFERENCES moons(id) ON DELETE CASCADE
);

CREATE TABLE planets_stars
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets(id) ON DELETE CASCADE,
  star_id INTEGER REFERENCES stars(id) ON DELETE CASCADE
);

CREATE TABLE planets_moons
(
  id SERIAL PRIMARY KEY,
  planet_id INTEGER REFERENCES planets(id) ON DELETE CASCADE,
  moon_id INTEGER REFERENCES moons(id) ON DELETE CASCADE
);

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   -- ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');

  INSERT INTO galaxies
  (galaxy_name)
  VALUES
  ('Milky Way');

  INSERT INTO moons
  (moon_name, galaxy_id)
  VALUES
  ('The Moon', 1),
  ('Phobos', 1),
  ('Deimos', 1);

  INSERT INTO stars
  (star_name, galaxy_id)
  VALUES
  ('The Sun', 1),
  ('Proxima Centauri', 1),
  ('Gliese 876', 1);

  INSERT INTO planets
  (planet_name, orbital_period_in_years, galaxy_id)
  VALUES
  ('Earth', 1 , 1),
  ('Mars', 1.88, 1),
  ('Venus', 0.62, 1),
  ('Proxima Centauri b', 0.3, 1),
  ('Gliese 876 b', 0.23, 1);

  INSERT INTO planets_stars
  (planet_id, star_id)
  VALUES
  (1, 1),
  (2, 1),
  (3, 1),
  (4, 2),
  (5, 3);

  INSERT INTO planets_moons
  (planet_id, moon_id)
  VALUES
  (1, 1),
  (2, 2),
  (3, 3),
  (4, NULL),
  (5, NULL);

