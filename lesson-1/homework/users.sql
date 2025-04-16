create database  homework_1
use homework_1
--1 Define the following terms: data, database, relational database, and table.
--Ma'lumotlar — bu faktlar, raqamlar yoki har qanday boshqa ma'lumotlarni tasvirlovchi narsalardir. 
--Ma'lumotlar bazasi — bu tartibga solingan va saqlanadigan ma'lumotlarning to'plamidir.
--Relyatsion ma'lumotlar bazasi — bu ma'lumotlar bazasining bir turi bo'lib, u ma'lumotlarni jadval (tablica) shaklida saqlaydi
--jadval — bu ma'lumotlar bazasining asosiy tarkibiy qismi bo'lib, ma'lumotlar qatorlar va ustunlar ko'rinishida saqlanadi.

--2 List five key features of SQL Server.
--Ma'lumotlar xavfsizligi, O'lchovlilik va kengaytirilganlik, Jadval va ma'lumotlar bilan ishlashning yuqori samaradorligi, 
--Yuqori darajadagi zaxira va tiklash imkoniyatlari, Integratsiya va ishlov berish imkoniyatlari

--3 What are the different authentication modes available when connecting to SQL Server? (Give at least 2)
--Windows autentifikatsiya rejimi, SQL Server autentifikatsiya rejimi

--Medium-- 4 Create a new database in SSMS named SchoolDB
create database SchoolDB
--5 Write and execute a query to create a table called Students with columns: StudentID (INT, PRIMARY KEY), Name (VARCHAR(50)), Age (INT).
create table Students(StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT)

--6 Describe the differences between SQL Server, SSMS, and SQL.
--Microsoft tomonidan ishlab chiqilgan ma'lumotlar bazasi boshqaruv tizimi (DBMS). 
--SSMS — bu SQL Serverni boshqarish va sozlash uchun grafik interfeysga ega bo'lgan vositadir.

--7Research and explain the different SQL commands: DQL, DML, DDL, DCL, TCL with examples
select * from Students;
insert into Students (StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT)
UPDATE Students
SET age = 55
WHERE StudentID = 1;
DELETE FROM Students
WHERE StudentID = 1;
create table Students(StudentID INT PRIMARY KEY, Name VARCHAR(50), Age INT);
ALTER TABLE Students
ADD score int;
drop table Students;
--8Write a query to insert three records into the Students table.
INSERT INTO Students (StudentID int, FirstName varchar(50), LastNamevarchar(50), Age int, Grade int)
VALUES 
(1, 'John', 'Doe', 20, 'A'),
(2, 'Jane', 'Smith', 22, 'B'),
(3, 'Sam', 'Brown', 21, 'A');
--9 Create a backup of your SchoolDB database and restore it. (write its steps to submit)
RESTORE DATABASE SchoolDB
FROM DISK = 'C:\Backups\SchoolDB_Backup.bak'
WITH REPLACE;


