create database assignment3;
use assignment3;
create table doctors
(docid int,docname varchar(57),department varchar(30),noofdays int);

insert into doctors
values(101,'j k mishra','ortho',3),
(102,'mahesh tripathi','ent',4),
(103,'ravi kumar','neuro',5),
(104,'mukesh jain','physio',3);

create table patients
(patno int,patname varchar(20),department varchar(20),docid int);

insert into patients
values (1,'paypal','ent',102),
(2,'naveen','ortho',101),
(3,'rakesh','neuro',103),
(4,'atul','physio',104);

select * from doctors;
select * from patients;

select patno,patname,docname
from doctors as d inner join patients as p on d.docid=p.docid;

select docname from doctors
where noofdays>3;

select docname,d.department,patname,d.docid 
from doctors as d inner join patients as p on d.docid=p.docid
where d.docid=101 or d.docid=103;

select count(distinct(department)) from patients;

create table friends(
s_no int,name varchar(40),age int,city varchar(40),country varchar(20),email_id varchar(50));

insert into friends
values(1,'alice',14,'washington','usa','alice@gmail.com'),
(2,'charles',12,'copenhagen','denmark','harles@yahoo.com'),
(3,'angel',16,'chicago','usa','angel@gmail.com'),
(4,'jasmine',15,'sydney','australia','jasmine@yahoo.com'),
(5,'raj',14,'new delhi','india','raj@gmail.com'),
(6,'jette',13,'nykobing','denmark','jette@gmail.com'),
(7,'alexender',15,'melbourne','australia',null),
(8,'shashank',16,'banglore','india',null);

select name from friends
where country!="india";

select name,city,country from friends
order by age desc;

select name,city from friends
where email_id is null;

select name,country from friends 
where age>12 and name like 'A%';

create table employee (empno int,ename varchar(30),dept varchar(20),salary int,comm int);
insert into employee
values(1,'ankit','hr',20000,1200),
(2,'sujeet','accounts',24000,null),
(3,'vijay','hr',28000,2000),
(4,'nitin','sales',18000,3000),
(5,'vikram','sales',22000,1700);

select ename from employee
where ename like "V%"
order by salary;

select * from employee
where dept="sales" and salary>20000;

select distinct(dept) from employee;

update employee
set salary=20000
where ename="nitin";

insert into employee
values(6,'sumit','hr',40000,2000);

select avg(comm) from employee;

select ename,dept from employee 
where dept in ('hr','accounts');

select ename,salary+100 newsal from employee;

create table visitor(
visitorid int,visitorname varchar(30),gender varchar(3),comingfrom varchar(30),amountpaid int);

insert into visitor
values(1,"suman","f","kanpur",2500),
(2,"indu","f","luknow",3000),
(3,"rachana","f","haryana",2000),
(4,"vikram","m","kanpur",4000),
(5,"rajesh",'m','kanpur',3000),
(6,'suresh','m','allahabad',3600),
(7,"dinesh",'m','lucknow',null),
(8,'shikha','f','varanasi',5000);

select visitorname,comingfrom from visitor
where gender="f" and amountpaid>3000;

select distinct(comingfrom) from visitor;

insert into visitor
values(7,"shilpa","f","lucknow",3000);

select * from visitor
order by amountpaid desc;

select visitorname from visitor 
where gender="m";

select amountpaid+200 from visitor where visitorid=6;

select sum(amountpaid) from visitor where comingfrom="kanpur";

select count(visitorname) from visitor where amountpaid is null;
 
