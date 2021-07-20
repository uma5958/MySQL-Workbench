use Record_Company;

create table Bands(
	id int not null auto_increment,
    name varchar(255) not null,
    primary key(id)
);

create table Albums(
	id int not null auto_increment,
    name varchar(255) not null,
    release_year int,
    band_id int not null,
    primary key(id),
    foreign key(band_id) references bands(id)
);

insert into bands(name)
values('Iron Maiden');										-- inserting 1 values
insert into bands(name)
values('Deuce'), ('Avenged Sevenfold'), ('Ankor');			-- inserting multiple records

select * from bands;
select * from bands limit 2;								-- Returns top 2 reocrds using LIMIT keyword
select name from bands;
select id as 'ID', name as 'Band Name' from bands;			-- Displays column names as given 
select * from bands order by name;							-- By default ascending order
select * from bands order by name asc;
select * from bands order by name desc;

insert into albums(name, release_year, band_id)
values ('The Number of the Beasts', 1985, 1),
	   ('Power Slave', 1984, 1),
	   ('Nightmare', 2018, 2),
	   ('Nightmare', 2010, 3),
	   ('test Album', null, 3);
       
select * from albums;
select name from albums;
select distinct name from albums;							-- Displays only unique items

update albums 
set release_year=1982
where id=1;													-- Where clause

select * from albums
where release_year < 2000;									-- < and > 

select * from albums 
where name like '%er%';										-- Like keyword

select * from albums
where name like '%er%' or band_id=2;						-- Or keyword

select * from albums 
where release_year=1984 and band_id=1;						-- And keyword

select * from albums
where release_year between 2000 and 2018;					-- Between keyword

select * from albums
where release_year is null;									-- Filter nulls

delete from albums where id = 5;							-- Delete items
select * from albums;

-- Joins
select * from bands
join albums on bands.id = albums.band_id;					-- If use only Join that is by default Inner Join

select * from bands
inner join albums on bands.id = albums.band_id;

select * from bands
left join albums on bands.id = albums.band_id;				-- All rows in first(left) table will be displayed appending with second table based on given condition

select * from albums
right join bands on bands.id = albums.band_id;				-- All rows in secomd(right) table will be displayed appending with second table(left) based on given condition

select avg(release_year) from albums;						-- Returns the Average of the the given column

select sum(release_year) from albums;						-- Returns the Sum of the the given column

-- Little Complex Queries

select b.name as band_name, count(a.id) as num_albums
from bands as b 
left join albums as a on b.id = a.band_id
group by b.id; 


select b.name as band_name, count(a.id) as num_albums
from bands as b 
left join albums as a on b.id = a.band_id
group by b.id
having num_albums = 1; 

select b.name as band_name, count(a.id) as num_albums
from bands as b 
left join albums as a on b.id = a.band_id
where b.name = 'Deuce'
group by b.id
having num_albums = 1; 

