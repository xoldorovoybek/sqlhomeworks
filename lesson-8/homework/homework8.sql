CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);
INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'John Doe', 'USA'),
(2, 'Jane Smith', 'UK'),
(3, 'Michael Johnson', 'Canada'),
(4, 'Sarah Brown', 'Australia'),
(5, 'David Green', 'USA'),
(6, 'Linda White', 'Canada'),
(7, 'James Black', 'UK'),
(8, 'Emily Blue', 'Australia'),
(9, 'Matthew Red', 'USA'),
(10, 'Olivia Yellow', 'Canada'),
(11, 'John Doe', 'Australia'),
(12, 'Jane Smith', 'Canada'),
(13, 'Michael Johnson', 'UK'),
(14, 'Sarah Brown', 'USA'),
(15, 'David Green', 'Canada'),
(16, 'Linda White', 'Australia'),
(17, 'James Black', 'USA'),
(18, 'Emily Blue', 'Canada'),
(19, 'Matthew Red', 'UK'),
(20, 'Olivia Yellow', 'Australia'),
(21, 'John Doe', 'Canada'),
(22, 'Jane Smith', 'Australia'),
(23, 'Michael Johnson', 'USA'),
(24, 'Sarah Brown', 'UK'),
(25, 'David Green', 'Australia'),
(26, 'Linda White', 'USA'),
(27, 'James Black', 'Canada'),
(28, 'Emily Blue', 'UK'),
(29, 'Matthew Red', 'Australia'),
(30, 'Olivia Yellow', 'USA'),
(31, 'John Doe', 'UK'),
(32, 'Jane Smith', 'USA'),
(33, 'Michael Johnson', 'Australia'),
(34, 'Sarah Brown', 'Canada'),
(35, 'David Green', 'UK'),
(36, 'Linda White', 'USA'),
(37, 'James Black', 'Australia'),
(38, 'Emily Blue', 'Canada'),
(39, 'Matthew Red', 'USA'),
(40, 'Olivia Yellow', 'UK');
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10, 2)
);
INSERT INTO Products (ProductID, ProductName, Price) VALUES
(1, 'Laptop', 1200.00),
(2, 'Smartphone', 800.00),
(3, 'Tablet', 400.00),
(4, 'Monitor', 200.00),
(5, 'Keyboard', 50.00),
(6, 'Mouse', 30.00),
(7, 'Printer', 150.00),
(8, 'Headphones', 100.00),
(9, 'Speakers', 80.00),
(10, 'Webcam', 60.00),
(11, 'Laptop', 1100.00),
(12, 'Smartphone', 750.00),
(13, 'Tablet', 420.00),
(14, 'Monitor', 220.00),
(15, 'Keyboard', 55.00),
(16, 'Mouse', 35.00),
(17, 'Printer', 160.00),
(18, 'Headphones', 120.00),
(19, 'Speakers', 90.00),
(20, 'Webcam', 65.00),
(21, 'Laptop', 1300.00),
(22, 'Smartphone', 850.00),
(23, 'Tablet', 380.00),
(24, 'Monitor', 210.00),
(25, 'Keyboard', 60.00),
(26, 'Mouse', 40.00),
(27, 'Printer', 170.00),
(28, 'Headphones', 130.00),
(29, 'Speakers', 95.00),
(30, 'Webcam', 70.00),
(31, 'Laptop', 1400.00),
(32, 'Smartphone', 900.00),
(33, 'Tablet', 430.00),
(34, 'Monitor', 230.00),
(35, 'Keyboard', 65.00),
(36, 'Mouse', 45.00),
(37, 'Printer', 180.00),
(38, 'Headphones', 140.00),
(39, 'Speakers', 100.00),
(40, 'Webcam', 75.00);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
INSERT INTO Orders (OrderID, CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 1, 2, '2023-01-15', 2),
(2, 2, 3, '2023-01-20', 1),
(3, 3, 5, '2023-02-15', 3),
(4, 4, 8, '2023-02-18', 1),
(5, 5, 6, '2023-03-10', 4),
(6, 6, 7, '2023-03-12', 2),
(7, 7, 9, '2023-03-20', 1),
(8, 8, 1, '2023-04-05', 1),
(9, 9, 4, '2023-04-10', 2),
(10, 10, 10, '2023-04-15', 1),
(11, 11, 3, '2023-05-01', 2),
(12, 12, 6, '2023-05-03', 1),
(13, 13, 2, '2023-05-10', 1),
(14, 14, 8, '2023-06-01', 3),
(15, 15, 5, '2023-06-02', 2),
(16, 16, 7, '2023-06-15', 2),
(17, 17, 9, '2023-06-20', 1),
(18, 18, 4, '2023-07-01', 3),
(19, 19, 1, '2023-07-05', 1),
(20, 20, 10, '2023-07-10', 1),
(21, 21, 6, '2023-08-01', 2),
(22, 22, 2, '2023-08-03', 3),
(23, 23, 3, '2023-08-10', 1),
(24, 24, 5, '2023-09-01', 1),
(25, 25, 7, '2023-09-05', 2),
(26, 26, 8, '2023-09-10', 3),
(27, 27, 4, '2023-09-15', 1),
(28, 28, 9, '2023-10-01', 1),
(29, 29, 1, '2023-10-05', 2),
(30, 30, 3, '2023-10-10', 1),
(31, 31, 6, '2023-11-01', 4),
(32, 32, 7, '2023-11-05', 3),
(33, 33, 5, '2023-11-10', 2),
(34, 34, 9, '2023-11-15', 1),
(35, 35, 8, '2023-12-01', 1),
(36, 36, 10, '2023-12-05', 2),
(37, 37, 4, '2023-12-10', 3),
(38, 38, 3, '2023-12-15', 2),
(39, 39, 2, '2023-12-20', 3),
(40, 40, 1, '2023-12-25', 1);
CREATE TABLE EmployeeDepartments (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    DepartmentName VARCHAR(100)
);
INSERT INTO EmployeeDepartments (EmployeeID, EmployeeName, DepartmentName) VALUES
(1, 'John Doe', 'HR'),
(2, 'Jane Smith', 'IT'),
(3, 'Michael Johnson', 'Sales'),
(4, 'Sarah Brown', 'Marketing'),
(5, 'David Green', 'Finance'),
(6, 'Linda White', 'IT'),
(7, 'James Black', 'Sales'),
(8, 'Emily Blue', 'HR'),
(9, 'Matthew Red', 'Marketing'),
(10, 'Olivia Yellow', 'Finance'),
(11, 'John Doe', 'Finance'),
(12, 'Jane Smith', 'Sales'),
(13, 'Michael Johnson', 'IT'),
(14, 'Sarah Brown', 'HR'),
(15, 'David Green', 'Sales'),
(16, 'Linda White', 'Marketing'),
(17, 'James Black', 'Finance'),
(18, 'Emily Blue', 'IT'),
(19, 'Matthew Red', 'HR'),
(20, 'Olivia Yellow', 'Sales'),
(21, 'John Doe', 'Marketing'),
(22, 'Jane Smith', 'HR'),
(23, 'Michael Johnson', 'Finance'),
(24, 'Sarah Brown', 'IT'),
(25, 'David Green', 'HR'),
(26, 'Linda White', 'Sales'),
(27, 'James Black', 'Marketing'),
(28, 'Emily Blue', 'Finance'),
(29, 'Matthew Red', 'HR'),
(30, 'Olivia Yellow', 'IT'),
(31, 'John Doe', 'Sales'),
(32, 'Jane Smith', 'Marketing'),
(33, 'Michael Johnson', 'HR'),
(34, 'Sarah Brown', 'Finance'),
(35, 'David Green', 'Marketing'),
(36, 'Linda White', 'HR'),
(37, 'James Black', 'IT'),
(38, 'Emily Blue', 'Finance'),
(39, 'Matthew Red', 'Sales'),
(40, 'Olivia Yellow', 'HR');

