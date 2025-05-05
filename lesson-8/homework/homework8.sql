--1
--create database homework8
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    Country VARCHAR(50)
);
--2. Insert 40 Rows into Customers Table
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
--4. Insert 40 Rows into Products Table
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
--6. Insert 40 Rows into Orders Table
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
--1
select 
c.CustomerName, 
o.OrderDate 
from Customers c 
inner join Orders o 
on c.CustomerID = o.CustomerID;

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);
--4. Insert 40 Rows into Categories Table
INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Home & Kitchen'),
(4, 'Sports & Outdoors'),
(5, 'Beauty & Personal Care'),
(6, 'Toys & Games'),
(7, 'Books'),
(8, 'Groceries'),
(9, 'Furniture'),
(10, 'Automotive'),
(11, 'Health & Wellness'),
(12, 'Pet Supplies'),
(13, 'Jewelry'),
(14, 'Baby Products'),
(15, 'Music'),
(16, 'Movies & TV Shows'),
(17, 'Office Supplies'),
(18, 'Tools & Home Improvement'),
(19, 'Garden & Outdoor'),
(20, 'Food & Beverages'),
(21, 'Software'),
(22, 'Art & Craft'),
(23, 'Travel Accessories'),
(24, 'Phone Accessories'),
(25, 'Luggage & Bags'),
(26, 'Gifts & Occasions'),
(27, 'Digital Products'),
(28, 'Gaming Consoles'),
(29, 'Cameras & Photography'),
(30, 'Smart Home'),
(31, 'Computers & Laptops'),
(32, 'Appliances'),
(33, 'Musical Instruments'),
(34, 'Party Supplies'),
(35, 'Watches'),
(36, 'Outdoor Gear'),
(37, 'Seasonal Products'),
(38, 'Luxury Goods'),
(39, 'Home Decor'),
(40, 'Art Supplies');



--3
select * from Categories
select * from Products p inner join Categories c on p.ProductName = c.CategoryName

--4
select 
c.CustomerName, 
o.OrderDate 
from Customers c 
left join Orders o 
on c.CustomerID = o.CustomerID;

--6

select * from Products
cross join  Categories;
--7
select 
* from 
Customers c inner join Orders o 
on c.CustomerID = o.CustomerID;

--8 
select * from Products
cross join Orders
where Orderamount > 500;


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE
);
--2. Insert 40 Rows into Employees Table
INSERT INTO Employees (EmployeeID, Name, DepartmentID, Salary, HireDate) VALUES
(1, 'John Doe', 1, 55000.00, '2020-01-01'),
(2, 'Jane Smith', 2, 65000.00, '2019-03-15'),
(3, 'Mary Johnson', 3, 45000.00, '2021-05-10'),
(4, 'James Brown', 1, 60000.00, '2018-07-22'),
(5, 'Patricia Davis', 4, 70000.00, '2017-08-30'),
(6, 'Michael Miller', 2, 75000.00, '2020-12-12'),
(7, 'Linda Wilson', 3, 48000.00, '2016-11-02'),
(8, 'David Moore', 4, 85000.00, '2021-09-01'),
(9, 'Elizabeth Taylor', 1, 60000.00, '2019-05-18'),
(10, 'William Anderson', 2, 64000.00, '2020-04-10'),
(11, 'Susan Thomas', 3, 47000.00, '2017-01-25'),
(12, 'Joseph Jackson', 4, 78000.00, '2016-09-30'),
(13, 'Karen White', 1, 59000.00, '2018-06-10'),
(14, 'Steven Harris', 2, 71000.00, '2021-07-15'),
(15, 'Nancy Clark', 3, 45000.00, '2020-02-20'),
(16, 'George Lewis', 4, 80000.00, '2019-11-10'),
(17, 'Betty Lee', 1, 55000.00, '2017-04-05'),
(18, 'Samuel Walker', 2, 72000.00, '2021-03-22'),
(19, 'Helen Hall', 3, 49000.00, '2018-10-16'),
(20, 'Charles Allen', 4, 90000.00, '2015-08-11'),
(21, 'Betty Young', 1, 53000.00, '2020-05-17'),
(22, 'Frank King', 2, 67000.00, '2021-02-02'),
(23, 'Deborah Scott', 3, 47000.00, '2019-07-09'),
(24, 'Matthew Green', 4, 76000.00, '2021-01-15'),
(25, 'Sandra Adams', 1, 54000.00, '2020-06-21'),
(26, 'Paul Nelson', 2, 71000.00, '2018-12-03'),
(27, 'Margaret Carter', 3, 46000.00, '2020-08-19'),
(28, 'Anthony Mitchell', 4, 82000.00, '2021-04-10'),
(29, 'Lisa Perez', 1, 60000.00, '2021-03-05'),
(30, 'Christopher Roberts', 2, 69000.00, '2019-09-24'),
(31, 'Jessica Gonzalez', 3, 47000.00, '2017-12-13'),
(32, 'Brian Moore', 4, 85000.00, '2018-11-05'),
(33, 'Dorothy Evans', 1, 59000.00, '2019-06-11'),
(34, 'Matthew Carter', 2, 70000.00, '2020-01-29'),
(35, 'Rachel Martinez', 3, 51000.00, '2021-06-06'),
(36, 'Daniel Perez', 4, 83000.00, '2021-07-01'),
(37, 'Catherine Roberts', 1, 60000.00, '2020-09-19'),
(38, 'Ronald Murphy', 2, 68000.00, '2017-02-04'),
(39, 'Angela Jenkins', 3, 52000.00, '2018-04-23'),
(40, 'Gary Wright', 4, 87000.00, '2021-01-10');

