Create table  Person (personId int, firstName varchar(255), 
lastName varchar(255)) 
Create table Address (addressId int, 
personId int, city varchar(255), state varchar(255)) 
insert into Person (personId, lastName, firstName) 
values ('1', 'Wang', 'Allen') insert into Person (personId, lastName, firstName) 
values ('2', 'Alice', 'Bob') 
 insert into Address (addressId, personId, city, state) values ('1', '2', 'New York City', 'New York') 
insert into Address (addressId, personId, city, state) 
values ('2', '3', 'Leetcode', 'California')
--1
select * from Person p
full join Address a on p.personId = a.personId

--2
Create table  Employee 
(id int, name varchar(255), salary int, managerId int) 
 insert into Employee 
(id, name, salary, managerId) values ('1', 'Joe', '70000', '3') 
insert into Employee (id, name, salary, managerId) values 
('2', 'Henry', '80000', '4') insert into Employee 
(id, name, salary, managerId) values ('3', 'Sam', '60000', NULL) 
insert into Employee (id, name, salary, managerId) 
values ('4', 'Max', '90000', NULL

select  e.name emp_name, 
e.salary emp_salary, 
m.name manager_name, 
m.salary manafer_salary 
from Employee m join Employee e
on m.id = e.managerId
where e.salary > m.salary


--3
drop taBLE Person
Create table  Person (id int, email varchar(255)) 
insert into Person (id, email) 
values ('1', 'a@b.com') insert into Person (id, email) 
values ('2', 'c@d.com') insert into Person (id, email) values ('3', 'a@b.com')

select email, count(*) count_dublicate from Person
group by email
having COUNT(*) > 1


--5 
--

--5
CREATE TABLE boys ( Id INT PRIMARY KEY, name VARCHAR(100), ParentName VARCHAR(100) );

CREATE TABLE girls ( Id INT PRIMARY KEY, name VARCHAR(100), ParentName VARCHAR(100) );

INSERT INTO boys (Id, name, ParentName) VALUES (1, 'John', 'Michael'),
(2, 'David', 'James'),
(3, 'Alex', 'Robert'),
(4, 'Luke', 'Michael'),
(5, 'Ethan', 'David'),
(6, 'Mason', 'George');

INSERT INTO girls (Id, name, ParentName) VALUES (1, 'Emma', 'Mike'),
(2, 'Olivia', 'James'),
(3, 'Ava', 'Robert'),
(4, 'Sophia', 'Mike'),
(5, 'Mia', 'John'),
(6, 'Isabella', 'Emily'), (7, 'Charlotte', 'George');



select distinct g.ParentName from girls g left join boys b on g.ParentName = b.ParentName
where b.ParentName is null

--6

DROP TABLE IF EXISTS Cart1; DROP TABLE IF EXISTS Cart2; 

CREATE TABLE Cart1 ( Item VARCHAR(100) PRIMARY KEY ); 

CREATE TABLE Cart2 ( Item VARCHAR(100) PRIMARY KEY ); 

INSERT INTO Cart1 (Item) VALUES ('Sugar'),('Bread'),('Juice'),('Soda'),('Flour'); 

INSERT INTO Cart2 (Item) VALUES ('Sugar'),('Bread'),('Butter'),('Cheese'),('Fruit'); 


select isnull(a.Item, ' ') Item, isnull(b.Item, ' ') Item from cart1 a 
full join Cart2 b on a.Item = b.Item
order by a.Item, b.Item

--8

create table match1 (MatchID int, Match varchar(30), Score varchar(5)) 
insert into match1 values (1,'Italy-Spain','2:0'), (2,'Spain-France','2:1'), 
(3,'France-Belgium','0:0'), (4,'Belgium-Spain','2:2'), (5,'Belgium-Italy','0:3'), 
(6,'Italy-France','2:0');


select 
MatchID, 
Match,
Score,
case 
   when SUBSTRING(Score, 1, 1) > SUBSTRING(Score, 3, 1) then LEFT(Match, CHARINDEX('-', Match)-1)
   when SUBSTRING(Score, 1, 1) = SUBSTRING(Score, 3, 1) then 'Draw'
   when SUBSTRING(Score, 1, 1) < SUBSTRING(Score, 3, 1) then RIGHT(Match, CHARINDEX('-', Match)-3)
   end as results
from match1


Create table  Customers 
(id int, name varchar(255)) 
Create table  Orders (id int, customerId int) 

insert into Customers (id, name) values ('1', 'Joe') 
insert into Customers (id, name) values ('2', 'Henry') 
insert into Customers (id, name) values ('3', 'Sam') 
insert into Customers (id, name) values ('4', 'Max') 
 insert into Orders (id, customerId) values ('1', '3') 
insert into Orders (id, customerId) values ('2', '1')

select c.name from Customers c left join Orders o
on c.id = o.customerId
where o.customerId is null


--10

Create table  Students (student_id int, student_name varchar(20)) Create table  
Subjects (subject_name varchar(20)) Create table Examinations (student_id int, subject_name varchar(20)) 
 insert into Students (student_id, student_name) values ('1', 'Alice') insert into Students 
(student_id, student_name) values ('2', 'Bob') insert into Students (student_id, student_name) values ('13', 'John') 
insert into Students (student_id, student_name) values ('6', 'Alex')  insert into Subjects 
(subject_name) values ('Math') insert into Subjects (subject_name) values ('Physics') insert into Subjects (subject_name) 
values ('Programming')  insert into Examinations (student_id, subject_name) values ('1', 'Math') 
insert into Examinations (student_id, subject_name) values ('1', 'Physics') insert into Examinations (student_id, subject_name)
values ('1', 'Programming') insert into Examinations (student_id, subject_name) values ('2', 'Programming') 
insert into Examinations (student_id, subject_name) values ('1', 'Physics') insert into Examinations (student_id, subject_name) 
values ('1', 'Math') insert into Examinations (student_id, subject_name) values ('13', 'Math') 
insert into Examinations (student_id, subject_name) values ('13', 'Programming') insert into 
Examinations (student_id, subject_name) values ('13', 'Physics') insert into Examinations (student_id, subject_name) 
values ('2', 'Math') insert into Examinations (student_id, subject_name) values ('1', 'Math')

select * from Students
select * from Subjects
select * from Examinations

select s.student_name, e.subject_name from Students s join Examinations e on 
s.student_id = e.student_id
