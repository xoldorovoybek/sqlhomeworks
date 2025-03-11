create database homework4
use homework4

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    LoyaltyStatus VARCHAR(50)
);

INSERT INTO Customers VALUES
(1, 'Alice', 'New York', 'Gold'),
(2, 'Bob', 'California', 'Silver'),
(3, 'Charlie', 'Texas', 'Gold'),
(4, 'David', 'Florida', 'Platinum'),
(5, 'Eve', 'California', 'Gold'),
(6, 'Frank', 'Texas', 'Silver'),
(7, 'Grace', 'New York', 'Platinum'),
(8, 'Helen', 'Florida', 'Gold'),
(9, 'Ivan', 'California', 'Silver'),
(10, 'Jack', 'New York', 'Gold'),
(11, 'Kathy', 'Texas', 'Gold'),
(12, 'Leo', 'California', 'Platinum'),
(13, 'Mona', 'New York', 'Silver'),
(14, 'Nina', 'Florida', 'Gold'),
(15, 'Oscar', 'California', 'Silver'),
(16, 'Paul', 'Texas', 'Gold'),
(17, 'Quincy', 'New York', 'Platinum'),
(18, 'Rachel', 'Florida', 'Silver'),
(19, 'Sam', 'California', 'Gold'),
(20, 'Tom', 'Texas', 'Platinum'),
(21, 'Uma', 'New York', 'Gold'),
(22, 'Vera', 'California', 'Platinum'),
(23, 'Walter', 'Florida', 'Silver'),
(24, 'Xander', 'Texas', 'Gold'),
(25, 'Yara', 'New York', 'Silver'),
(26, 'Zoe', 'California', 'Platinum'),
(27, 'Aaron', 'Texas', 'Gold'),
(28, 'Bella', 'Florida', 'Platinum'),
(29, 'Caleb', 'California', 'Silver'),
(30, 'Diana', 'Texas', 'Gold'),
(31, 'Eva', 'New York', 'Silver'),
(32, 'Finn', 'Florida', 'Gold'),
(33, 'Gina', 'California', 'Platinum'),
(34, 'Hank', 'Texas', 'Silver'),
(35, 'Ivy', 'New York', 'Gold'),
(36, 'Jason', 'California', 'Silver'),
(37, 'Ken', 'Texas', 'Platinum'),
(38, 'Lia', 'Florida', 'Gold'),
(39, 'Mick', 'New York', 'Platinum'),
(40, 'Noah', 'California', 'Gold');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    Name VARCHAR(100),
    Price DECIMAL(10, 2),
    Category VARCHAR(50),
    StockQuantity INT
);
INSERT INTO Products VALUES
(1, 'Laptop', 1200.00, 'Electronics', 30),
(2, 'Smartphone', 800.00, 'Electronics', 50),
(3, 'Tablet', 400.00, 'Electronics', 40),
(4, 'Monitor', 250.00, 'Electronics', 60),
(5, 'Keyboard', 50.00, 'Accessories', 100),
(6, 'Mouse', 30.00, 'Accessories', 120),
(7, 'Chair', 150.00, 'Furniture', 80),
(8, 'Desk', 200.00, 'Furniture', 75),
(9, 'Pen', 5.00, 'Stationery', 300),
(10, 'Notebook', 10.00, 'Stationery', 500),
(11, 'Printer', 180.00, 'Electronics', 25),
(12, 'Camera', 500.00, 'Electronics', 40),
(13, 'Flashlight', 25.00, 'Tools', 200),
(14, 'Shirt', 30.00, 'Clothing', 150),
(15, 'Jeans', 45.00, 'Clothing', 120),
(16, 'Jacket', 80.00, 'Clothing', 70),
(17, 'Shoes', 60.00, 'Clothing', 100),
(18, 'Hat', 20.00, 'Accessories', 50),
(19, 'Socks', 10.00, 'Clothing', 200),
(20, 'T-Shirt', 25.00, 'Clothing', 150),
(21, 'Lamp', 60.00, 'Furniture', 40),
(22, 'Coffee Table', 100.00, 'Furniture', 35),
(23, 'Book', 15.00, 'Stationery', 250),
(24, 'Rug', 90.00, 'Furniture', 60),
(25, 'Cup', 5.00, 'Accessories', 500),
(26, 'Bag', 25.00, 'Accessories', 300),
(27, 'Couch', 450.00, 'Furniture', 15),
(28, 'Fridge', 600.00, 'Electronics', 20),
(29, 'Stove', 500.00, 'Electronics', 15),
(30, 'Microwave', 120.00, 'Electronics', 25),
(31, 'Air Conditioner', 350.00, 'Electronics', 10),
(32, 'Washing Machine', 450.00, 'Electronics', 15),
(33, 'Dryer', 400.00, 'Electronics', 10),
(34, 'Hair Dryer', 30.00, 'Accessories', 100),
(35, 'Iron', 40.00, 'Electronics', 50),
(36, 'Coffee Maker', 50.00, 'Electronics', 60),
(37, 'Blender', 35.00, 'Electronics', 40),
(38, 'Juicer', 55.00, 'Electronics', 30),
(39, 'Toaster', 40.00, 'Electronics', 70),
(40, 'Dishwasher', 500.00, 'Electronics', 20);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
  TotalAmount DECIMAL(10, 2));

