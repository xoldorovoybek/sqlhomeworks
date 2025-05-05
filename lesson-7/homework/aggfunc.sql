
-easy level 
--1 
select min(Price) Min_price from Products

--2
Select max(Salary) max_salary from Employees

--3
select count(*) from Customers

--4

select count(distinct Category) from Productss

--5 
select ProductID, sum(SaleAmount) sum_saleamount from Sales
group by ProductID

--6

--select avg(Age) avg_age from Employees


--7 
select DepartmentID, count(EmployeeID) count_Employees  from Employees 
group by DepartmentID

--8
select min(Price) mnp, max(Price) mxp, Category   from productss
group by Category
--9
select Region, sum(sale) from Sales
group by Region

-- 10
 select DepartmentID, count(DepartmentID), sum(Salary) from Employees
 group by DepartmentID
 having count(DepartmentID) > 5
 --medium level
 --1
 select 
 CustomerID, 
 count(ProductID) count_prod, 
 avg(SaleAmount) avg_sale, 
 sum(SaleAmount) sum_sale 
 from Sales
 group by CustomerID

 --2
 --3
 select DepartmentID, min(Salary) min_salary, max(Salary) max_salary from Employees
 group by DepartmentID

 --4
 select DepartmentID, avg(Salary) avg_salary from Employees
 group by DepartmentID

 --5

 select departmentID, count(*), avg(Salary) avg_salary from Employees
 group by DepartmentID

 --6
 select Category, avg(Price) from  productss
 group by Category
 having avg(Price) > 100;

 --7
 select count(distinct ProductID) from productss

 --8
 select * from Sales

 --9
 --10 
 select DepartmentID, 
 sum(Salary) 
 from Employees
 group by DepartmentID
 having sum(Salary) > 100000

 --hard level

 --21 
 select Category, avg(Price) from productss
 group by Category
 having avg(Price) > 200

 --22
 select * from Employees

 --24

 select DepartmentID, 
 sum(Salary) sum_salary,
 avg(Salary) avg_salary
 from Employees
 group by DepartmentID
 having avg(Salary) > 6000


CREATE TABLE Sales1 (
    Product VARCHAR(10),
    Year INT,
    Sales INT
);

INSERT INTO Sales1 (Product, Year, Sales) VALUES
('A', 2022, 1000),
('A', 2023, 1500),
('A', 2024, 1700),
('B', 2022, 1200),
('B', 2023, 1800),
('B', 2024, 1900),
('C', 2022, 1100),
('C', 2023, 1400),
('C', 2024, 1600);

CREATE TABLE SalesPivot (
    Product VARCHAR(10),
    [2022] INT,
    [2023] INT,
    [2024] INT
);

INSERT INTO SalesPivot (Product, [2022], [2023], [2024]) VALUES
('A', 1000, 1500, 1700),
('B', 1200, 1800, 1900),
('C', 1100, 1400, 1600);

--pivot 
select *
from Sales1
pivot (
   sum(Sales) for [Year] in ([2022], [2023], [2024])
) as PivotTable

--unpivot
select * from SalesPivot
unpivot (
  Sales for [Year]  in ([2022],[2023],[2024])
) pvt
