use cc;						-- To select required database
show databases;				-- To verify all databases available
create database Test;		-- To create a new database
drop database Test;			-- To drop database
show tables;				-- To see list of tables of database
select user();				-- To see user information
select database();			-- To see current database information
commit;						-- To update the databse

-- Datatypes
-- Integer values 	=> INT, BRIGHT, LONG
-- Floating Values	=> FLOAT, DOUBLE
-- Alphanumeric		=> CHAR(N), VARCHAR(N), TEXT
-- Date				=> DATE	(YYYY-MM-DD)
-- Large Documents 	=> CLOB
-- Binary Files(mp3, images, video clips)	=> BLOB, LONG BLOB

-- Curd Operation
-- C - Creating the records(insert)
-- U - Updating the records(update)
-- R - Reading the records(select)
-- D - Deleting the records(delete)

-- Creating tables 
create table Students(
	sid int,
	sname varchar(15),
	email varchar(30),
	phone long,
	fee float,
	dob date
);

select * from Students;		-- To see crated table 
describe Students;			-- To see all table fields information
-- or
desc Students;
commit;						-- To update database

-- Inserting Data into tables
insert into Students values(101, 'Srinivas', 'sri@jlc.com', 8737837487, 99999.99, '1990-03-12');
insert into Students values(102, 'Dande', 'vas@jlc.com', 8737837487, 500, '1999-01-12');

-- If you want to insert data into some of the columns only or in different order then we have to follow this format
insert into Students(sid, sname) values(102, 'Srinivas');
insert into Students(sname, email, phone) values('Sri', 'Sri@jlc.com', 878787);

select * from Students;

-- Updating records of Table
update Students set phone=999999 where email='sri@jlc.com';
select * from Students;
update Students set fee=20000.0, dob='1988-01-12' where sid=101;
select * from Students;
update Students set fee=20000.0 where email is null;
select * from Students;
update Students set fee=15000.0 where email is not null;
select * from Students;
update Students set fee=15000.0;	-- Update all records without condition(without where)
select * from Students;

-- Deleting records of Table
delete from Students where email='sri@jlc.com';
select * from Students;
delete from Students where phone=657999 and fee=18000;
select * from Students;
delete from Students where email is null;
select * from Students;
delete from Students where email is not null;
select * from Students;

delete from Students;		-- All records will be deleted(if we don't write condition)
select * from Students;

-- SQL Operators
drop table Students;		-- Deleting table
create table Student(
	sid varchar(20),
	sname varchar(15),
	email varchar(30),
	fee float,
	city varchar(30)
);

select * from student;
insert into student values('JLC-b1-001','sri','sri@gmail.com',15000,'blore');
insert into student values('JLC-b1-002','Nivas','nivas@gmail.com',12000,'hyd');
insert into student values('JLC-b1-003','Dande','dande@gmail.com',20000,'chennai');
insert into student values('JLC-b1-004','Raj','raj@gmail.com',30000,'blore');
insert into student values('JLC-b1-005','Kofel','kofel@gmail.com',40000,'pune');
select * from student;

-- IN Operator => To match one value from collection of values
select * from Student where city='Blore' or city='Pune' or city='Chennai';
select * from Student where city in ('Blore', 'Pune', 'Chennai');

-- BETWEEN Operator => To match values in specified range
select * from Student where fee>=10000 and fee<=12000;
select * from Student where fee between 10000 and 12000;

-- LIKE Operator => To match value with specified pattern
-- % (Occurance of zero or more characters)
-- - (Occurance of only one character)
select * from Student where sname='Sri';
select * from Student where sname like 'S%';
select * from Student where sname like '%s';
select * from Student where sname like '_i%';
select * from Student where sname like '%a_';

-- IS NULL Operator => To verify whether the column contain null value or not
select * from student where email is null;
select * from student where fee is not null;

-- ============ Assignment 1 =========== 
create table book(
	bid varchar(30), 
    bname varchar(30), 
    author varchar(30), 
    cost float, 
    edi int, 
    pub varchar(30), 
    yop bigint, 
    isbn varchar(20)
);

insert into book values('B-002', 'Learn Java', 'Srinivas', 950, 2, 'PS', 2014, 'AB45DV41');
insert into book values('B-003', 'Learn ejb', 'dande', 1000, 2, 'tata', 2015, 'BB45DV41');
insert into book values('B-004', 'Learn c++', 'srini', 750, 2, 'jlc', 2016, 'CC45DV41');
insert into book values('B-005', 'master in Java', 'dk', 600, 2, 'CC', 2017, 'DD45DV41');

-- Display the complete info of books
select * from book;

-- Display the bookid, bookname, cost of all books
select bid, bname, cost from book;

-- Display the books published by jlc
select * from book where pub='jlc';

-- Display the books written by the author whose name starts with 'Sri'
select * from book where author like 'Sri%';

-- Display the books published in 2014 and written by author whose name ends with 'vas'
select * from book where yop='2014' and author like '%vas';

-- Diplay the books published between 2014 and 2016
select * from book where yop between 2014 and 2016;

-- Display the books published by 'jlc' in ascending order of cost
select * from book where pub='jlc' order by cost;

-- Diplay the books published in year 2014 in descending order of cost
select * from book where yop='2014' order by cost desc;

-- Display the books published by 'jlc', 'TATA' or 'PS'
select * from book where pub in ('jlc','tata','ps');

-- Display the books written by author whose name 2nd character is 'r'
select * from book where author like '_r%';

-- =====================================================================

-- Built-in Functions
-- 1) Arithmetic Functions
-- 2) String Functions
-- 3) Conversion Functions
-- 4) Date Functions
-- 5) Aggregate Functions: SUM, MIN, MAX, AVG, COUNT	

