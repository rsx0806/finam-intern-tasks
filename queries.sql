CREATE TABLE genres (
	genre_id serial PRIMARY KEY,
	name VARCHAR ( 255 ) NOT NULL
);

CREATE TABLE singers (
	singer_id serial PRIMARY KEY,
	name VARCHAR ( 255 ) NOT NULL
);

create table songs (
  song_id serial PRIMARY KEY,
  name	varchar(255),
  singer integer,
  genre integer[],
  duration int,
  release_date date
);

insert into singers (name) values ('ABBA'),('Mariah Carey'),('Pink Floyd'),('Led Zeppelin'),('Rammstein'),('AC/DC');
insert into genres (name) values ('Rock'),('Pop'),('R&B'),('Blues');


insert into songs (name,singer,genre,duration,release_date) values ('Waterloo', 1, '{1,2}',180, '1974-04-20');
insert into songs (name,singer,genre,duration,release_date) values ('Ring Ring', 1, '{1,2}',190, '1974-07-13');
insert into songs (name,singer,genre,duration,release_date) values ('SOS', 1, '{1,2}',280, '1975-04-20');
insert into songs (name,singer,genre,duration,release_date) values ('FERNANDO', 1, '{1,2}',120, '1976-03-27');
insert into songs (name,singer,genre,duration,release_date) values ('I HAVE A DREAM', 1, '{1,2}',180, '1979-12-15');

insert into songs (name,singer,genre,duration,release_date) values ('5/4', 5, '{1}',330, '2000-04-16');
insert into songs (name,singer,genre,duration,release_date) values ('Adios', 5, '{1}',231, '2002-07-13');
insert into songs (name,singer,genre,duration,release_date) values ('Amerika', 5, '{1}',231, '2004-10-13');

insert into songs (name,singer,genre,duration,release_date) values ('All in Your Mind', 2, '{2}',280, '1990-02-13');
insert into songs (name,singer,genre,duration,release_date) values ('I Wish You Knew', 2, '{2}',214, '2005-10-13');

insert into songs (name,singer,genre,duration,release_date) values ('A Great Day for Freedom', 3, '{1,4}',280, '1994-07-09');
insert into songs (name,singer,genre,duration,release_date) values ('A New Machine (Part 1)', 3, '{1,4}',106, '1987-03-25');

insert into songs (name,singer,genre,duration,release_date) values ('Desire (bonus)', 4, '{1,4}',310, '2015-07-09');
insert into songs (name,singer,genre,duration,release_date) values ('LA Drone', 4, '{1,4}',250, '2003-05-25');

select
    distinct songs.name as song, singers.name as singer, songs.duration as duration, songs.release_date as release_date
from 
    songs
    inner join singers on singers.singer_id = songs.singer
    inner join genres on genres.genre_id = ANY (songs.genre)
where 1 = ANY (songs.genre)
order by songs.release_date desc limit 10;

select 
    count(*) as songs_count, singers.name 
from
    songs 
    inner join singers on singers.singer_id = songs.singer
group by singers.name order by songs_count desc limit 5;