--task 1 easy task
select c.customername, o.orderdate from Customers c 
join Orders o on c.CustomerID = o.CustomerID; 

--task2
select e.employeeid, em.name, em.departmentid, em.salary, em.hiredate, e.projectid, e.startdate, e.enddate, E.role
from [homework4].[dbo].[EmployeeProjects] e 
join [homework4].[dbo].[employees] em on e.employeeid = em.employeeid;

--task3
  select p.name, c.categoryname from [homework4].[dbo].[Products] p
  join [homework4].[dbo].[Categories] c on c.CategoryName = p.Category;

  --task4
select c.customerid, c.customername, c.country, o.orderdate from customers c
left join orders o on c.CustomerID = o.CustomerID;

--task5
 CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY, 
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price DECIMAL(10, 2),  
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID), 
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)  
);
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Price, TotalAmount) VALUES
(1, 2, 1, 800.00, 800.00),  
(2, 3, 2, 400.00, 800.00),  
(3, 4, 1, 250.00, 250.00),  
(4, 5, 3, 50.00, 150.00),  
(5, 6, 1, 30.00, 30.00),    
(6, 7, 2, 150.00, 300.00),  
(7, 8, 1, 200.00, 200.00),  
(8, 9, 4, 5.00, 20.00),    
(9, 10, 2, 10.00, 20.00),   
(10, 11, 1, 180.00, 180.00), 
(11, 12, 3, 500.00, 1500.00), 
(12, 13, 1, 25.00, 25.00),  
(13, 14, 2, 30.00, 60.00),  
(14, 15, 1, 45.00, 45.00),  
(15, 16, 1, 80.00, 80.00),  
(16, 17, 2, 60.00, 120.00),
(17, 18, 1, 20.00, 20.00),  
(18, 19, 5, 10.00, 50.00),  
(19, 20, 2, 25.00, 50.00),  
(20, 21, 1, 60.00, 60.00),  
(21, 22, 1, 100.00, 100.00), 
(22, 23, 2, 15.00, 30.00),  
(23, 24, 3, 90.00, 270.00), 
(24, 25, 4, 5.00, 20.00),   
(25, 26, 2, 25.00, 50.00),  
(26, 27, 1, 450.00, 450.00), 
(27, 28, 1, 600.00, 600.00), 
(28, 29, 1, 500.00, 500.00), 
(29, 30, 2, 120.00, 240.00), 
(30, 31, 1, 350.00, 350.00), 
(31, 32, 1, 450.00, 450.00), 
(32, 33, 2, 40.00, 80.00),  
(33, 34, 3, 100.00, 300.00), 
(34, 35, 1, 60.00, 60.00),  
(35, 36, 1, 35.00, 35.00),  
(36, 37, 2, 35.00, 70.00),  
(37, 38, 1, 55.00, 55.00),  
(38, 39, 3, 40.00, 120.00), 
(39, 40, 1, 500.00, 500.00), 
(40, 1, 1, 1200.00, 1200.00);  
 SELECT o.OrderID, p.Name AS ProductName, od.Quantity, od.Price, od.TotalAmount
