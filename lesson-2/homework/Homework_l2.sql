# Lesson 2: DDL and DML Commands
create database homework_2  use homework_2
Notes before doing the tasks: Tasks should be solved using SQL Server. It does not matter the solutions are uppercase or lowercase, which means case insensitive. Using alies names does not matter in scoring your work. Students are scored based on what their query returns(does it fulfill the requirments). One way of solution is enough if it is true, other ways might be suggested but should not affect the score.
---

### **Basic-Level Tasks (10)**  
1. Create a table `Employees` with columns: `EmpID` INT, `Name` (VARCHAR(50)), and `Salary` (DECIMAL(10,2)).  
Create table Employees (EmpID INT, Name VARCHAR(50), Salary DECIMAL(10,2))
2. Insert three records into the `Employees` table using different INSERT INTO approaches (single-row insert and multiple-row insert).  
insert into employees values (1, 'John', 10000,00);
insert into employees values (1, 'John', 10000,00), 
                             (2, 'Smith', 20000,00),
							 (2, 'Anna', 30000,00);
3. Update the `Salary` of an employee where `EmpID = 1`.  
Update Employee 
set salary = 5000,00
where Empid = 1;
4. Delete a record from the `Employees` table where `EmpID = 2`.
delete from Employees
where Empid = 2
5. Demonstrate the difference between `DELETE`, `TRUNCATE`, and `DROP` commands on a test table. 
DROP TABLE TestTable; -- Drop the entire table
TRUNCATE TABLE TestTable; -- Truncate the table (delete all rows)
DELETE FROM TestTable-- Delete a specific row
WHERE ID = 2;
6. Modify the `Name` column in the `Employees` table to `VARCHAR(100)`.  
Alter table Employees
ALTER COLUMN NAME VARCHAR (100)
7. Add a new column `Department` (`VARCHAR(50)`) to the `Employees` table.  
ALTER TABLE Employees
ADD department varchar (50);
8. Change the data type of the `Salary` column to `FLOAT`.  
alter table Employees
alter column salary float;
9. Create another table `Departments` with columns `DepartmentID` (INT, PRIMARY KEY) and `DepartmentName` (VARCHAR(50)).  
create table Departments (departmentid int primary key, Deaprtmentname VARCHAR(50));
10. Remove all records from the `Employees` table without deleting its structure.  
Delete from employees;
---

### **Intermediate-Level Tasks (6)**  
11. Insert five records into the `Departments` table using `INSERT INTO SELECT` from an existing table.
insert into department values (1, 'HR'), 
							(2, 'economic'),
							(3, 'BI'),
							(4, 'CEO'),
							(5, 'CRO');
12. Update the `Department` of all employees where `Salary > 5000` to 'Management'.  
Update Department 
set salary > 5000,00
where Departmentname = 'Management';
13. Write a query that removes all employees but keeps the table structure intact.
delete from employees;
14. Drop the `Department` column from the `Employees` table.   
Alter table Employees
drop column department;
--15. Rename the `Employees` table to `StaffMembers` using SQL commands.
Rename table employees to staffMembers;
--16. Write a query to completely remove the `Departments` table from the database.  
Drop table Departments;
---

### **Advanced-Level Tasks (9)**        
--17. Create a table named Products with at least 5 columns, including: 
ProductID (Primary Key), ProductName (VARCHAR), Category (VARCHAR), Price (DECIMAL)
Create table Products (ProductID int Primary Key , ProductName VARCHAR, Category VARCHAR, Price DECIMAL)
--18. Add a CHECK constraint to ensure Price is always greater than 0.
ALTER TABLE Employees
ADD CONSTRAINT chk_Price CHECK (Price > 0);
--19. Modify the table to add a StockQuantity column with a DEFAULT value of 50.
Alter table Employees
Add StockQuantity int DEFAULT 50;
--20. Rename Category to ProductCategory
EXEC sp_rename 'Products.Category', 'ProductCategory'

--21. Insert 5 records into the Products table using standard INSERT INTO queries.
insert into products values(1, 'Laptop', 'electronic', 1200),
							(2, 'planshet', 'electronic', 1100),
							(3, 'smartwatch', 'electronic', 500),
							(4, 'watch', 'electronic', 600),
							(5, 'computer', 'electronic', 1600);
22. Use SELECT INTO to create a backup table called Products_Backup containing all Products data.
SELECT * INTO Products_Backup
FROM Products;
--23. Rename the Products table to Inventory.
Rename table product to Inventory;
--24. Alter the Inventory table to change the data type of Price from DECIMAL(10,2) to FLOAT.
Alter table Inventory
alter column Price Float;
--25. Add an IDENTITY column named ProductCode that starts from 1000 and increments by 5. old table Products
SELECT 
    IDENTITY(INT, 1000, 5) AS ProductCode, -- Identity column starts from 1000, increments by 5
    * -- Select all columns from the old Products table
INTO Products_New
FROM Products;
