use nal;

-- SQL Constrains
-- Rules -- Data
-- NOT NULL

create table Employee2(
	ID int not null,
    FirstName varchar(255) not null,
    LastName varchar(255) not null,
    Age int
);

insert into Employee2(ID, FirstName, LastName, Age)
	values(1, 'Tom', 'Peter', 25), (2, 'Naveen', 'Peter', null);
    
select * from employee2;

-- Primary Key: Constrains:
-- Must contains unique values (Duplicates not allowed to add)
-- Can't hold any null values 
-- Can have only one Primary key 
-- But can contain single or multiple Columns 

-- MYSQL
create table Student(
	ID int not null,
	FirstName varchar(255) not null,
	LastName varchar(255) not null,
    Age int,
    primary key(ID)
 );
 
 insert into Student values(1, "Tom", "Peter", 20);
 select * from Student;
 -- insert into Student values(null, "Tommy", "Stev", 21);
 
 -- SQL Server, Oracle
create table Employee3(
	ID int not null primary key,
	FirstName varchar(255) not null,
	LastName varchar(255) not null,
    Age int
);

insert into Employee3 values(1, "Tom", "Peter", 20);
select * from Employee3;
-- insert into Employee3 values(1, "Tom", "Peter", 20);		-- Duplicate entry
 
-- Primary Key on Multiple Columns
create table Employee4(
	ID int not null,
	FirstName varchar(255) not null,
	LastName varchar(255) not null,
    Age int,
    primary key (ID, LastName)
);

insert into Employee4 values(1, "Tom", "Peter", 20);
insert into Employee4 values(2, "Tom", "Peter", 20);
select * from Employee4;

-- Add primary Key on existing table
alter table Employee2 add primary key(ID);
-- Remove/Drop primary key on existing table
alter table Employee2 drop primary key;
 
 
 
 