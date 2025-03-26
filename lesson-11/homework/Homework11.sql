 create database homework11
 use homework11
## Basic Level

### Task 1: Basic INNER JOIN
Question: Retrieve all employee names along with their corresponding department names.

#### Table Schema:
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
#### Sample Data:
INSERT INTO Employees VALUES
(1, 'Alice', 101),
(2, 'Bob', 102),
(3, 'Charlie', NULL);

INSERT INTO Departments VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');
---Answer
select e.name, d.departmentname from Employees e
join Departments d on d.DepartmentID = e.DepartmentID

### Task 2: LEFT JOIN
Question: List all students along with their class names, including students who are not assigned to any class.

#### Table Schema:
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    ClassID INT
);

CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50)
);
#### Sample Data:
INSERT INTO Students VALUES
(1, 'John', 201),
(2, 'Emma', NULL),
(3, 'Liam', 202);

INSERT INTO Classes VALUES
(201, 'Math'),
(202, 'Science');
---Answer 
select s.*, c.ClassName from Students s
left join Classes c on s.ClassID = c.ClassID;


### Task 3: RIGHT JOIN
Question: List all customers and their orders, including customers who haven’t placed any orders.

#### Table Schema:
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);
#### Sample Data:
INSERT INTO Orders VALUES
(1, 301, '2024-11-01'),
(2, 302, '2024-11-05');

INSERT INTO Customers VALUES
(301, 'Alice'),
(302, 'Bob'),
(303, 'Charlie');
---Answer
select c.*, o.orderid from Customers c
right join orders o on o.customerid = c.customerid

### Task 4: FULL OUTER JOIN
Question: Retrieve a list of all products and their sales, including products with no sales and sales with invalid product references.

#### Table Schema:
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50)
);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT
);
#### Sample Data:
INSERT INTO Products VALUES
(1, 'Laptop'),
(2, 'Tablet'),
(3, 'Phone');

INSERT INTO Sales VALUES
(100, 1, 10),
(101, 2, 5),
(102, NULL, 8);
---Answer
select * from Products p
full join Sales s on s.ProductID = p.ProductID

### Task 5: SELF JOIN
Question: Find the names of employees along with the names of their managers.

#### Table Schema:
CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    ManagerID INT
);
#### Sample Data:
INSERT INTO Employees1 VALUES
(1, 'Alice', NULL),
(2, 'Bob', 1),
(3, 'Charlie', 1),
(4, 'Diana', 2);
---Answer
select a.name as emp_name,
isnull(b.name,'no manager') as mana_name from Employees1 a
left join Employees1 b on a.ManagerID = b.EmployeeID

### Task 6: CROSS JOIN
Question: Generate all possible combinations of colors and sizes.

#### Table Schema:
CREATE TABLE Colors (
    ColorID INT PRIMARY KEY,
    ColorName VARCHAR(50)
);

CREATE TABLE Sizes (
    SizeID INT PRIMARY KEY,
    SizeName VARCHAR(50)
);
#### Sample Data:
INSERT INTO Colors VALUES
(1, 'Red'),
(2, 'Blue');

INSERT INTO Sizes VALUES
(1, 'Small'),
(2, 'Medium');
---Answer
select * from Colors 
cross join Sizes

### Task 7: Join with WHERE Clause
Question: Find all movies released after 2015 and their associated actors.

#### Table Schema:
CREATE TABLE Movies (
    MovieID INT PRIMARY KEY,
    Title VARCHAR(50),
    ReleaseYear INT
);

CREATE TABLE Actors (
    ActorID INT PRIMARY KEY,
    Name VARCHAR(50),
    MovieID INT
);
#### Sample Data:
INSERT INTO Movies VALUES
(1, 'Inception', 2010),
(2, 'Interstellar', 2014),
(3, 'Dune', 2021);

INSERT INTO Actors VALUES
(101, 'Leonardo DiCaprio', 1),
(102, 'Matthew McConaughey', 2),
(103, 'Timothée Chalamet', 3);
---Answer
select m.*, a.actorid, a.name from Movies m
join Actors a on m.MovieID = a.MovieID
where m.releaseyear > '2015';

### Task 8: MULTIPLE JOINS
Question: Retrieve the order date, customer name, and the product ID for all orders.

#### Table Schema:
CREATE TABLE Orders1 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);

CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT
);
#### Sample Data:
INSERT INTO Orders1 VALUES
(1, 401, '2024-11-01'),
(2, 402, '2024-11-05');

INSERT INTO Customers1 VALUES
(401, 'Alice'),
(402, 'Bob');

INSERT INTO OrderDetails VALUES
(1001, 1, 501),
(1002, 2, 502);
---Answer
select o.orderdate, c.customername,od.productID from Orders1 o
join Customers1 c on c.CustomerID = o.CustomerID
join OrderDetails od on o.OrderID = od.OrderID

### Task 9: JOIN with Aggregation
Question: Calculate the total revenue generated for each product.

#### Table Schema:
CREATE TABLE Sales1 (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    Quantity INT
);

CREATE TABLE Products1 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Price DECIMAL(10, 2)
);
#### Sample Data:
INSERT INTO Sales1 VALUES
(1, 601, 3),
(2, 602, 5),
(3, 601, 2);

INSERT INTO Products1 VALUES
(601, 'TV', 500.00),
(602, 'Speaker', 150.00);
---Answer 
select * from Sales1
select *from Products1
select s.productid, sum(s.quantity) as sum_quantity, p.productname, sum(p.price) as sum_price from sales1 s
join products1 p on s.productid = p.productid 
group by p.productname, s.productid
