use record_company;

-- 2. Select only the Names of all the Bands
select bands.name as 'Band Name'
from bands;

-- 3. Select the Oldest Album
select * from albums
where release_year is not null
order by release_year
limit 1;

-- 4. Get all Bands that have Albums
select distinct bands.name as 'Band Name'
from bands 
join albums on bands.id = albums.band_id;

-- 5. Get all Bands that have No Albums
select bands.name as 'Band Name'
from bands
left join albums on bands.id = albums.band_id
group by albums.id
having count(albums.id) = 0;

-- 6. Get the Longest Album
select 
	albums.name as 'Name',
    albums.release_year as 'Release Year',
    sum(songs.length) as 'Duration'
from albums
join songs on albums.id = songs.album_id
group by songs.album_id
order by Duration desc
limit 1;

-- 7. Update the Release Year of the Album with no Release Year
select * from albums
where release_year is null;

update albums
set release_year = 1986
where id = 4;

-- 8. Insert a record for your favorite Band and one of their Albums
insert into bands(name)
values ('Haken');

select * from bands 
order by id desc
limit 1;

insert into albums(name, release_year, band_id)
values('Vector', 2018, 8);

select * from albums 
order by id desc
limit 1;

-- 9. Delete the Band and Album you added in #8
select * from albums;
delete from albums 
where id = 19;

select * from bands;
delete from bands 
where id = 8;

-- 10. Get the Average Length of all Songs
select avg(length) as 'Average Song Duration'
from songs;

-- 11. Select the longest Song off each Album
select 
		albums.name as 'Album',
        albums.release_year as 'Release Year',
        max(songs.length) as 'Duration'
from albums 
join songs on albums.id = songs.album_id
group by songs.album_id;

-- 12. Get the number of Songs for each Band
select 
	bands.name as 'Band',
	count(songs.id) as 'Number of Songs'
from bands
join albums on bands.id = albums.band_id
join songs on albums.id = songs.album_id
group by albums.band_id;