create table emp(
	eid int, 
    ename varchar(30), 
    salary float 
);

insert into emp values(1, 'sri', 7000.0);
insert into emp (eid, ename) values(2, 'vas');
insert into emp (eid, ename) values (3, 'srini');
insert into emp (eid, ename) values(4, 'mahi');

select * from emp;

-- Total no.of records for specified column which contains value
select count(eid) from emp;			 
select count(salary) from emp;

-- Total no.of records valailable in table irrespective of data
select count(*) from emp;

-- Total no.of unique records
select count(distinct ename) from emp;

-- Group by and Having Clause
-- Group clause is used to devide the table into multiple groups based on soecified column
-- Having clause is used to specify the condition on group

create table studentstable(
	sid int,
    sname varchar(30),
    course varchar(30),
    totfee int,
    feepaid int,
    feebal int,
    branch varchar(30),
    city varchar(20)
);

insert into studentstable values(1, 'Srinivas', 'FC', 18000, 10000, 8000, 'MKR', 'Blore');
insert into studentstable values(2, 'Dande', 'Core Java', 5000, 5000, 0, 'BTM', 'Pune');
insert into studentstable values(3, 'Manish', 'Android', 8000, 4000, 4000, 'MHA', 'Delhi');
insert into studentstable values(4, 'DK', 'Hadoop', 18000, 9000, 9000, 'MKR', 'Blore');
insert into studentstable values(5, 'Rajbeer', 'Android', 8000, 5000, 3000, 'BTM', 'Pune');
insert into studentstable values(6, 'Firoj', 'Hadoop', 20000, 15000, 5000, 'MKR', 'Blore');
insert into studentstable values(7, 'Kofel', 'Android', 8000, 2000, 6000, 'BTM', 'Delhi');

select * from studentstable;
-- Display the branch wise fee collection, display branch as 'Branch Name' and sum of feepaid as 'Total Collection'
select branch as 'Branch Name', sum(feepaid) from studentstable 
group by branch;

-- Display city wise fee balance, display city as 'City Name' and totbal as 'Total Balance'
select city as 'City Name', sum(feebal) as 'Total Balance' 
from studentstable group by city;

-- Display city wise fee collection, display city as 'City Name' and sum of fee paid as 'Total Collection' for the cities Pune & Blore
select city as 'City Name', sum(feepaid) as 'Total Collection' 
from studentstable where city in ('Pune', 'Blore') group by city;

-- Display the total no.of students joined for the individual courses
select course as 'Course', count(sid) from studentstable group by course;

-- Constraints => Rules will be applied on the column of the table
-- 1) NOT NULL Coinstraint
-- 2) UNIQUE Constraint
-- 3) PRIMARY KEY Constraint
-- 4) FOREIGN KEY Contraint
-- 5) DEFAULT Constraint
-- 6) CHECK Constraint

