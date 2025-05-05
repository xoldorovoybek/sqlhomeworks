select Id, Dt,
  FORMAT(Dt, 'MM') as MothPrefixedWithXero
	 
from Dates

CREATE TABLE MyTabel (
    Id INT,
    rID INT,
    Vals INT
);
INSERT INTO MyTabel VALUES
(121, 9, 1), (121, 9, 8),
(122, 9, 14), (122, 9, 0), (122, 9, 1),
(123, 9, 1), (123, 9, 2), (123, 9, 10);

;with cte as(select * from(select *, row_number() over(partition by Id order by Vals desc) rn
  from MyTabel)t where rn =1)

  select 
  count(Id) DistinctId,
  max(rId) rId,
  sum(Vals) TotalofMaxVals
  
  from cte


--3
CREATE TABLE TestFixLengths (
    Id INT,
    Vals VARCHAR(100)
);
INSERT INTO TestFixLengths VALUES
(1,'11111111'), (2,'123456'), (2,'1234567'), 
(2,'1234567890'), (5,''), (6,NULL), 
(7,'123456789012345');

select * from TestFixLengths
where len(Vals) between 6 and 10


--4

CREATE TABLE TestMaximum (
    ID INT,
    Item VARCHAR(20),
    Vals INT
);
INSERT INTO TestMaximum VALUES
(1, 'a1',15), (1, 'a2',20), (1, 'a3',90),
(2, 'q1',10), (2, 'q2',40), (2, 'q3',60), (2, 'q4',30),
(3, 'q5',20);

select t.ID, t.Item, t.Vals from 
(select *, ROW_NUMBER() over(partition by ID order by Vals desc) rn from TestMaximum)t 
where rn = 1

--5

CREATE TABLE SumOfMax (
    DetailedNumber INT,
    Vals INT,
    Id INT
);
INSERT INTO SumOfMax VALUES
(1,5,101), (1,4,101), (2,6,101), (2,3,101),
(3,3,102), (4,2,102), (4,3,102);

;with ctw as (select t.Id, t.Vals from 
(select *,row_number() over(Partition by Id, DetailedNumber order by Vals desc) rn from SumOfMax)t
where rn =1)

select Id, sum(Vals) SumOfMax from ctw
group by Id   



--6

CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);

;with ctee as(select *,
  case 
    when a - b = 0 then NUll
	else a - b end as output
from TheZeroPuzzle)

select e.Id, e.a, e.b, isnull(cast(e.output as varchar(20)) , ' ') OUTPUT from ctee e


--7
drop table Sales
CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    Product VARCHAR(50),
    Category VARCHAR(50),
    QuantitySold INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50)
);
INSERT INTO Sales (Product, Category, QuantitySold, UnitPrice, SaleDate, Region)
VALUES
('Laptop', 'Electronics', 10, 800.00, '2024-01-01', 'North'),
('Smartphone', 'Electronics', 15, 500.00, '2024-01-02', 'North'),
('Tablet', 'Electronics', 8, 300.00, '2024-01-03', 'East'),
('Headphones', 'Electronics', 25, 100.00, '2024-01-04', 'West'),
('TV', 'Electronics', 5, 1200.00, '2024-01-05', 'South'),
('Refrigerator', 'Appliances', 3, 1500.00, '2024-01-06', 'South'),
('Microwave', 'Appliances', 7, 200.00, '2024-01-07', 'East'),
('Washing Machine', 'Appliances', 4, 1000.00, '2024-01-08', 'North'),
('Oven', 'Appliances', 6, 700.00, '2024-01-09', 'West'),
('Smartwatch', 'Electronics', 12, 250.00, '2024-01-10', 'East'),
('Vacuum Cleaner', 'Appliances', 5, 400.00, '2024-01-11', 'South'),
('Gaming Console', 'Electronics', 9, 450.00, '2024-01-12', 'North'),
('Monitor', 'Electronics', 14, 300.00, '2024-01-13', 'West'),
('Keyboard', 'Electronics', 20, 50.00, '2024-01-14', 'South'),
('Mouse', 'Electronics', 30, 25.00, '2024-01-15', 'East'),
('Blender', 'Appliances', 10, 150.00, '2024-01-16', 'North'),
('Fan', 'Appliances', 12, 75.00, '2024-01-17', 'South'),
('Heater', 'Appliances', 8, 120.00, '2024-01-18', 'East'),
('Air Conditioner', 'Appliances', 2, 2000.00, '2024-01-19', 'West'),
('Camera', 'Electronics', 7, 900.00, '2024-01-20', 'North');