INSERT INTO Orders VALUES
(1, 1, 2, '2024-01-10', 1, 800.00),
(2, 2, 3, '2024-01-11', 2, 800.00),
(3, 3, 4, '2024-01-12', 1, 250.00),
(4, 4, 5, '2024-01-13', 3, 150.00),
(5, 5, 6, '2024-01-14', 1, 30.00),
(6, 6, 7, '2024-01-15', 2, 300.00),
(7, 7, 8, '2024-01-16', 1, 200.00),
(8, 8, 9, '2024-01-17', 4, 40.00),
(9, 9, 10, '2024-01-18', 1, 10.00),
(10, 10, 11, '2024-01-19', 2, 360.00),
(11, 11, 12, '2024-01-20', 1, 500.00),
(12, 12, 13, '2024-01-21', 1, 25.00),
(13, 13, 14, '2024-01-22', 2, 60.00),
(14, 14, 15, '2024-01-23', 3, 135.00),
(15, 15, 16, '2024-01-24', 1, 80.00),
(16, 16, 17, '2024-01-25', 1, 60.00),
(17, 17, 18, '2024-01-26', 2, 40.00),
(18, 18, 19, '2024-01-27', 5, 50.00),
(19, 19, 20, '2024-01-28', 2, 50.00),
(20, 20, 21, '2024-01-29', 1, 60.00),
(21, 21, 22, '2024-02-01', 1, 100.00),
(22, 22, 23, '2024-02-02', 1, 15.00),
(23, 23, 24, '2024-02-03', 2, 180.00),
(24, 24, 25, '2024-02-04', 3, 15.00),
(25, 25, 26, '2024-02-05', 4, 100.00),
(26, 26, 27, '2024-02-06', 1, 450.00),
(27, 27, 28, '2024-02-07', 1, 600.00),
(28, 28, 29, '2024-02-08', 1, 500.00),
(29, 29, 30, '2024-02-09', 2, 240.00),
(30, 30, 31, '2024-02-10', 1, 350.00),
(31, 31, 32, '2024-02-11', 1, 450.00),
(32, 32, 33, '2024-02-12', 1, 40.00),
(33, 33, 34, '2024-02-13', 2, 100.00),
(34, 34, 35, '2024-02-14', 3, 120.00),
(35, 35, 36, '2024-02-15', 1, 60.00),
(36, 36, 37, '2024-02-16', 1, 35.00),
(37, 37, 38, '2024-02-17', 2, 110.00),
(38, 38, 39, '2024-02-18', 1, 40.00),
(39, 39, 40, '2024-02-19', 3, 120.00),
(40, 40, 1, '2024-02-20', 1, 1200.00);

