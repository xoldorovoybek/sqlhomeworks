create database 
# Lesson 3: Importing and Exporting Data

Here are 30 homework tasks for Lesson 3, categorized into easy, medium, and hard levels. These tasks cover:

✅ Importing Data (BULK INSERT, Excel, Text)
✅ Exporting Data (Excel, Text)
✅ Comments, Identity column, NULL/NOT NULL values
✅ Unique Key, Primary Key, Foreign Key, Check Constraint
✅ Differences between UNIQUE KEY and PRIMARY KEY

Notes before doing the tasks: Tasks should be solved using SQL Server. It does not matter the solutions are uppercase or lowercase, which means case insensitive. Using alies names does not matter in scoring your work.
Students are scored based on what their query returns(does it fulfill the requirments).
One way of solution is enough if it is true, other ways might be suggested but should not affect the score.
______________________________________

## 🟢 Easy-Level Tasks (10)
1. Define and explain the purpose of BULK INSERT in SQL Server.
BULK INSERT TableName
FROM 'C:\data\employees.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
2. List four file formats that can be imported into SQL Server.
SQL Server supports several file formats for importing data. Here are four common ones:
--1 CSV (Comma-Separated Values)
--2 Excel (.xls, .xlsx)
--3 TXT (Plain Text)
--4 XML
3. Create a table Products with columns: ProductID (INT, PRIMARY KEY), ProductName (VARCHAR(50)), Price (DECIMAL(10,2)).
create table Products (ProductID INT PRIMARY KEY , ProductName VARCHAR(50), Price DECIMAL(10,2));
4. Insert three records into the Products table using INSERT INTO.
insert into products values (1, 'laptop', 500), (2,'mobile', 200), (3, 'mouse', 50); 
5. Explain the difference between NULL and NOT NULL with examples.
VALUES ( NULL)-BirthDate DATE NULL-- Inserting a NULL value;
VALUES ('Laptop')-ProductName VARCHAR(50) NOT NULL--Inserting a NOT NULL value;
6. Add a UNIQUE constraint to the ProductName column in the Products table.
ALTER TABLE Products
ADD CONSTRAINT UQ_ProductName UNIQUE (ProductName);
7. Write a comment in a SQL query explaining its purpose.
-- This query retrieves all products with a price greater than $100
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price > 100;
8. Create a table Categories with a CategoryID as PRIMARY KEY and a CategoryName as UNIQUE.
create table Categories (CategoryId int Primary key, CategoryName varchar (50) unique); 
9. Explain the purpose of the IDENTITY column in SQL Server.
ColumnName INT IDENTITY(seed, increment)
CREATE TABLE Customers (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName VARCHAR(100)
);
INSERT INTO Customers (CustomerName)
VALUES ('Alice'), ('Bob');
________________________________________

## 🟠 Medium-Level Tasks (10)
10. Use BULK INSERT to import data from a text file into the Products table.
BULK INSERT Products
FROM 'C:\Data\products.txt'
WITH (
    FIELDTERMINATOR = ',',  -- separates columns
    ROWTERMINATOR = '\n',   -- separates rows
    FIRSTROW = 2             -- skips header row, if any
);
11. Create a FOREIGN KEY in the Products table that references the Categories table.
ALTER TABLE Products
ADD CategoryID INT,
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
    REFERENCES Categories(CategoryID);
12. Explain the differences between PRIMARY KEY and UNIQUE KEY with examples.
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50)
);
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Email VARCHAR(100) UNIQUE
);
Email must be unique, but can be NULL (e.g., customer without email).

You could add more unique keys if needed, like on PhoneNumber.

13. Add a CHECK constraint to the Products table ensuring Price > 0.
ALTER TABLE Products
ADD CONSTRAINT CHK_Price CHECK (Price > 0);
14. Modify the Products table to add a column Stock (INT, NOT NULL).
Alter table Products
add Stock int not null DEFAULT 0;
15. Use the ISNULL function to replace NULL values in a column with a default value.
ISNULL(column_name, replacement_value)
SELECT ProductID, ProductName, ISNULL(Stock, 0) AS Stock
FROM Products;

16. Describe the purpose and usage of FOREIGN KEY constraints in SQL Server.
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    CategoryID INT,
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);
--Products.CategoryID must match an existing CategoryID in Categories.
--You cannot insert a product with a non-existent category.
--You cannot delete a category if products still reference it (unless ON DELETE rules are defined).
_______________________________________

## 🔴 Hard-Level Tasks (10)
17. Write a script to create a Customers table with a CHECK constraint ensuring Age >= 18.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Age INT,
    CONSTRAINT CHK_Age CHECK (Age >= 18)
);
18. Create a table with an IDENTITY column starting at 100 and incrementing by 10.
Create table item (itemid int identity(100,10) primary key, itemname varchar(50))
19. Write a query to create a composite PRIMARY KEY in a new table OrderDetails.
CREATE TABLE OrderDetails (
    orderid INT,
    ordername VARCHAR(50),
    adress VARCHAR(50),
    PRIMARY KEY (orderid, ordername)
);

20. Explain with examples the use of COALESCE and ISNULL functions for handling NULL values.
SELECT EmployeeID, Name, ISNULL(Salary, 0) AS Salary
FROM Employees;
--The ISNULL(Salary, 0) replaces the NULL salary for Jane Smith with 0.
SELECT EmployeeID, Name, COALESCE(Salary, Bonus, 0) AS EffectiveSalary
FROM Employees;
COALESCE(Salary, Bonus, 0):
--If Salary is NULL, it checks Bonus.
--If both Salary and Bonus are NULL, it returns 0.
21. Create a table Employees with both PRIMARY KEY on EmpID and UNIQUE KEY on Email.
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,          -- Primary key on EmpID
    Name VARCHAR(100),              -- Column for employee name
    Email VARCHAR(100) UNIQUE,      -- Unique constraint on Email
    Department VARCHAR(50)         -- Column for employee's department
);
22. Write a query to create a FOREIGN KEY with ON DELETE CASCADE and ON UPDATE CASCADE options.
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATETIME,
    CustomerID INT,
    CONSTRAINT FK_Orders_Customers FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
--1
Customers Table:
CustomerID: The primary key for the Customers table, uniquely identifying each customer.
CustomerName: A column to store the name of the customer.
--2
Orders Table:
OrderID: The primary key for the Orders table.
OrderDate: A column to store the date of the order.
CustomerID: A foreign key that references the CustomerID column in the Customers table.
--3
Foreign Key Definition:
CONSTRAINT FK_Orders_Customers: Names the foreign key constraint for easier reference.
FOREIGN KEY (CustomerID): Indicates that CustomerID in Orders references CustomerID in Customers.
ON DELETE CASCADE: Ensures that if a CustomerID is deleted from Customers, all related rows in Orders are also deleted.
ON UPDATE CASCADE: Ensures that if a CustomerID is updated in Customers, all related CustomerID values in Orders are also updated.