-- 1) NOT NULL Contraint => If you don't want NULL value for any column, you can use NOT NULL Constraint on that column
create table emp1(
	eid int,
    ename varchar(15) not null,
    email varchar(25) not null
);

insert into emp1(eid) values(1);

-- 2) UNIQUE Constraint => By default you insert duplicate value in any column, 
-- if you applied UNIQUE constarint you can't insert duplicate value but you can insert NULL value
-- UNIQUE constraint acn be used in combination with NOT NULL also

create table emp2(
	eid int,
    ename varchar(15),
    phone long,
    salary float
);

insert into emp2 values(1, 'A', 983274983, 9000.0);
insert into emp2 values(1, 'A', 983274983, 9000.0);

create table emp3(
	eid int unique not null,
    ename varchar(15) unique,
    phone int unique,			-- Key column cann't be of LONG datatype i.e phone long unique 
    email varchar(30) unique
);

-- 3) PRIMARY KEY Constraint => Conbination of UNIQUE and NOT NULL constraint are called as Primary key
-- Table should contain only one Primary Key
-- Primary key is used to identify the records uniquely in a table
-- When you apply primary key both unique and not null constraint will be applied on the column
-- Type of Primary Key: 
-- a) Simple Primary Key	=> When you specify one column of a table as Primary Key then it is called as Simple Primary Key
-- b) Composite Primary Key => When you specify more than one column of a table as Primary Key then it is called as Simple Primary Key

create table PK_Simple(
	oid int primary key,
    itemname varchar(10) not null,
    qty int,
    price int,
    total int
);

create table PK_Composite(
	bcode int,
    atype int,
    acno int,
    bal float,
    primary key(bcode, atype, acno)
);

-- 4) FOREIGN KEY Contraint => Used to establish the relationship between two or more tables
-- The table which contains the main informatio is called master table
-- The table which contains the related information is called child table
-- When inserting data in child table, will be verified by DBMS in parent table
-- When deleting data from parent table, related information from child table also will be updated 
-- You can manually delete the from child table first then from parent table or you can instruct the DBMS to do it automatically 
-- by using following option: ON DELETE <option>
-- a) ON DELETE <CASCADE>
-- This will deletes the child table information automatically when you are deleting information from parent table
-- Ex: ACCOUNTS TABLE
-- b) ON DELETE <SET NULL>
-- This will set the NULL value in child table when you are deleting the information from parent table
-- Ex: TRANSACTIONS TABLE

create table customers(
	cid int primary key,
	cname varchar(10),
	email varchar(15),
	phone int
);

create table accounts(
	cid int,
    bcode int,
    atype int, 
    acno int, 
    bal float,
	primary key(bcode, atype, acno),
	foreign key(cid) references customers(cid) on delete cascade
);

create table transactions(
	bcode int, 
    atype int,
    acno int, 
    tx_date date,
    tx_type char(2), 
    amt float,
	tx_id int primary key,
	foreign key(bcode, atype, acno) references accounts(bcode, atype, acno) on delete set null
);

insert into customers values(101, 'uma', 'uma@gmail.com', 5958);
insert into customers values(102, 'sri', 'sri@gmail.com', 5957);
insert into customers values(103, 'dande', 'dande@gmail.com', 5956);
insert into customers values(104, 'hello', 'hello@gmail.com', 5951);
insert into customers values(105, 'krish', 'krish@gmail.com', 5954);

select * from customers;

insert into accounts values(101, 111, 1, 1122, 10000);
insert into accounts values(102, 112, 2, 1122, 15000);
insert into accounts values(103, 113, 3, 1122, 1000);
insert into accounts values(104, 114, 4, 1122, 900);
insert into accounts values(105, 115, 5, 1122, 500);

select * from accounts;

insert into transactions values(111, 1, 1122, '2017-08-01', 'c', 1000, 123);
insert into transactions values(112, 2, 1122, '2017-08-02', 'c', 1000, 124);
insert into transactions values(113, 3, 1122, '2017-08-02', 'w', 500, 125);
insert into transactions values(114, 4, 1122, '2017-08-03', 'n', 200, 126);
insert into transactions values(115, 5, 1122, '2017-08-03', 'w', 500, 127);