drop table Orders
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    DepartmentID INT,
    Salary DECIMAL(10, 2),
    HireDate DATE
);
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
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);
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
CREATE TABLE Customers1 (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(50),
    Address VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20)
);
INSERT INTO Customers1 (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, PostalCode) VALUES
(1, 'John', 'Doe', 'johndoe@example.com', '555-1234', '123 Elm St', 'New York', 'NY', '10001'),
(2, 'Jane', 'Smith', 'janesmith@example.com', '555-2345', '456 Oak St', 'Los Angeles', 'CA', '90001'),
(3, 'Alice', 'Johnson', 'alicej@example.com', '555-3456', '789 Pine St', 'Chicago', 'IL', '60601'),
(4, 'Bob', 'Brown', 'bobbrown@example.com', '555-4567', '101 Maple St', 'Houston', 'TX', '77001'),
(5, 'Charlie', 'Davis', 'charliedavis@example.com', '555-5678', '202 Birch St', 'Phoenix', 'AZ', '85001'),
(6, 'David', 'Martinez', 'davidm@example.com', '555-6789', '303 Cedar St', 'San Diego', 'CA', '92101'),
(7, 'Emily', 'Garcia', 'emilyg@example.com', '555-7890', '404 Redwood St', 'Dallas', 'TX', '75201'),
(8, 'Frank', 'Hernandez', 'frankh@example.com', '555-8901', '505 Willow St', 'Austin', 'TX', '73301'),
(9, 'Grace', 'Lopez', 'gracel@example.com', '555-9012', '606 Aspen St', 'Miami', 'FL', '33101'),
(10, 'Helen', 'Gonzalez', 'heleng@example.com', '555-0123', '707 Fir St', 'San Francisco', 'CA', '94101'),
(11, 'Irene', 'Perez', 'irenep@example.com', '555-1234', '808 Maple Ave', 'Seattle', 'WA', '98101'),
(12, 'Jack', 'Wilson', 'jackw@example.com', '555-2345', '909 Oak Ave', 'Denver', 'CO', '80201'),
(13, 'Kim', 'Anderson', 'kima@example.com', '555-3456', '111 Pine Ave', 'Boston', 'MA', '02101'),
(14, 'Liam', 'Thomas', 'liamt@example.com', '555-4567', '222 Cedar Ave', 'Atlanta', 'GA', '30301'),
(15, 'Megan', 'Taylor', 'megant@example.com', '555-5678', '333 Redwood Ave', 'Washington', 'DC', '20001'),
(16, 'Nathan', 'Moore', 'nathanm@example.com', '555-6789', '444 Willow Ave', 'Detroit', 'MI', '48201'),
(17, 'Olivia', 'Jackson', 'oliviaj@example.com', '555-7890', '555 Birch Ave', 'Portland', 'OR', '97201'),
(18, 'Paul', 'White', 'paulw@example.com', '555-8901', '666 Maple Blvd', 'Minneapolis', 'MN', '55101'),
(19, 'Quincy', 'Lee', 'quincyl@example.com', '555-9012', '777 Oak Blvd', 'Charlotte', 'NC', '28201'),
(20, 'Rachel', 'Harris', 'rachelh@example.com', '555-0123', '888 Pine Blvd', 'Las Vegas', 'NV', '89101'),
(21, 'Sam', 'Clark', 'samc@example.com', '555-1234', '999 Cedar Blvd', 'Orlando', 'FL', '32801'),
(22, 'Tina', 'Allen', 'tinaallen@example.com', '555-2345', '1010 Redwood Blvd', 'New Orleans', 'LA', '70112'),
(23, 'Ursula', 'Scott', 'ursulas@example.com', '555-3456', '1111 Willow Blvd', 'Tampa', 'FL', '33601'),
(24, 'Victor', 'Adams', 'victora@example.com', '555-4567', '1212 Birch Blvd', 'Cleveland', 'OH', '44101'),
(25, 'Walter', 'Baker', 'walterb@example.com', '555-5678', '1313 Oak Blvd', 'Columbus', 'OH', '43201'),
(26, 'Xander', 'Nelson', 'xandern@example.com', '555-6789', '1414 Cedar Blvd', 'Indianapolis', 'IN', '46201'),
(27, 'Yvonne', 'Carter', 'yvonnec@example.com', '555-7890', '1515 Maple Dr', 'Kansas City', 'MO', '64101'),
(28, 'Zane', 'Mitchell', 'zanem@example.com', '555-8901', '1616 Redwood Dr', 'Salt Lake City', 'UT', '84101'),
(29, 'Anna', 'Roberts', 'annar@example.com', '555-9012', '1717 Willow Dr', 'Birmingham', 'AL', '35203'),
(30, 'Ben', 'King', 'benk@example.com', '555-0123', '1818 Birch Dr', 'Nashville', 'TN', '37201'),
(31, 'Chloe', 'Green', 'chloeg@example.com', '555-1234', '1919 Oak Dr', 'Boulder', 'CO', '80301'),
(32, 'Daniel', 'Evans', 'daniele@example.com', '555-2345', '2020 Cedar Dr', 'Sacramento', 'CA', '94201'),
(33, 'Ella', 'Collins', 'ellac@example.com', '555-3456', '2121 Redwood Dr', 'Louisville', 'KY', '40202'),
(34, 'Finn', 'Morris', 'finnm@example.com', '555-4567', '2222 Willow St', 'Cincinnati', 'OH', '45202'),
(35, 'Grace', 'Lee', 'gracel@example.com', '555-5678', '2323 Birch St', 'Baltimore', 'MD', '21201'),
(36, 'Holly', 'Martinez', 'hollym@example.com', '555-6789', '2424 Oak St', 'St. Louis', 'MO', '63101'),
(37, 'Ian', 'Robinson', 'ianr@example.com', '555-7890', '2525 Cedar St', 'Fort Worth', 'TX', '76101'),
(38, 'Jasmine', 'Walker', 'jasminew@example.com', '555-8901', '2626 Redwood St', 'Raleigh', 'NC', '27601'),
(39, 'Kyle', 'Young', 'kyley@example.com', '555-9012', '2727 Willow St', 'Pittsburgh', 'PA', '15201'),
(40, 'Liam', 'Harris', 'liamh@example.com', '555-0123', '2828 Birch St', 'Richmond', 'VA', '23220');
CREATE TABLE Products1 (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(255),
    Category VARCHAR(100),
    Price DECIMAL(10, 2),
    StockQuantity INT
);
INSERT INTO Products1 (ProductID, ProductName, Category, Price, StockQuantity) VALUES
(1, 'Laptop', 'Electronics', 999.99, 50),
(2, 'Smartphone', 'Electronics', 799.99, 100),
(3, 'Tablet', 'Electronics', 499.99, 200),
(4, 'Wireless Mouse', 'Electronics', 29.99, 500),
(5, 'Keyboard', 'Electronics', 49.99, 300),
(6, 'Monitor', 'Electronics', 199.99, 150),
(7, 'Headphones', 'Electronics', 89.99, 400),
(8, 'Smartwatch', 'Electronics', 159.99, 50),
(9, 'Camera', 'Electronics', 499.99, 75),
(10, 'Smart TV', 'Electronics', 699.99, 30),
(11, 'Sofa', 'Furniture', 299.99, 20),
(12, 'Dining Table', 'Furniture', 399.99, 15),
(13, 'Office Chair', 'Furniture', 99.99, 50),
(14, 'Bookshelf', 'Furniture', 129.99, 35),
(15, 'Lamp', 'Furniture', 29.99, 60),
(16, 'Bed', 'Furniture', 499.99, 10),
(17, 'Refrigerator', 'Appliances', 799.99, 25),
(18, 'Washing Machine', 'Appliances', 699.99, 20),
(19, 'Air Conditioner', 'Appliances', 599.99, 10),
(20, 'Microwave', 'Appliances', 99.99, 100),
(21, 'Jacket', 'Clothing', 79.99, 100),
(22, 'Jeans', 'Clothing', 49.99, 150),
(23, 'T-Shirt', 'Clothing', 19.99, 200),
(24, 'Sweater', 'Clothing', 39.99, 120),
(25, 'Dress', 'Clothing', 59.99, 80),
(26, 'Shoes', 'Clothing', 89.99, 50),
(27, 'Boots', 'Clothing', 119.99, 60),
(28, 'Socks', 'Clothing', 5.99, 500),
(29, 'Scarf', 'Clothing', 14.99, 100),
(30, 'Hat', 'Clothing', 24.99, 75),
(31, 'Blender', 'Appliances', 49.99, 200),
(32, 'Toaster', 'Appliances', 29.99, 150),
(33, 'Electric Kettle', 'Appliances', 39.99, 300),
(34, 'Coffee Maker', 'Appliances', 89.99, 50),
(35, 'Hair Dryer', 'Beauty', 39.99, 120),
(36, 'Shampoo', 'Beauty', 19.99, 300),
(37, 'Conditioner', 'Beauty', 14.99, 400),
(38, 'Nail Polish', 'Beauty', 9.99, 200),
(39, 'Body Lotion', 'Beauty', 15.99, 150),
(40, 'Perfume', 'Beauty', 49.99, 60);
CREATE TABLE Orders1 (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50)
);
INSERT INTO Orders1 (OrderID, CustomerID, OrderDate, TotalAmount, Status) VALUES
(1, 1, '2025-01-10', 1500.00, 'Shipped'),
(2, 2, '2025-01-12', 1200.00, 'Pending'),
(3, 3, '2025-01-15', 250.00, 'Delivered'),
(4, 4, '2025-01-18', 800.00, 'Cancelled'),
(5, 5, '2025-01-20', 950.00, 'Shipped'),
(6, 6, '2025-01-22', 1450.00, 'Shipped'),
(7, 7, '2025-01-25', 320.00, 'Delivered'),
(8, 8, '2025-01-28', 500.00, 'Pending'),
(9, 9, '2025-01-30', 1100.00, 'Shipped'),
(10, 10, '2025-02-02', 1300.00, 'Shipped'),
(11, 11, '2025-02-05', 1700.00, 'Delivered'),
(12, 12, '2025-02-07', 800.00, 'Pending'),
(13, 13, '2025-02-09', 600.00, 'Delivered'),
(14, 14, '2025-02-12', 950.00, 'Shipped'),
(15, 15, '2025-02-15', 1500.00, 'Pending'),
(16, 16, '2025-02-17', 1250.00, 'Shipped'),
(17, 17, '2025-02-20', 2000.00, 'Shipped'),
(18, 18, '2025-02-22', 2200.00, 'Pending'),
(19, 19, '2025-02-25', 1800.00, 'Delivered'),
(20, 20, '2025-02-28', 2100.00, 'Cancelled'),
(21, 21, '2025-03-02', 800.00, 'Shipped'),
(22, 22, '2025-03-04', 900.00, 'Delivered'),
(23, 23, '2025-03-06', 300.00, 'Shipped'),
(24, 24, '2025-03-09', 850.00, 'Shipped'),
(25, 25, '2025-03-12', 750.00, 'Delivered'),
(26, 26, '2025-03-15', 500.00, 'Pending'),
(27, 27, '2025-03-17', 1000.00, 'Shipped'),
(28, 28, '2025-03-20', 450.00, 'Cancelled'),
(29, 29, '2025-03-22', 1250.00, 'Pending'),
(30, 30, '2025-03-25', 300.00, 'Shipped'),
(31, 31, '2025-03-28', 600.00, 'Delivered'),
(32, 32, '2025-03-30', 950.00, 'Shipped'),
(33, 33, '2025-04-02', 700.00, 'Pending'),
(34, 34, '2025-04-05', 1200.00, 'Delivered'),
(35, 35, '2025-04-07', 1500.00, 'Shipped'),
(36, 36, '2025-04-10', 2500.00, 'Pending'),
(37, 37, '2025-04-12', 1000.00, 'Delivered'),
(38, 38, '2025-04-15', 1200.00, 'Shipped'),
(39, 39, '2025-04-18', 1800.00, 'Pending'),
(40, 40, '2025-04-20', 1600.00, 'Shipped');
CREATE TABLE Invoices (
    InvoiceID INT PRIMARY KEY,
    CustomerID INT,
    InvoiceDate DATE,
    TotalAmount DECIMAL(10, 2),
    Status VARCHAR(50)
);
INSERT INTO Invoices (InvoiceID, CustomerID, InvoiceDate, TotalAmount, Status) VALUES
(1, 1, '2025-01-01', 500.00, 'Paid'),
(2, 2, '2025-01-03', 700.00, 'Pending'),
(3, 3, '2025-01-10', 300.00, 'Paid'),
(4, 4, '2025-01-15', 400.00, 'Overdue'),
(5, 5, '2025-01-18', 600.00, 'Paid'),
(6, 6, '2025-01-20', 800.00, 'Pending'),
(7, 7, '2025-02-01', 200.00, 'Paid'),
(8, 8, '2025-02-05', 350.00, 'Pending'),
(9, 9, '2025-02-07', 450.00, 'Paid'),
(10, 10, '2025-02-10', 550.00, 'Pending'),
(11, 11, '2025-02-15', 650.00, 'Overdue'),
(12, 12, '2025-02-20', 750.00, 'Paid'),
(13, 13, '2025-03-01', 900.00, 'Paid'),
(14, 14, '2025-03-05', 1000.00, 'Pending'),
(15, 15, '2025-03-10', 1200.00, 'Paid'),
(16, 16, '2025-03-12', 1500.00, 'Overdue'),
(17, 17, '2025-03-15', 1800.00, 'Paid'),
(18, 18, '2025-03-20', 2500.00, 'Pending'),
(19, 19, '2025-04-01', 3000.00, 'Paid'),
(20, 20, '2025-04-03', 3500.00, 'Pending'),
(21, 21, '2025-04-05', 4000.00, 'Overdue'),
(22, 22, '2025-04-08', 4500.00, 'Paid'),
(23, 23, '2025-04-10', 5000.00, 'Pending'),
(24, 24, '2025-04-12', 5500.00, 'Paid'),
(25, 25, '2025-04-15', 6000.00, 'Overdue'),
(26, 26, '2025-04-20', 6500.00, 'Paid'),
(27, 27, '2025-05-01', 7000.00, 'Pending'),
(28, 28, '2025-05-03', 7500.00, 'Paid'),
(29, 29, '2025-05-07', 8000.00, 'Pending'),
(30, 30, '2025-05-10', 8500.00, 'Paid'),
(31, 31, '2025-05-12', 9000.00, 'Overdue'),
(32, 32, '2025-05-15', 9500.00, 'Paid'),
(33, 33, '2025-05-18', 10000.00, 'Pending'),
(34, 34, '2025-06-01', 10500.00, 'Paid'),
(35, 35, '2025-06-03', 11000.00, 'Pending'),
(36, 36, '2025-06-05', 11500.00, 'Paid'),
(37, 37, '2025-06-07', 12000.00, 'Overdue'),
(38, 38, '2025-06-10', 12500.00, 'Paid'),
(39, 39, '2025-06-12', 13000.00, 'Pending'),
(40, 40, '2025-06-15', 13500.00, 'Paid');
CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100)
);
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
CREATE TABLE EmployeeProjects (
    EmployeeProjectID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    StartDate DATE,
    EndDate DATE,
    Role VARCHAR(100)
);
INSERT INTO EmployeeProjects (EmployeeProjectID, EmployeeID, ProjectID, StartDate, EndDate, Role) VALUES
(1, 1, 1, '2023-01-10', '2023-06-10', 'Lead Developer'),
(2, 2, 2, '2023-02-15', '2023-07-15', 'Project Manager'),
(3, 3, 1, '2023-03-01', '2023-08-01', 'Developer'),
(4, 4, 3, '2023-04-05', '2023-09-05', 'QA Analyst'),
(5, 5, 2, '2023-05-12', '2023-10-12', 'Business Analyst'),
(6, 6, 3, '2023-06-20', '2023-11-20', 'Developer'),
(7, 7, 1, '2023-07-25', '2023-12-25', 'Designer'),
(8, 8, 4, '2023-08-10', '2024-01-10', 'Project Manager'),
(9, 9, 2, '2023-09-15', '2024-02-15', 'Developer'),
(10, 10, 5, '2023-10-05', '2024-03-05', 'QA Analyst'),
(11, 1, 6, '2023-11-15', '2024-04-15', 'Lead Developer'),
(12, 2, 4, '2023-12-01', '2024-05-01', 'Business Analyst'),
(13, 3, 5, '2024-01-10', '2024-06-10', 'Designer'),
(14, 4, 6, '2024-02-15', '2024-07-15', 'Project Manager'),
(15, 5, 7, '2024-03-20', '2024-08-20', 'Developer'),
(16, 6, 8, '2024-04-25', '2024-09-25', 'QA Analyst'),
(17, 7, 7, '2024-05-30', '2024-10-30', 'Lead Developer'),
(18, 8, 9, '2024-06-15', '2024-11-15', 'Project Manager'),
(19, 9, 6, '2024-07-01', '2024-12-01', 'Business Analyst'),
(20, 10, 8, '2024-08-05', '2025-01-05', 'Developer'),
(21, 1, 10, '2024-09-10', '2025-02-10', 'Designer'),
(22, 2, 9, '2024-10-15', '2025-03-15', 'Lead Developer'),
(23, 3, 8, '2024-11-20', '2025-04-20', 'QA Analyst'),
(24, 4, 7, '2024-12-01', '2025-05-01', 'Project Manager'),
(25, 5, 6, '2025-01-10', '2025-06-10', 'Business Analyst'),
(26, 6, 5, '2025-02-20', '2025-07-20', 'Developer'),
(27, 7, 4, '2025-03-25', '2025-08-25', 'Designer'),
(28, 8, 3, '2025-04-10', '2025-09-10', 'Lead Developer'),
(29, 9, 2, '2025-05-05', '2025-10-05', 'QA Analyst'),
(30, 10, 1, '2025-06-15', '2025-11-15', 'Project Manager'),
(31, 1, 5, '2025-07-01', '2025-12-01', 'Developer'),
(32, 2, 4, '2025-08-20', '2026-01-20', 'Lead Developer'),
(33, 3, 6, '2025-09-05', '2026-02-05', 'QA Analyst'),
(34, 4, 7, '2025-10-10', '2026-03-10', 'Business Analyst'),
(35, 5, 8, '2025-11-25', '2026-04-25', 'Designer'),
(36, 6, 9, '2025-12-05', '2026-05-05', 'Project Manager'),
(37, 7, 10, '2026-01-10', '2026-06-10', 'Lead Developer'),
(38, 8, 9, '2026-02-01', '2026-07-01', 'QA Analyst'),
(39, 9, 6, '2026-03-15', '2026-08-15', 'Business Analyst'),
(40, 10, 5, '2026-04-10', '2026-09-10', 'Developer');
CREATE TABLE Departments1 (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(255),
    ManagerID INT
);
INSERT INTO Departments1 (DepartmentID, DepartmentName, ManagerID) VALUES
(1, 'Sales', 1),
(2, 'Marketing', 2),
(3, 'IT', 3),
(4, 'Human Resources', 4),
(5, 'Finance', 5),
(6, 'Operations', 6),
(7, 'Legal', 7),
(8, 'Customer Support', 8),
(9, 'Product Development', 9),
(10, 'Business Analysis', 10),
(11, 'Design', 1),
(12, 'Research and Development', 2),
(13, 'Purchasing', 3),
(14, 'Supply Chain', 4),
(15, 'Public Relations', 5),
(16, 'Quality Assurance', 6),
(17, 'Logistics', 7),
(18, 'Sales Support', 8),
(19, 'Marketing Communications', 9),
(20, 'Legal Affairs', 10),
(21, 'Product Management', 1),
(22, 'Training and Development', 2),
(23, 'Payroll', 3),
(24, 'Compensation', 4),
(25, 'Recruitment', 5),
(26, 'Executive Management', 6),
(27, 'Audit', 7),
(28, 'Corporate Strategy', 8),
(29, 'Customer Success', 9),
(30, 'Field Operations', 10),
(31, 'Business Intelligence', 1),
(32, 'Risk Management', 2),
(33, 'Treasury', 3),
(34, 'Internal Control', 4),
(35, 'Investor Relations', 5),
(36, 'E-commerce', 6),
(37, 'Real Estate', 7),
(38, 'Branding', 8),
(39, 'Content Creation', 9),
(40, 'Software Development', 10);

