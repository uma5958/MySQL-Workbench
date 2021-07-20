use nal;

create table Customers(
ID int,
Name varchar(255),
PhoneNumber int,
EmailID varchar(255),
Country varchar(255),
City varchar(255)
);

insert into Customers values(10, 'Tom', 9890090, 'aa@gmail.com', 'USA', 'LA');
insert into Customers values(20, 'Tommy', 9890091, 'bb@gmail.com', 'UK', 'London');
insert into Customers values(30, 'Thomas', 9890092, 'cc@gmail.com', 'Germany', 'Berlin');
insert into Customers values(40, 'Stev', 9890093, 'dd@gmail.com', 'Brazil', 'ABC');
insert into Customers values(50, 'Peter', 9890094, 'ee@gmail.com', 'india', 'Bangalore');
insert into Customers values(60, 'John', 9890095, 'ff@gmail.com', 'Australia', 'Sydney');
insert into Customers values(70, 'Cris', 98900922, 'gg@gmail.com', 'Germany', 'Munich');

select * from Customers;
select * from Customers where Country='Germany' or Country='India';
select * from Customers where not Country='Germany';
select * from Customers where Country='Germany' and (City='Berlin' or City='Munich');
select * from Customers where Country='Germany' and not Country='USA';

-- % and _ -> T% - starts with 'T', %T - ends with 'T'
-- Like
select * from Customers where Name like 'Tom%';	-- starts with Tom
select * from Customers where Name like '%y';	--  ends with 'y'
select * from Customers where Name like '%om';
select * from Customers where Name like '_h%';
select * from Customers where Name like 'T__%';
select * from Customers where Name like 'T%y';

-- Update the table with some null values
update Customers set PhoneNumber=null where ID=60;
update Customers set PhoneNumber=null where ID=70;
update Customers set Country=null where ID=70;
select * from Customers;

-- IS NULL
select * from Customers where Country is null;
-- IS NOT NULL
select * from Customers where PhoneNumber is not null;
select * from Customers where PhoneNumber is null;

-- Salary Column to the above table 
alter table Customers add Salary float;
select * from Customers;

update Customers set Salary=20000 where ID=10;
update Customers set Salary=30000 where ID=20;
update Customers set Salary=40000 where ID=30;
update Customers set Salary=50000 where ID=40;
update Customers set Salary=60000 where ID=50;
update Customers set Salary=70000 where ID=60;
update Customers set Salary=90000 where ID=70;
    
select * from Customers;

-- Max Salary from table
select max(Salary) from Customers;

-- 2nd heighest Salary - Using Inner Query
select max(Salary) from Customers where Salary < (select max(Salary) from Customers);

-- 3nd heighest Salary - Using Inner Query
select max(Salary) from Customers where Salary < 
	(select max(Salary) from Customers where Salary < 
    (select max(Salary) from Customers));

-- 2nd heighest -> 1 inner Query 
-- 3nd heighest -> 2 inner Query
-- nth heighest -> n-1 inner Queries

-- max Salary from table using LIMIT keyword
select * from Customers limit 2;		-- Displays top 2 records

select Salary from Customers order by Salary desc limit 1, 1;	-- 2nd heighest => n-1, 1 
select Salary from Customers order by Salary desc limit 2, 1;	-- 3rd heighest 
select Salary from Customers order by Salary desc limit 3, 1;	-- 4rd heighest 

-- TOP, ROWNUM => TOP and ROWNUM are not working in latest version of SQL servers 
-- select TOP 2 from Customers;
-- select * from Customers where row_number <=2; 