select *, sum(UnitPrice * QuantitySold) over() totalOfallsales from Sales
 
select *, avg(UnitPrice) over(order by Product) avg_price from Sales

select *, count(saleID) over() cnt_trn from Sales

select *, row_number() over(order by UnitPrice desc) rn from Sales

select *, sum(QuantitySold) over(partition by Category) cnt_by_category from Sales

select *, sum(QuantitySold * UnitPrice) over(Partition by region) from Sales

select *, 
format(SaleDate, 'yyyy-MM') as SaleMonth,
SUM(QuantitySold) over(partition by format(SaleDate, 'yyyy-MM')) as TotalQuantity
from Sales
order by SaleDate

;with ctr as(select *, sum(QuantitySold*UnitPrice) over(pArtition by product) tot_price from Sales)

select *, ROW_NUMBER() over(order by tot_price desc) rn from ctr

select *, sum(UnitPrice) over(order by SaleDate) from Sales


;WITH CategoryRevenue AS (
    SELECT
        Category,
        SUM(QuantitySold * UnitPrice) AS CategoryTotalRevenue
    FROM
        Sales
    GROUP BY
        Category
)
SELECT
    Category,
    CategoryTotalRevenue,
    (CategoryTotalRevenue * 100.0) / SUM(CategoryTotalRevenue) OVER () AS PercentageContribution
FROM
    CategoryRevenue
ORDER BY
    PercentageContribution DESC;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    JoinDate DATE
);
INSERT INTO Customers (CustomerName, Region, JoinDate)
VALUES
('John Doe', 'North', '2022-03-01'),
('Jane Smith', 'West', '2023-06-15'),
('Emily Davis', 'East', '2021-11-20'),
('Michael Brown', 'South', '2023-01-10'),
('Sarah Wilson', 'North', '2022-07-25'),
('David Martinez', 'East', '2023-04-30'),
('Laura Johnson', 'West', '2022-09-14'),
('Kevin Anderson', 'South', '2021-12-05'),
('Sophia Moore', 'North', '2023-02-17'),
('Daniel Garcia', 'East', '2022-08-22');


select s.Product, s.QuantitySold, s.SaleDate, s.UnitPrice, c.CustomerName
from Sales s join Customers c on s.Region = c.Region

select * from Sales s right join Customers c on c.Region = s.Region

--18


--22
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
INSERT INTO Products (ProductName, Category, CostPrice, SellingPrice)
VALUES
('Laptop', 'Electronics', 600.00, 800.00),
('Smartphone', 'Electronics', 350.00, 500.00),
('Tablet', 'Electronics', 200.00, 300.00),
('Headphones', 'Electronics', 50.00, 100.00),
('TV', 'Electronics', 900.00, 1200.00),
('Refrigerator', 'Appliances', 1100.00, 1500.00),
('Microwave', 'Appliances', 120.00, 200.00),
('Washing Machine', 'Appliances', 700.00, 1000.00),
('Oven', 'Appliances', 500.00, 700.00),
('Gaming Console', 'Electronics', 320.00, 450.00);


select p.ProductID, p.ProductName, s.QuantitySold
from Products p join Sales s on p.ProductName = s.Product
where s.QuantitySold = 1

--23
select * from Products 
where CostPrice in (select max(CostPrice) from Products)

--24

select p.ProductID, p.CostPrice, s.UnitPrice, s.SaleDate, s.Region, s.QuantitySold
from Products p join Sales s on p.ProductName = s.Product


--25
select * from Products
where SellingPrice > (select avg(SellingPrice) from Products)