--Lesson 4 Easy-Level Tasks (10)
--task 1
select top (5) name from [Employees];

--task2
select distinct name from Products;

--task3
select * from Products where Price > 100;

--task4
select * from Customers where name like 'a%';

--task5
select * from Products order by Price asc;

--task6
select * from Employees where Salary >= 5000 and department = 'hr';

--task7
select ISNULL (email, 'noemail@example.com') as email from Customers1;

--task8
select * from Products where Price between 50 and 100;

--task9
select distinct Category, productname from Products1; 

--task10
select * from Products1 order by ProductName;

--Lesson 4 Medium-Level Tasks (10)
--task1 Write a query to select the top 10 products from the Products table, ordered by Price DESC.
select  top (10) * from products order by price desc;

--task2 Use COALESCE to return the first non-NULL value from FirstName or LastName in the Employees table.
select coalesce (firsname, lastname) from Employees;

--task3 Write a query that selects distinct Category and Price from the Products table.
select distinct Category, Price from Products1; 

--task4 Write a query that filters the Employees table to show employees whose Age is either between 30 and 40 or Department = 'Marketing'.
select * from Employees where Age between 30 and 40 or department = 'marketing';

--task5 Use OFFSET-FETCH to select rows 11 to 20 from the Employees table, ordered by Salary DESC.
select * from Employees order by Salary desc
offset 10 rows 
fetch next 10 rows only;

