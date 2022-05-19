-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE albums (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE producers (
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE
);

CREATE TABLE songs (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  album_id INTEGER REFERENCES albums(id) ON DELETE SET NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL
);

CREATE TABLE songs_artists (
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id) ON DELETE CASCADE,
  artist_id INTEGER REFERENCES artists(id) ON DELETE CASCADE
);

CREATE TABLE songs_producers (
  id SERIAL PRIMARY KEY,
  song_id INTEGER REFERENCES songs(id) ON DELETE CASCADE,
  producer_id INTEGER REFERENCES producers(id) ON DELETE SET NULL
);

INSERT INTO artists (name)
VALUES
('Hanson'), ('Queen'), ('Mariah Cary'), ('Boyz II Men'), ('Lady Gaga'), ('Bradley Cooper'), ('Nickelback'), ('Jay Z'),('Alicia Keys'), ('Katy Perry'), ('Juicy J'), ('Maroon 5'), ('Christina Aguilera'), ('Avril Lavigne'), ('Destiny''s Child');

INSERT INTO albums (name)
VALUES
('Middle of Nowhere'), ('A Night at the Opera'), ('Daydream'), ('A Star Is Born'), ('Silver Side Up'), ('The Blueprint 3'), ('Prism'), ('Hands All Over'), ('Let''s Go'), ('The Writing''s On The Wall');

INSERT INTO producers (name)
VALUES
('Dust Brothers'), ('Stephen Lironi'), ('Roy Thomas Barker'), ('Walter Afanasieff'), ('Benjamin Rice'), ('Rick Parashar'), ('Al Shux'), ('Max Martin'), ('Cirkuit'), ('Shellback'), ('Benny Blanco'), ('The Matrix'), ('Darkchild');

INSERT INTO songs (title, album_id, duration_in_seconds, release_date)
VALUES
('MMMBop', 1,238,'04-15-199'),
 ('Bohemian Rhapsody', 2,355, '10-31-1975'), 
 ('One Sweet Day', 3,282, '11-14-1995'), 
 ('Shallow', 4,216, '09-27-2018'), 
 ('How You Remind Me', 5,223, '08-21-2001'), 
 ('New York State of Mind', 6,276, '10-20-2009'), 
 ('Dark Horse', 7,215, '12-17-2013'), 
 ('Moves Like Jagger', 8,201, '06-21-2011'), 
 ('Complicated', 9,244, '05-14-2002'), 
 ('Say My Name', 10,240, '11-07-1999');

 INSERT INTO songs_artists (song_id, artist_id)
 VALUES
 (1, 1),
 (2, 2),
 (3, 3),
 (3, 4),
 (4, 5),
 (4, 6),
 (5, 7),
 (6, 8),
 (6, 9),
 (7, 10),
 (7, 11),
 (8, 12),
 (8, 13),
 (9, 14),
 (10, 15); 

INSERT INTO songs_producers (song_id, producer_id)
 VALUES
 (1, 1),
 (1,2),
 (2,3),
 (3, 4),
 (4,5),
 (5,6),
 (6, 7),
 (7, 8),
 (7, 9), 
 (8, 10),
 (8, 11),
 (9, 12),
 (10, 13);


-- INSERT INTO songs
--   (title, duration_in_seconds, release_date, artists, album, producers)
-- VALUES
--   ('MMMBop', 238, '04-15-1997', '{"Hanson"}', 'Middle of Nowhere', '{"Dust Brothers", "Stephen Lironi"}'),
--   ('Bohemian Rhapsody', 355, '10-31-1975', '{"Queen"}', 'A Night at the Opera', '{"Roy Thomas Baker"}'),
--   ('One Sweet Day', 282, '11-14-1995', '{"Mariah Cary", "Boyz II Men"}', 'Daydream', '{"Walter Afanasieff"}'),
--   ('Shallow', 216, '09-27-2018', '{"Lady Gaga", "Bradley Cooper"}', 'A Star Is Born', '{"Benjamin Rice"}'),
--   ('How You Remind Me', 223, '08-21-2001', '{"Nickelback"}', 'Silver Side Up', '{"Rick Parashar"}'),
--   ('New York State of Mind', 276, '10-20-2009', '{"Jay Z", "Alicia Keys"}', 'The Blueprint 3', '{"Al Shux"}'),
--   ('Dark Horse', 215, '12-17-2013', '{"Katy Perry", "Juicy J"}', 'Prism', '{"Max Martin", "Cirkut"}'),
--   ('Moves Like Jagger', 201, '06-21-2011', '{"Maroon 5", "Christina Aguilera"}', 'Hands All Over', '{"Shellback", "Benny Blanco"}'),
--   ('Complicated', 244, '05-14-2002', '{"Avril Lavigne"}', 'Let Go', '{"The Matrix"}'),
--   ('Say My Name', 240, '11-07-1999', '{"Destiny''s Child"}', 'The Writing''s on the Wall', '{"Darkchild"}';