select * from transactions;

delete from customers where cid=105;	-- Deleting row from customers, deletes row from accounts and deletes, replace data with NULL in transactions
select * from customers;
select * from accounts;
select * from transactions;

-- 5) DEFAULT Constraint
-- By default NULL will be the default value for all the columns
-- Default constraint can be used to supply other than NULL value as default value
-- If you supply value for all columns then your value will be inserted otherwise default value will be inserted

create table emp4(
	eid int,
    ename varchar(10),
    salary float,
    city varchar(15) default 'Bangalore',
    country varchar(15) default 'India',
    age int default 99
);

insert into emp4 values(1, 'A', '8000.0', 'Patna', 'Srilanka', 77);
insert into emp4(eid, ename, salary, age) values(1, 'A', '8000.0', 77);

select * from emp4;

-- 6) CHECK Constraint
-- Check constarint used to design user defined rules 
-- When you are developing any web application then you will get the requirements to design your own constraints like,
-- * Student ID must starts with JLC-
-- * Age of student must be greater than 18
-- * Email ID of student must be from yahoo domain only
-- * For saving account customer bal should not be less than 500. etc.
-- NOTE: Only Oracle supports check constarint (MySQL doesn't supports check constraint)
-- Syntax: <COL_NAME> CHECK(<CONDITION>);

create table emp4(
	sid varchar(20) check(sid like 'JLC-%'),
    sname varchar(20) not null,
    email varchar(20) check(email like '%@jlc.com'),
    age int check(age >= 20),
    fee float check(fee >= 2000)
);

insert into emp4 values('JLC-123', 'Dharmedra', 'dk@facebook.com', 99, 2000); -- MySQL doesn't supports check constraint


-- JOINS:
-- If you want to access data from more than one table at a time then you can use join
-- While you are joining tables there should be some common columns available to specify join condition
-- Types of JOIN:
-- 1) Inner Join 
-- 2) Outer Join 
-- 		a) Left Outer Join
--		b) Right Outer Join
-- 		c) Full Outer Join
-- 3) Self Join 
-- 4) Cross Join 

create table jlcstud(
	sid int primary key,
	name varchar(12),
    email varchar(50)
);

insert into jlcstud values(101, 'sri', 'sri@gmail.com');
insert into jlcstud values(102, 'nivas', 'nivas@gmail.com');
insert into jlcstud values(103, 'dande', 'dande@gmail.com');
insert into jlcstud values(104, 'vas', 'vas@gmail.com');

create table jlcfee(
	fid int primary key,
	fee float,
    sid int
);

insert into jlcfee values(1, 13500, 101);
insert into jlcfee values(2, 12000, 102);
insert into jlcfee values(3, 15000, 103);
insert into jlcfee values(4, 15000, 104);

create table jlcadd(
	aid int primary key,
	location varchar(15),
    sid int
);

insert into jlcadd values(11, 'hyd', 101);
insert into jlcadd values(22, 'bng', 102);
insert into jlcadd values(33, 'mum', 103);
insert into jlcadd values(44, 'chn', 104);

-- Inner Join:
-- Inner join is also called as Equi Join
-- Inner join will give you the matching records from joined table

select * from jlcstud;
select * from jlcfee;
select * from jlcadd;

select * from jlcstud, jlcfee where jlcstud.sid = jlcfee.sid;	-- To display all column as per the given condition
select st.sid, st.name, st.email, fe.fee from jlcstud st, jlcfee fe where st.sid = fe.sid;	-- To display selected columns as per the given condition
select * from jlcstud, jlcfee, jlcadd where jlcstud.sid = jlcfee.sid and jlcstud.sid = jlcadd.sid; -- To display all columns from all(3) tables
select st.sid, st.name, st.email, fe.fee, ad.location from jlcstud st, jlcfee fe, jlcadd ad where st.sid = fe.sid and st.sid = ad.sid; -- To display selected columns from 3 days

select * from jlcstud inner join jlcfee on jlcstud.sid = jlcfee.sid;	-- Joins all columns 
select * from jlcstud inner join jlcfee using(sid);		-- Same column will not repeat
select * from jlcstud natural join jlcfee;		-- Same as above(Same column will not repeat)

