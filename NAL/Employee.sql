use nal;

create table Employee(
EmpID varchar(255),
EmpName varchar(255),
Age int,
PhoneNumber int,
EmailID varchar(255),
Address varchar(255)
);

insert into Employee values(1, 'Tom', 25, 9890090, 'tom@gmail.com', 'Bangalore, KA, Ind');
insert into Employee values(2, 'Stev', 35, 9890092, 'stev@gmail.com', 'Hyd, TS, Ind');
insert into Employee values(3, 'Peter', 45, 9890094, 'peter@gmail.com', 'Mysore, KA, Ind');
insert into Employee values(4, 'Peter', 55, 9890091, 'peter@gmail.com', 'Ogl, AP, Ind');
insert into Employee values(5, 'Stev', 35, 9890092, 'stev@gmail.com', 'BZA, AP, Ind');
insert into Employee values(5, 'Stev', 35, 9890092, 'stev@gmail.com', 'BZA, AP, Ind');

select * from Employee;
select count(*) from Employee;		-- Returns the no.of rows
select * from Employee where EmpName='Tom';
select * from Employee where EmpName='Peter' and age=45;
select * from Employee where Age>25 and EmpName='Peter';
select distinct * from Employee;		-- The SELECT DISTINCT statement is used to return only distinct (different) values
select count(distinct EmpID) from Employee;
select * from Employee order by EmpID;		-- By default it will will order in ascending order, can also use = select * from NAL_Employee order by EmpID ASC
select * from Employee order by Age desc;
select * from Employee order by EmpName, Age;		-- First preference will be given to the first item
select * from Employee where age>30 and EmpID>2 and PhoneNumber=9890094;		
select * from Employee where Age>30 and Age<40;