--task6 Write a query to display all products with Price <= 1000 and Stock > 50, sorted by Stock in ascending order.
select * from Products where Price <= 1000 and StockQuantity > 50 order by stockquantity asc;

--task7 Write a query that filters the Products table for ProductName values containing the letter 'e' using LIKE.
select name from Products where name like '%e%';

--task8 Use IN operator to filter for employees who work in either 'HR', 'IT', or 'Finance'.

select E.employeeid, E.name, e.salary, d.departmentname from Employees e
join Departments d
on e.departmentid = d.departmentid
where d.DepartmentName in ('hr', 'it', 'finance');

--task9 Write a query that uses the ANY operator to find employees who earn more than the average salary of all employees.
select * from Employees where Salary > any(select AVG(Salary) from Employees); 

--task10 Use ORDER BY to display a list of customers ordered by City in ascending and PostalCode in descending order.
select * from Customers1 order by City asc, PostalCode desc;

--Lesson 4 Hard-Level Tasks (10)
--task1 Write a query that selects the top 10 products with the highest sales, using TOP(10) and ordered by SalesAmount DESC.
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY,
    ProductID INT,
    CustomerID INT,
    SaleDate DATE,
    SaleAmount DECIMAL(10, 2)
); 
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

select top 10 P.Name, S.productid, S.SaleAmount from Sales s 
join Products p
on p.ProductID = s.ProductID 
order by saleamount desc; 
--task2 Use COALESCE to combine FirstName and LastName into one column named FullName in the Employees table.
select coalesce (firstname, '') + coalesce (lastname, '') as fullname from employees; 