-- Left Outer Join:
-- Left Outer Join gives matching records from joined table + rceords remains in the left side table
select * from jlcstud left join jlcfee on jlcstud.sid = jlcfee.sid;		-- matching + remaining from left(1st table)
select * from jlcstud left outer join jlcfee on jlcstud.sid = jlcfee.sid;	-- Same result as above
select * from jlcstud left outer join jlcfee using(sid);	-- Common column will not repeat(Remaining is same as above)

-- Right Outer Join
-- Right Outer Join will give matching records from joined table + records remains in the Right side table
-- Matching + Remaining in right(2nd table)
select * from jlcstud right join jlcfee on jlcstud.sid = jlcfee.sid;	-- Joins Matching + Remaining in right(2nd table)
select * from jlcstud right outer join jlcfee on jlcstud.sid = jlcfee.sid;	-- Same as above result
select * from jlcstud right outer join jlcfee using(sid);	-- Common column will not repeat

-- Full Outer Join
-- It will gives matching recirds from joined tables + records remaining in the left side table + records remaining in the right side table
-- Matching + remaining from left(1st table) + remaining from right(2nd table)
select * from jlcstud left join jlcfee on jlcstud.sid = jlcfee.sid union
select * from jlcstud right join jlcfee on jlcstud.sid = jlcfee.sid;

-- Self Join
-- Joining the table to itself is called as self join
-- Slef join is same as any other join, but in this join multiple instances of same table will participate in the join query
create table emp5(
	eid int,
	ename varchar(12),
	mgrid int
);

insert into emp5 values(101, 'Sri', 103);
insert into emp5 values(102, 'Nivas', 103);
insert into emp5 values(103, 'Dande', 104);
insert into emp5 values(104, 'Vas', 101);

select emp.ename as "Employee Name", mgr.ename as "Manager Name" from emp5 emp, emp5 mgr where emp.eid = mgr.mgrid;

-- Cross Join:
-- When you are not providing condition in join query then it will gives the cartiasian product of joined table called as cross join
-- Self Join without condition = Cross Join
select emp.ename as "Employee Name", mgr.ename as "Manager Name" from emp5 emp, emp5 mgr;

-- NOTE:
-- OUTER:
-- Left Outer = Matching + Remaining from left(1st table)
-- Right Outer = Matching + remaining from right(2nd table)
-- Full Outer = Matching + Remaining from left(1st table) + Remaining from right(2nd table)
-- Self Join without condition = Cross Join
-- A NATURAL JOIN is one where the column names are the same. The data type need not be the same. 
-- The fields used for an INNER JOIN need not have the same name.
-- NATURAL JOIN: natural join, where
-- INNER JOIN: inner join, on
-- ================ Joins Assignment =================
create table customers1(
	cid int primary key, 
    cname varchar(15), 
    email varchar(15), 
    phone long, 
    status varchar(15)
);

insert into customers1 values(101, 'sri', 'sri@jlc.com', 6579999, 'Active');
insert into customers1 values(102, 'vas', 'vas@jlc.com', 31903290, 'Active');
insert into customers1 values(103, 'Manish', 'manish@jlc.com', 98745856, 'Inactive');

create table accounts1(
	cid int primary key, 
    acno int,
	atype varchar(15),
    bal int
);

insert into accounts1 values(101, 123, 'Savings', 9000);
insert into accounts1 values(102, 124, 'Current', 9700);
insert into accounts1 values(103, 125, 'Fixed', 8500);

create table address(
	cid int primary key, 
    street varchar(50),
	city varchar(30),
    country varchar(30)
);

insert into address values(101, 'HMT Main', 'Bangalore', 'India');
insert into address values(102, 'ACR Green', 'Pune', 'India');

-- 1) Display the cname, email, acno, bal of all the customers 
select cname, email, acno, bal from customers1, accounts1 where customers1.cid = accounts1.cid;		-- where
-- or 
select cname, email, acno, bal from customers1 inner join accounts1 on customers1.cid = accounts1.cid;		-- inner join, on
-- or
select cname, email, acno, bal from customers1 inner join accounts1 using(cid);		-- inner join, using 
-- or 
select cname, email, acno, bal from customers1 natural join accounts1;		-- natural join: natural join avoids repeated columns

