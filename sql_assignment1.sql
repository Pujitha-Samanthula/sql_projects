create database assignment1;
use assignment1;

-- employee table
create table Employee(
id int not null,
name varchar(40),
city varchar(30),
department varchar(30),
salary bigint);

-- department table
create table Department(
id int not null,
name varchar(40));

-- company table
create table company(
id int not null,
name varchar(40),
revenue bigint);

-- add rows in employee table
insert into employee
(id,name,city,department,salary)
values(1,'David','London','IT',80000),
(2,'Emily','London','IT',70000),
(3,'Peter','Paris','IT',60000),
(4,'Ava','Paris','IT',50000),
(5,'Penny','London','Management',110000),
(6,'Jim','London','Management',90000),
(7,'Amy','Rome','support',30000),
(8,'Cloe','London','IT',110000);

-- add rows in department table
insert into department
(id,name)
value(1,'IT'),(2,'Management'),(3,"IT"),(4,'Support');

-- add rows in compant table
insert into company
(id,name,revenue)
values(1,'IBM',2000000),
(2,'GOOGLE',9000000),
(3,'Apple',10000000);

-- query all the rows from department table
select * from department;

-- change the name of department with id=1 to management
update department 
set name='Management'
where id=1;

-- delete employees with salary greater than 100000
delete from employee
where salary>100000;

-- query the names of companies
select name from company;

-- query name and city of every employee
select name,city from employee;

-- query all companies with revenue greater than 5000000
select * from company 
where revenue >5000000;

-- query all companies with revenue smaller than 5000000
select * from company 
where revenue <5000000;

-- query all companies with revenue smaller than 5000000 but you cant use < operator
select * from company 
where revenue between 0 and 4999999;

-- query all employees with salary greater than 50000 and smaller than 70000
select * from employee 
where salary between 50001 and 69999;

-- query all employees with salary greater than 50000 and smaller than 70000 but you cannot use between
select * from employee 
where salary>50000 and salary<70000;

-- query all employees with salary equal to 80000
select * from employee 
where salary=80000;

-- query all employees with salary not equal to 80000
select * from employee 
where salary<>80000;

-- query all names of employees with salary greater than 70000 together with employeeswho work on the 'IT' department
select name from employee
where salary>70000 and department='IT';

-- query all employees that work in city that starts with 'L'
select * from employee
where city like "L%";

-- query all employees that work in city that starts with 'L' or ends with 's'
select * from employee
where city like "L%" or city like '%s';

-- query all employees that work in city that starts with 'o' somewhere in the middle
select * from employee
where city like "%o%";

-- query all departments in employee table each name only once 
select distinct department from employee;

-- query names of all employees together with id of department they work in but not using join
SELECT name, department,
(SELECT id FROM department AS d where e.department=d.name limit 1) AS department_id
FROM employee as e;

-- query names of all employees together with id of department they work in using join
select e.name,d.id
from employee e left join department d
on e.department=d.name;
-- query name of every company together with every department
select c.name,d.name from company as c, department as d;

-- query name of every company together with every department without the support department
select c.name,d.name from company as c, department as d
where d.name!='Support';

-- query employee name together with department name that are not working in 
select e.name ,d.name
from employee as e, department as d
where e.department!=d.name;

-- query company name together with other companies names like google ibm,google apple etc


-- query names of every company and change the name of column to 'Company'
select * from company;
alter table company
rename to Company;

-- query all employees that work in same department as peter
select name from employee
where department=(select department from employee where name ='peter');

-- delete table employee department and company
drop table employee;
drop table department;
drop table company;




