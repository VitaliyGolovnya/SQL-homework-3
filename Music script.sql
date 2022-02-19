CREATE TABLE IF NOT EXISTS artists (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);
	
CREATE TABLE IF NOT EXISTS albums (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS genres (
	id SERIAL PRIMARY KEY,
	genre VARCHAR(60) NOT NULL
);

CREATE TABLE IF NOT EXISTS artistAlbum (
	artist_id INTEGER REFERENCES artists(id),
	album_id INTEGER REFERENCES albums(id),
	CONSTRAINT pk1 PRIMARY KEY (artist_id, album_id)
);

CREATE TABLE IF NOT EXISTS artistGenre (
	artist_id INTEGER REFERENCES artists(id),
	genre_id INTEGER REFERENCES genres(id),
	CONSTRAINT pk2 PRIMARY KEY (artist_id, genre_id)
);

CREATE TABLE IF NOT EXISTS tracks (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	album_id INTEGER REFERENCES albums(id)
);

CREATE TABLE IF NOT EXISTS compilations (
	id SERIAL PRIMARY KEY,
	title VARCHAR(60) NOT NULL,
	year INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS trackCompilation (
	compilation_id INTEGER REFERENCES compilations(id),
	track_id INTEGER REFERENCES tracks(id),
	CONSTRAINT pk3 PRIMARY KEY (compilation_id, track_id)
);