--3. Create Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
--4. Insert 40 Rows into Departments Table
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Sales'),
(2, 'Human Resources'),
(3, 'IT'),
(4, 'Marketing'),
(5, 'Finance'),
(6, 'Legal'),
(7, 'Operations'),
(8, 'Research & Development'),
(9, 'Customer Support'),
(10, 'Procurement'),
(11, 'Supply Chain'),
(12, 'Logistics'),
(13, 'Design'),
(14, 'Product Management'),
(15, 'Public Relations'),
(16, 'Business Development'),
(17, 'Quality Assurance'),
(18, 'Data Analytics'),
(19, 'Software Engineering'),
(20, 'Compliance'),
(21, 'Audit'),
(22, 'Product Design'),
(23, 'Health & Safety'),
(24, 'Training & Development'),
(25, 'Accounting'),
(26, 'IT Security'),
(27, 'Market Research'),
(28, 'Customer Success'),
(29, 'Talent Acquisition'),
(30, 'Communications'),
(31, 'Sales Support'),
(32, 'Business Intelligence'),
(33, 'Project Management'),
(34, 'Legal Affairs'),
(35, 'Creative Services'),
(36, 'Information Systems'),
(37, 'Corporate Strategy'),
(38, 'Change Management'),
(39, 'Investor Relations'),
(40, 'Employee Relations');
--9
select 
e.Name, 
d.DepartmentName 
from Employees e join Departments d 
on e.DepartmentID = d.DepartmentID

--10
create table num1 (
item1 int
);

create table num2 (
item2 int
)

insert into num1 values (1), (2), (3), (4);
insert into num2 values (3), (4), (5), (6);

select * from num1 a join num2 b on a.item1 <> b.item2;

/*### **Medium-Level Tasks (10)**  

11. Write a query to demonstrate a One to Many relationship by joining the Customers and Orders tables using INNER JOIN, 
showing the CustomerName and the total number of orders. */ 

select * from Orders
select c.CustomerName, sum(Quantity) count_qunatity from Customers c inner join Orders o on c.CustomerID = o.CustomerID
group by CustomerName;


/*12. Write a query to demonstrate a Many to Many relationship between 
Students and Courses by joining through the StudentCourses table.*/  



/*13. Write a query to use a CROSS JOIN between Employees and Departments tables, 
and filter the results by Salary > 5000 using the WHERE clause.*/  
select * from Employees
cross join Departments
where Salary > 5000;



/*14. Write a query to demonstrate a One to One relationship by joining the Employee and EmployeeDetails tables, 
showing each employee’s name and their details. */
select * from Sales
drop table Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
);
--2. Insert 40 Rows into Sales Table
INSERT INTO Sales (SaleID, ProductID, CustomerID, SaleDate, SaleAmount) VALUES
(1, 1, 1, '2023-01-01', 150.00),
(2, 2, 2, '2023-01-02', 200.00),
(3, 3, 3, '2023-01-03', 250.00),
(4, 4, 4, '2023-01-04', 300.00),
(5, 5, 5, '2023-01-05', 350.00),
(6, 6, 6, '2023-01-06', 400.00),
(7, 7, 7, '2023-01-07', 450.00),
(8, 8, 8, '2023-01-08', 500.00),
(9, 9, 9, '2023-01-09', 550.00),
(10, 10, 10, '2023-01-10', 600.00),
(11, 1, 1, '2023-01-11', 150.00),
(12, 2, 2, '2023-01-12', 200.00),
(13, 3, 3, '2023-01-13', 250.00),
(14, 4, 4, '2023-01-14', 300.00),
(15, 5, 5, '2023-01-15', 350.00),
(16, 6, 6, '2023-01-16', 400.00),
(17, 7, 7, '2023-01-17', 450.00),
(18, 8, 8, '2023-01-18', 500.00),
(19, 9, 9, '2023-01-19', 550.00),
(20, 10, 10, '2023-01-20', 600.00),
(21, 1, 2, '2023-01-21', 150.00),
(22, 2, 3, '2023-01-22', 200.00),
(23, 3, 4, '2023-01-23', 250.00),
(24, 4, 5, '2023-01-24', 300.00),
(25, 5, 6, '2023-01-25', 350.00),
(26, 6, 7, '2023-01-26', 400.00),
(27, 7, 8, '2023-01-27', 450.00),
(28, 8, 9, '2023-01-28', 500.00),
(29, 9, 10, '2023-01-29', 550.00),
(30, 10, 1, '2023-01-30', 600.00),
(31, 1, 2, '2023-02-01', 150.00),
(32, 2, 3, '2023-02-02', 200.00),
(33, 3, 4, '2023-02-03', 250.00),
(34, 4, 5, '2023-02-04', 300.00),
(35, 5, 6, '2023-02-05', 350.00),
(36, 6, 7, '2023-02-06', 400.00),
(37, 7, 8, '2023-02-07', 450.00),
(38, 8, 9, '2023-02-08', 500.00),
(39, 9, 10, '2023-02-09', 550.00),
(40, 10, 1, '2023-02-10', 600.00);


