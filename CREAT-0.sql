CREATE TABLE IF NOT EXISTS Genre (
	id SERIAL PRIMARY KEY,
	title_g VARCHAR (60) NOT NULL
);

CREATE TABLE IF NOT EXISTS Singer (
	id SERIAL PRIMARY KEY,
	name VARCHAR (60) UNIQUE NOT NULL
);
	
CREATE TABLE IF NOT EXISTS Albom (
	id SERIAL PRIMARY KEY,
	title VARCHAR (60) NOT NULL,
	year date
);
	
CREATE TABLE IF NOT EXISTS Song (
	id SERIAL PRIMARY KEY,
	title_song VARCHAR (60) UNIQUE NOT NULL,
	long INTEGER NOT NULL, 
	Albom_id_s INTEGER NOT NULL REFERENCES Albom(id)
);
	
CREATE TABLE IF NOT EXISTS Collection (
	id SERIAL PRIMARY KEY,
	title VARCHAR (60) UNIQUE NOT NULL,
	year date
);
	
CREATE TABLE IF NOT EXISTS GenreSinger (
	id SERIAL PRIMARY KEY,
	Genre_id INTEGER NOT NULL REFERENCES Genre(id),
	Singer_id_g INTEGER NOT NULL REFERENCES Singer(id)
);


CREATE TABLE IF NOT EXISTS SingerAlbom (
	id SERIAL PRIMARY KEY,
	Singer_id INTEGER NOT NULL REFERENCES Singer(id),
	Albom_id INTEGER NOT NULL REFERENCES Albom(id)
);

CREATE TABLE IF NOT EXISTS SongCollection (
	id SERIAL PRIMARY KEY,
	Song_id INTEGER NOT NULL REFERENCES Song(id),
	Collection_id INTEGER NOT NULL REFERENCES Collection(id)
);

--DROP TABLE Genre;
--DROP TABLE Singer;
--DROP TABLE Albom;
--DROP TABLE Song;
--DROP TABLE Collection;
--DROP TABLE GenreSinger;
--DROP TABLE SingerAlbom;
--DROP TABLE SongCollection;