--task3 Write a query to select the distinct Category, ProductName, and Price for products that are priced above $50, using DISTINCT on three columns.
select distinct Category, name, price from products where price > 50;

--task4 Write a query that selects products whose Price is within 10% of the average price in the Products table.
select name, price from Products where Price between 
(select AVG(Price) * 0.9 from products) and
(select AVG(price) * 1.1 from Products)

--task5 Use WHERE clause to filter for employees whose Age is less than 30 and who work in either the 'HR' or 'IT' department.
select E.employeeid, E.name, e.salary, d.departmentname from Employees e
join Departments d
on e.departmentid = d.departmentid
where e.Age <30
and (d.DepartmentName in ('hr', 'it'));

--task6 Use LIKE with wildcard to select all customers whose Email contains the domain '@gmail.com'.
select * from Customers1 where Email like '%@gmail.com%'; 

--task7 Write a query that uses the ALL operator to find employees whose salary is greater than all employees in the 'Sales' department.
SELECT E.employeeid, E.name, E.salary, D.departmentname
FROM Employees E
JOIN Departments D
  ON E.departmentid = D.departmentid
WHERE E.salary > ALL (
    SELECT salary
    FROM Employees
    WHERE departmentid = (SELECT departmentid FROM Departments WHERE departmentname = 'Sales')
);
--task8 Use ORDER BY with OFFSET-FETCH to show employees with the highest salaries, displaying 10 employees at a time (pagination).
select employeeID, name, salary from  Employees order by Salary	desc 
offset 0 rows fetch next 10 rows only;
--task9 Write a query that filters the Orders table for orders placed in the last 30 days using BETWEEN and CURRENT_DATE.
SELECT *
FROM Orders1
WHERE orderdate BETWEEN DATEADD(DAY, -30, GETDATE()) AND GETDATE();
--task10 Use ANY with a subquery to select all employees who earn more than the average salary for their department
SELECT E.employeeid, E.name, E.salary, D.departmentname
FROM Employees E
JOIN Departments D
  ON E.departmentid = D.departmentid
WHERE E.salary > ANY (
    SELECT AVG(salary)
    FROM Employees
    WHERE departmentid = E.departmentid
);