FROM OrderDetails od
JOIN Orders o ON od.OrderID = o.OrderID
JOIN Products p ON od.ProductID = p.ProductID

--task 6
select * from [homework4].[dbo].[Categories]
cross join [homework4].[dbo].[Products] 
--task7
select c.customerid, c.name, o.orderid, o.OrderDate, o.quantity from [homework4].[dbo].[Customers] c
join [homework4].[dbo].[Orders] o on c.CustomerID = o.CustomerID;
--task8
select * from [homework4].[dbo].[Products]
cross join [homework4].[dbo].[Orders] 
where TotalAmount > 500;
--task9
select e.EmployeeID, e.name, e.departmentid, e.salary, d.departmentname from [homework4].[dbo].[Departments] d
join [homework4].[dbo].[Employees] e on d.DepartmentID =e.DepartmentID;
--task10
select  e.departmentid, e.salary, d.departmentname from  
[homework4].[dbo].[Departments] d
join [homework4].[dbo].[Employees] e on d.DepartmentID <> e.DepartmentID;

--medium task 11
select c.name, o.quantity from [homework4].[dbo].[Customers] c
join [homework4].[dbo].[Orders] o on c.CustomerID = o.CustomerID;
--task12
--no table
--task13
select * from [homework4].[dbo].[Employees]
cross join [homework4].[dbo].[Departments] 
where Salary > 5000;
--task14
select e.name, e.departmentid, e.salary, em.year, em.performancescore from [homework4].[dbo].[Employees] e
join [homework4].[dbo].[Employeeperformance] em on e.EmployeeID =em.employeeid;
--task15
--no table
--task16
select p.productname, count(s.productid) from [homework4].[dbo].[Products1] p
left join [homework4].[dbo].[Sales] s on p.ProductID =s.ProductID
group by p.ProductName;
--task17
select e.EmployeeID, e.name, e.departmentid, e.salary, d.departmentname from [homework4].[dbo].[Departments] d
join [homework4].[dbo].[Employees] e on d.DepartmentID =e.DepartmentID
where e.salary > 4000 and d.departmentname = 'Human resources';
--task18
select p.productname, s.productid from [homework4].[dbo].[Products1] p
left join [homework4].[dbo].[Sales] s on p.ProductID >= s.ProductID;
select c.name, o.quantity from [homework4].[dbo].[Customers] c
join [homework4].[dbo].[Orders] o on c.CustomerID >= o.CustomerID;

