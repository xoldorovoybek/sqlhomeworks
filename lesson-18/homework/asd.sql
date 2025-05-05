select concat(FirstName, ' ', LastName) FullName,
     d.Department, Salary, Salary * BonusPercentage/100 as BonusAmount

from Employees e join DepartmentBonus d 
on e.Department = d.Department

create table #EmployeesBonus (FullName varchar(50), Department varchar(30), Salary float, BonusAmount float)

insert into #EmployeesBonus select concat(FirstName, ' ', LastName) FullName,
     d.Department, Salary, Salary * BonusPercentage/100 as BonusAmount

from Employees e join DepartmentBonus d 
on e.Department = d.Department

select * from #EmployeesBonus


--2
create procedure IncreaseDepartment (
       @DepartmentName nvarchar(50),
	   @IncreasePercentage decimal(5,2)
)
as 
begin
        update Employees
		set Salary = Salary * (1 + @IncreasePercentage / 100)
		where Department = @DepartmentName;

		select EmployeeID, FirstName, LastName, Department, Salary 
		from Employees
		where Department = @DepartmentName

end 
exec IncreaseDepartment @DepartmentName = 'Sales', @IncreasePercentage = 10;


exec IncreaseDepartment @DepartmentName = 'IT', @IncreasePercentage = 15;

exec IncreaseDepartment @DepartmentName = 'HR', @IncreasePercentage = 8;


CREATE TABLE Products_Current (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

CREATE TABLE Products_New (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Price DECIMAL(10,2)
);

INSERT INTO Products_Current VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 600),
(3, 'Smartphone', 800);

INSERT INTO Products_New VALUES
(2, 'Tablet Pro', 700),
(3, 'Smartphone', 850),
(4, 'Smartwatch', 300);

merge into Products_current as Target
using Products_new as Source
on (Target.ProductID = source.ProductID) 

when matched then 
     update set Target.ProductName = Source.ProductName,
	            Target.Price = Source.Price

when not matched by target then
     insert (ProductID, ProductName, Price)
	 values(Source.ProductID, Source.ProductName, Source.price)
when not matched by source then
     delete;

select ProductID, ProductName, Price from Products_Current


--4
CREATE TABLE  Tree (id INT, p_id INT);
TRUNCATE TABLE Tree;
INSERT INTO Tree (id, p_id) VALUES (1, NULL);
INSERT INTO Tree (id, p_id) VALUES (2, 1);
INSERT INTO Tree (id, p_id) VALUES (3, 1);
INSERT INTO Tree (id, p_id) VALUES (4, 2);
INSERT INTO Tree (id, p_id) VALUES (5, 2);

select id,
 case 
     when p_id is null then 'Root'
	 when id in (select p_id from tree) then 'Inner'
     else 'Leaf' end as type
from Tree

--5

CREATE TABLE Signups (user_id INT, time_stamp DATETIME);
CREATE TABLE Confirmations (user_id INT, time_stamp DATETIME, action ENUM('confirmed','timeout'));

TRUNCATE TABLE Signups;
INSERT INTO Signups (user_id, time_stamp) VALUES 
(3, '2020-03-21 10:16:13'),
(7, '2020-01-04 13:57:59'),
(2, '2020-07-29 23:09:44'),
(6, '2020-12-09 10:39:37');

TRUNCATE TABLE Confirmations;
INSERT INTO Confirmations (user_id, time_stamp, action) VALUES 
(3, '2021-01-06 03:30:46', 'timeout'),
(3, '2021-07-14 14:00:00', 'timeout'),
(7, '2021-06-12 11:57:29', 'confirmed'),
(7, '2021-06-13 12:58:28', 'confirmed'),
(7, '2021-06-14 13:59:27', 'confirmed'),
(2, '2021-01-22 00:00:00', 'confirmed'),
(2, '2021-02-28 23:59:59', 'timeout');



--6
drop table Employees
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);


select * from employees
where salary in (select min(salary) from employees)


--7
-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10,2)
);

-- Sales Table


-- Создание хранимой процедуры GetProductSalesSummary
CREATE PROCEDURE GetProductSalesSummary (
    @ProductID INT
)
AS
BEGIN
    -- Выбор ProductName и агрегированных данных о продажах
    SELECT
        p.ProductName,
        SUM(s.Quantity) AS TotalQuantitySold,
        SUM(s.Quantity * p.Price) AS TotalSalesAmount,
        MIN(s.SaleDate) AS FirstSaleDate,
        MAX(s.SaleDate) AS LastSaleDate
    FROM
        Products p
    LEFT JOIN
        Sales s ON p.ProductID = s.ProductID
    WHERE
        p.ProductID = @ProductID
    GROUP BY
        p.ProductName;
END;
GO

-- Инструкции по использованию хранимой процедуры:

-- 1. Вызов хранимой процедуры для получения сводки продаж продукта с ProductID = 1
EXEC GetProductSalesSummary @ProductID = 1;


-- 2. Вызов хранимой процедуры для получения сводки продаж продукта с ProductID = 7
EXEC GetProductSalesSummary @ProductID = 7;

-- 3. Вызов хранимой процедуры для продукта, у которого нет продаж (например, ProductID = 20)
EXEC GetProductSalesSummary @ProductID = 20;
