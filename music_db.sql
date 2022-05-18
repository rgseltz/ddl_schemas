DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  song_id INTEGER REFERENCES songs(id) 
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  song_id INTEGER REFERENCES songs(id)
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE,
  song_id INTEGER REFERENCES songs(id)
);

INSERT INTO songs (title, duration_in_seconds, release_date)
VALUES
('MMMBop', 238,'04-15-199'),
 ('Bohemian Rhapsody',355, '10-31-1975'), 
 ('One Sweet Day',282, '11-14-1995'), 
 ('Shallow', 216, '09-27-2018'), 
 ('How You Remind Me', 223, '08-21-2001'), 
 ('New York State of Mind', 276, '10-20-2009'), 
 ('Dark Horse', 215, '12-17-2013'), 
 ('Moves Like Jagger', 201, '06-21-2011'), 
 ('Complicated', 244, '05-14-2002'), 
 ('Say My Name', 240, '11-07-1999');

INSERT INTO artists (name, song_id)
VALUES
('Hanson', 1), ('Queen', 2), ('Mariah Cary', 3), ('Boyz II Men', 3), ('Lady Gaga', 4), ('Bradley Cooper', 4), ('Nickelback', 5), ('Jay Z', 6),('Alicia Keys', 6), ('Katy Perry', 7), ('Juicy J', 7), ('Maroon 5', 8), ('Christina Aguilera', 8), ('Avril Lavigne', 9), ('Destiny''s Child', 10);

INSERT INTO albums (name, song_id)
VALUES
('Middle of Nowhere', 1),
('A Night at the Opera', 2),
('Daydream', 3),
('A Star Is Born', 4),
('Silver Side Up',5),
('The Blueprint 3',6), 
('Prism',7),
('Hands All Over', 8),
('Let''s Go',9),
('The Writing''s On The Wall', 10);

INSERT INTO producers (name, song_id)
VALUES
('Dust Brothers', 1), ('Stephen Lironi', 1),
    ('Roy Thomas Barker', 2),
    ('Walter Afanasieff', 3),
    ('Benjamin Rice', 4),
     ('Rick Parashar', 5), 
     ('Al Shux', 6), 
     ('Max Martin', 7), ('Cirkuit', 7), 
     ('Shellback', 8), ('Benny Blanco', 8), 
     ('The Matrix', 9), 
     ('Darkchild', 10);