--task19
--no table

--task20
--no table

-- hard task21 
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100)
);
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255)
);

INSERT INTO Authors (AuthorID, Name) VALUES 
(1, 'J.K. Rowling'),
(2, 'J.R.R. Tolkien'),
(3, 'George R.R. Martin'),
(4, 'Terry Pratchett'),
(5, 'Neil Gaiman');

INSERT INTO Books (BookID, Title) VALUES 
(101, 'Harry Potter and the Sorcerers Stone'),
(102, 'The Lord of the Rings'),
(103, 'A Game of Thrones'),
(104, 'Good Omens'),
(105, 'The Colour of Magic');
CREATE TABLE Books_Authors (
    AuthorID INT,
    BookID INT,
    PRIMARY KEY (AuthorID, BookID),
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Books_Authors (AuthorID, BookID) VALUES 
(1, 101), -- J.K. Rowling wrote "Harry Potter"
(2, 102), -- J.R.R. Tolkien wrote "The Lord of the Rings"
(3, 103), -- George R.R. Martin wrote "A Game of Thrones"
(4, 104), -- Terry Pratchett co-wrote "Good Omens"
(5, 104), -- Neil Gaiman co-wrote "Good Omens"
(4, 105);
select a.AuthorID, a.Name, b.Title
from Authors a join Books_Authors ba on a.AuthorID = ba.AuthorID
join Books b on b.BookID = ba.BookID

--task22
select c.categoryname, p.name, p.price, p.stockquantity from [homework4].[dbo].[Categories] c
join [homework4].[dbo].[Products] p on c.CategoryName = p.Category
where c.categoryname not like 'electronics';
--task23
select o.productid, o.totalamount, p.stockquantity from [homework4].[dbo].[Orders] o
join [homework4].[dbo].[Products] p on o.ProductID = p.ProductID
where p.stockquantity > 100;

--task24
select e.EmployeeID, e.name, e.departmentid, e.salary, d.departmentname from [homework4].[dbo].[Departments] d
join [homework4].[dbo].[Employees] e on d.DepartmentID =e.DepartmentID
where e.expirence > 5;

--task25
select e.EmployeeID, e.name, e.departmentid, e.salary, d.departmentname from [homework4].[dbo].[Departments] d
join [homework4].[dbo].[Employees] e on d.DepartmentID =e.DepartmentID

select e.name, e.salary, e.departmentid, d.departmentname from [homework4].[dbo].[Employees] e
left join [homework4].[dbo].[Departments] d on e.DepartmentID = d.DepartmentID;

--task26
--no table
--task27
SELECT 
    c.CustomerID, 
    c.Name, 
    COUNT(o.OrderID) AS OrderCount
FROM 
    [homework4].[dbo].[Customers] c
JOIN 
    [homework4].[dbo].[Orders] o 
    ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID, c.Name
HAVING 
    COUNT(o.OrderID) >= 10;
--task28
--no table

--task29
select e.EmployeeID, e.name, e.departmentid, e.salary, d.departmentname from [homework4].[dbo].[Departments] d
left join [homework4].[dbo].[Employees] e on d.DepartmentID =e.DepartmentID
where d.departmentname = 'marketing';

--task30
select p.productname, s.productid from [homework4].[dbo].[Products1] p
left join [homework4].[dbo].[Sales] s on p.ProductID >= s.ProductID;
select c.name, o.quantity from [homework4].[dbo].[Customers] c
join [homework4].[dbo].[Orders] o on c.CustomerID >= o.CustomerID;