/*15. Write a query to perform an INNER JOIN between Products and Suppliers 
and use the WHERE clause to filter only products supplied by 'Supplier A'.*/

/*16. Write a query to perform a LEFT JOIN between Products and Sales, and display all products 
along with their sales quantity (including products with no sales). */ 
select p.ProductName, ISNULL(SaleAmount, 0) SaleAmount from Products p left join Sales s on p.ProductID = s.ProductID


/*17. Write a query to join Employees and Departments using a WHERE clause, and show all employees
whose salary is greater than 4000 and who work in the ‘HR’ department. */ 

select * from Employees e join Departments d 
on e.DepartmentID = d.DepartmentID
where Salary > 4000 and DepartmentName = 'HR'

/*18. Write a query to show how to use the `>=` operator in the ON 
clause to join two tables and return rows where the values meet the condition. */
select * from num1
select * from num2



select * from num1 a join num2 b on a.item1 >= b.item2;

/*19. Write a query to demonstrate INNER JOIN and use the `>=` operator to find all 
products with a price greater than or equal to 50, and their respective suppliers. */ 


/*20. Write a query to demonstrate a CROSS JOIN between Sales and Regions, and use 
the WHERE clause to show only regions with sales greater than 1000.   */

--### **Hard-Level Tasks (10)**  

/*21. Write a query that demonstrates a Many to Many relationship between Authors and Books 
using the intermediate AuthorBooks table, showing the AuthorName and the BookTitle. */ 
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
select a.Name, b.Title from Authors a join Books_Authors ba 
on a.AuthorID = ba.AuthorID
join Books b on ba.BookID = b.BookID


/*22. Write a query to join Products and Categories using INNER JOIN, and filter the result 
to only include products where the CategoryName is not 'Electronics'.*/ 
select 
* from 
Products p inner join Categories c 
on p.ProductID = c.CategoryID
where CategoryName <> 'Electronics'


/*23. Write a query to perform a CROSS JOIN between Orders and Products, and filter the 
result with a WHERE clause to show only orders where the quantity is greater than 100.*/ 
select * from Orders   
cross join Products
where Price > 100

/*24. Write a query that joins the Employees and Departments tables and uses a logical operator 
in the ON clause to only return employees who have been with the company for over 5 years. */ 
select * from Employees

select * from Employees e
 join Departments d on e.DepartmentID = d.DepartmentID 
 where 2025 -YEAR(HireDate) > 5
/*25. Write a query to show the difference between INNER JOIN and LEFT JOIN by returning 
employees and their departments, ensuring that employees without departments are included in the left join.*/ 
select * from Employees e join Departments d on e.DepartmentID = d.DepartmentID
select * from Employees e left join Departments d on e.DepartmentID = d.DepartmentID

/*26. Write a query that uses a CROSS JOIN between Products and Suppliers, and 
filters the result using WHERE to include only suppliers that supply products in 'Category A'.*/  

/*27. Write a query to demonstrate a One to Many relationship using INNER JOIN between 
Orders and Customers, and apply the `>=` operator to filter only customers with at least 10 orders.*/ 
select c.CustomerName, sum(o.Quantity) Quantity 
from Orders o join Customers c 
on o.CustomerID = c.CustomerID
group by CustomerName
having sum(o.Quantity) >= 10
/*28. Write a query to demonstrate the Many to Many relationship between Courses and Students, 
showing all courses and the number of students enrolled using the COUNT function.*/  

/*29. Write a query to use a LEFT JOIN between Employees and Departments tables, 
and filter the result using the WHERE clause to show only employees in the 'Marketing' department. */ 
select e.Name, d.DepartmentName from 
Employees e left join Departments d 
on e.DepartmentID = d.DepartmentID
where d.DepartmentName = 'Marketing';


--30. Write a query that uses the ON clause with `<=` operator to join two tables and return 
--rows where the values in the columns meet the condition.*/

select * from num1 a join num2 b on a.item1 <= b.item2
