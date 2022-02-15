create table if not exists Artists (
	id serial primary key,
	Name varchar(60) not null
);
	
create table if not exists Albums (
	id serial primary key,
	Title varchar(60) not null,
	year integer not null
);

create table if not exists Genres (
	id serial primary key,
	Genre varchar(60) not null
);

create table if not exists ArtistAlbum (
	Artist_id integer references Artists(id),
	Album_id integer references Albums(id),
	constraint pk1 primary key (Artist_id, Album_id)
);

create table if not exists ArtistGenre (
	Artist_id integer references Artists(id),
	Genre_id integer references Genres(id),
	constraint pk2 primary key (Artist_id, Genre_id)
);

create table if not exists Tracks (
	id serial primary key,
	Title varchar(60) not null,
	Album_id integer references Albums(id)
);

create table if not exists Compilations (
	Title varchar(60) not null,
	year integer not null,
	Track_id integer references Tracks(id),
	constraint pk3 primary key (Title, Track_id)
);