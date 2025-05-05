-Find customers who purchased at least one item in March 2024 using EXISTS
 select s1.CustomerName from #Sales s1
 where exists (select * from #Sales s2 where s1.CustomerName = s2.CustomerName 
 and SaleDate between '2024-03-01' and '2024-03-31')
 
--Find the product with the highest total sales revenue using a subquery.
 select s2.Product, sum(Price*Quantity) total_revenue 
 from #Sales s2 
 group by s2.Product
 having sum(Price*Quantity) = (
   select max(total_reve) from (select s2.Product, sum(Price*Quantity) total_reve
 from #Sales s2 
 group by s2.Product)b
 )


 ;with total as (select s.Product, sum(s.Price * s.Quantity) total_reve from  #Sales s
 group by s.Product)
  
  select max(total_reve) from total


  

  
  --Find the second highest sale amount using a subquery
   select min(total_price) from (select top 2 s.Product, sum(s.Price) total_price from #Sales s
  group by s.Product
  order by total_price desc) as bb
   
--Find the total quantity of products sold per month using a subquery
select  distinct datename(MONTH, s2.SaleDate) as monthName,
 (select sum(Quantity)  
 from #Sales s1
 where datename(month, s1.SaleDate) = datename(month, s2.SaleDate)) totalQuantity
 from #Sales s2 






--Find customers who bought same products as another customer using EXISTS */

select distinct s1.CustomerName 
from #Sales s1 
  where exists  (select 1
				from #Sales s2
				where s2.Product = s1.Product 
				and s2.CustomerName <> s1.CustomerName
				)


create table Fruits(Name varchar(50), Fruit varchar(50)) insert into Fruits values 
('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'), ('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), ('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), 
('Mario', 'Apple'), ('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
('Mario', 'Orange') -- Return how many fruits does each person have in individual fruit level
--7
select  Name, Fruit, count(1) countfruits from  Fruits
group by Name, Fruit
order by Name, countfruits desc



--Expected Output /* Name Apple Orange Banana Francesko 3 2 1 Li 2 1 1 Mario 3 1 2 */

create table Family(ParentId int, ChildID int) insert into Family values (1, 2), (2, 3), (3, 4)

--Return older people in the family with younger ones

WITH FamilyTree AS (
    -- Anchor member: Get direct parent-child relationships
    SELECT ParentId AS AncestorId, ChildID AS DescendantId
    FROM Family

    UNION ALL

    -- Recursive member: Find descendants of descendants
    SELECT ft.AncestorId, f.ChildID
    FROM FamilyTree ft
    INNER JOIN Family f ON ft.DescendantId = f.ParentId
)
SELECT DISTINCT AncestorId AS PID, DescendantId AS CHID
FROM FamilyTree
ORDER BY PID, CHID;

CREATE TABLE #Orders ( CustomerID INTEGER, OrderID INTEGER, DeliveryState VARCHAR(100) NOT NULL, 
Amount MONEY NOT NULL, PRIMARY KEY (CustomerID, OrderID) ); 

INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES (1001,1,'CA',340),(1001,2,'TX',950),
(1001,3,'TX',670), (1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650), (3003,7,'CA',830),(4004,8,'TX',120); 

/* Write an SQL statement given the following requirements. For every customer 
that had a delivery to California, provide a result set of the customer orders that were delivered to Texas*/

select * from #Orders a
where DeliveryState = 'TX'
and CustomerID in (select CustomerID from #Orders where DeliveryState = 'CA')


CREATE TABLE #Routes ( RouteID INTEGER NOT NULL, DepartureCity VARCHAR(30) NOT NULL, 
ArrivalCity VARCHAR(30) NOT NULL, Cost MONEY NOT NULL, PRIMARY KEY (DepartureCity, ArrivalCity) ); 

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES (1,'Tashkent','Samarkand',100), (2,'Samarkand','Bukhoro',200), (3,'Bukhoro','Khorezm',300), 
(4,'Samarkand','Khorezm',400), (5,'Tashkent','Jizzakh',100), (6,'Jizzakh','Samarkand',50); 

--Write a query to return the route to reach from Tashkent to Khorezm. 
--The result should include the cheapest 
--and the most expensive routes
select * from #Routes



--11

CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')


select *, ROW_NUMBER() over(order by Vals) row_num from #RankingPuzzle

--12

CREATE TABLE #Consecutives
(
     Id VARCHAR(5)  
    ,Vals INT /* Value can be 0 or 1 */
)
 
INSERT INTO #Consecutives VALUES
('a', 1),
('a', 0),
('a', 1),
('a', 1),
('a', 1),
('a', 0),
('b', 1),
('b', 1),
('b', 0),
('b', 1),
('b', 0)

select * from #Consecutives



--13

CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

;with cte as(select *, 
avg(SalesAmount) over(partition by Department) avg_salary_by_department
from #EmployeeSales) 
select * from cte
where SalesAmount > avg_salary_by_department

--14

SELECT es1.EmployeeName, es1.Department, es1.SalesAmount, es1.SalesMonth, es1.SalesYear
FROM #EmployeeSales es1
WHERE NOT EXISTS (
    SELECT 1
    FROM #EmployeeSales es2
    WHERE es1.SalesMonth = es2.SalesMonth
      AND es1.SalesYear = es2.SalesYear
      AND es2.SalesAmount > es1.SalesAmount
);

--15
SELECT DISTINCT es.EmployeeName
FROM #EmployeeSales es
WHERE NOT EXISTS (
    SELECT DISTINCT SalesMonth, SalesYear
    FROM #EmployeeSales
    EXCEPT
    SELECT SalesMonth, SalesYear
    FROM #EmployeeSales AS es_inner
    WHERE es_inner.EmployeeName = es.EmployeeName
);



CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

;with cte as (select *, avg(Price) over(order by (select null)) avg_price from Products)
select * from cte
where Price > avg_price

--17

select * from Products
where Stock < (select max(Stock) from Products)


--18
select * from Products
where Category = 'Electronics'

--19

select * from Products
where Price > (select min(Price) from Products where  Category = 'Electronics')

--20

;with cta as (select *, avg(Price) over(partition by Category) avg_price_by_cate from Products)
select * from cta
where price > avg_price_by_cate


CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');

select * from Orders o join Products p on o.ProductID = p.ProductID
where Quantity = 1


select * from Orders o join Products p on o.ProductID = p.ProductID
where Quantity > (select avg(Quantity) from Orders)

select * from Products p left join Orders o on p.ProductID = o.ProductID
where Quantity = 0

select * from Orders o join Products p on o.ProductID = p.ProductID
where Quantity = (select max(Quantity) from Orders)

select * from Orders o join Products p on o.ProductID = p.ProductID
where Quantity > (select avg(Quantity) from Orders)
