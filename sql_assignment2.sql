create database assignment2;
use assignment2;
create table teacher(
teacher_code varchar(10) not null,teacher_name varchar(20),doj date);

insert into teacher(
teacher_code,teacher_name,doj)
values('T00l','ANAND','2001-01-30'),
('T002','AMIT','2007-09-05'),
('T003','ANKIT','2007-09-20'),
('T004','BALBIR','2010-02-15'),
('T005','JASBIR','2011-01-20'),
('T006','KULBIR','2008-07-11');

select teacher_name,doj from teacher 
where teacher_name like "%I%";

select * from teacher where doj like "%-09-%";

create table account(
ANO int not null,ANAME varchar(45),ADDRESS varchar(60));

insert into account(
ANO,ANAME,ADDRESS)
values(101,'Nirja singh','Bangalore'),
(102,'Rohan Gupta','chennai'),
(103,'Ali Reza','Hyderabad'),
(104,'Rishabh Jain','Chennai'),
(105,'Simran Kaur','Chandigarh');

create table transaction
(TRNO varchar(5) not null,ANO int, AMOUNT int ,TYPE varchar(20),DOT date);

insert into transaction(
TRNO,ANO,AMOUNT,TYPE,DOT)
values('T001',101,2500,'withdraw','2017-12-21'),
('T002',103,3000,'Deposit','2017-06-01'),
('T003',102,2000,'withdraw','2017-05-12'),
('T004',103,1000,'Deposit','2017-10-22'),
('T005',102,12000,'Deposit','2017-11-06');

select * from transaction 
where type='withdraw';

select ANO,AMOUNT from transaction
where DOT like "2017-05-%";

select DOT from transaction 
where ANO=102
limit 1;


select a.ANO,ANAME,AMOUNT,DOT 
from account as a 
left join 
transaction as t on a.ANO=t.ANO
where t.amount>3000;

select ANO,ANAME from account where address not in ('chennai','bangalore');

select distinct ANO from transaction;

select ANO,count(ANO),min(amount) from transaction group by ANO
having count(ANO)>1;

select count(*),sum(amount) from transaction 
where dot<='2017-10-01';

create table trains
(tno int,tname varchar(30),start varchar(30),end varchar(30));

insert into trains 
values(11096,'Ahimsa Express','pune junction','ahmedabad junction'),
(12015,'ajmer shatabdi','new delhi','ajmer junction'),
(1651,'puje hbj special','pune junction','habibganj'),
(13005,'amritsar mail','howrah junction','amritsar junction'),
(12002,'Bhopal Shatabdi','new delhi','habibganj'),
(12417,'prayag raj express','allahabad junction','new delhi'),
(14673,'shaheed express','jaynagar','amritsar junction'),
(12314,'sealdah rajdhani','new delhi','sealdah'),
(12498,'shane punjab','amritsar junction','new delhi'),
(12451,'shram shakti express','kanpur central','new delhi'),
(12030,'swarna shatabdi','amritsar junction','new delhi');

create table passengers
(pnr varchar(20),tno int ,pname varchar(20),gender varchar(10),age int,traveldate date);

insert into passengers
values('p001',13005,'r n agrawal','male',45,'2018-12-25'),
('p002',12015,'p tiwary','male',28,'2018-12-25'),
('p003',12015,'s tiwary','female',22,'2018-11-10'),
('p004',12030,'s k saxena','male',42,'2018-11-10'),
('p005',12030,'s saxena','female',35,'2018-10-12'),
('p006',12030,'p saxena','female',12,'2018-10-12'),
('p007',13005,'n s singh','male',52,'2018-05-09'),
('p008',12030,'j k sharma','male',65,'2018-05-09'),
('p009',12030,'r sharma','female',58,'2018-05-09');

select * from trains where start='new delhi';

select pnr,pname,gender,age from passengers 
where age<50;

select gender,count(*) as total from passengers 
group by gender;

select * from passengers 
where tno=12015;

select max(traveldate),min(traveldate) from passengers 
where gender='female';

select end ,count(*) as count from trains 
group by end
having count>1;

select distinct traveldate from passengers;

select tname,pname from trains t,passengers p 
where t.tno=p.tno and age between 50 and 60;

select t.tname,p.pname from trains t inner join passengers p
on t.tno=p.tno
where age between 50 and 60;