-- 2) Display cname, email, status, city, country of all the customers
select cname, email, status, city, country from customers1 left join address on customers1.cid = address.cid; -- left join, on
-- or
select cname, email, status, city, country from customers1 left join address using(cid);	-- left join, using
-- or 
select cname, email, status, city, country from customers1 natural left join address;		-- natural left join

-- 3) Display cname, email, acno, bal of all customers who are having savings account
select cname, email, acno, bal from customers1 natural join accounts1 where atype='savings';	-- natural join, where
-- or
select cname, email, acno, bal from customers1 inner join accounts1 on customers1.cid = accounts1.cid and atype='savings';	-- inner join, on

-- 4) Display cname, status, city, country of customers who is staying in Bangalore and are active
select cname, status, city, country from customers1 natural join address where city='Bangalore' and status='Active';	-- natural join, where

-- 5) Display acno, atype, bal city of the customers who have current a/c and bal between 8000 & 50000 and staying in Bangalore and Pune 
select acno, atype, bal, city from accounts1 natural left join address where atype='Current' and bal between 8000 and 50000 and city in ('Bangalore', 'Pune'); 	-- natural left join, where, between, in

-- 6) Display cname, status, acno, bal, city and country of all customers
select cname, status, acno, bal, city, country from customers1 natural join accounts1 natural left join address; -- natural join, natural left join

-- 7) Display cname, status, acno, bal, city and country of customers who are deactivated and bal < 1000 and not staying in india
select cname, status, acno, bal, city, country from customers1 natural join accounts1 natural left join address where status='inactive' and
bal <1000 and country not in ('india');		-- natural join, natural left join, where, not in


-- Sub Queries:
-- When you include one query as a part of another query tehn it is called as subquery
-- First sub query will be evaluated and depending on the result returned by subquery main query will be executed
-- Depending on the condition provided in subquery it may retured zero or more results
-- When subquery is returning exactly one record then you can use = oprerator to assign the results of subquery to main query
-- When subquery is returning more than one records then you can use IN operator to assign the results of subquery to main query 

-- ======= Assignment 3 ========
create table student1(
	sid int primary key,
    sname varchar(20),
    email varchar(20),
    phone long
);

insert into student1 values(101, 'Sri', 'sri@jlc.com', 9999);
insert into student1 values(102, 'Manish', 'manish@jlc.com', 8989);
insert into student1 values(103, 'Dande', 'dande@jlc.com', 9898);
insert into student1 values(104, 'Nivas', 'nivas@jlc.com', 9988);

create table address1(
	sid int primary key,
    street varchar(20),
    city varchar(20)
);

insert into address1 values(101, 'Street1', 'Blore');
insert into address1 values(102, 'Street2', 'Pune');
insert into address1 values(103, 'Street3', 'Delhi');
insert into address1 values(104, 'Street4', 'Goa');

create table fee(
	sid int primary key,
    feepaid varchar(20),
    dop date
);

insert into fee values(101, 10000, '2000-02-12');
insert into fee values(102, 15000, '1995-03-20');
insert into fee values(103, 20000, '2014-10-20');
insert into fee values(104, 25000, '2018-08-25');

select * from student1;
select * from address1;
select * from fee;

-- 1) Diplay the name of student whose email is 'sri@jlc.com'
select sname from student1 where email='sri@jlc.com';

-- 2) Display the name of the student whose phone is 9999
select sname from student1 where phone=9999;

-- 3) Display the student information who is from Blore city
select * from student1 where sid=(select sid from address1 where city='Blore');
-- or
select * from student1 where sid in (select sid from address1 where city='Blore');

-- 4) Display the city of the student whose email is 'manish@jlc.com'
select city from address1 where sid=(select sid from student1 where email='manish@jlc.com');

-- 5) Display the student information who has paid fee on 2014-10-20
select * from student1 where sid=(select sid from fee where dop='2014-10-20');

-- 6) Display the student information whose fee is between 15000 20000
select * from student1 where sid in(select sid from fee where feepaid between 15000 and 20000);

-- 7) Display the fee details whose name is 'Sri'
select * from fee where sid=(select sid from student1 where sname='Sri');

