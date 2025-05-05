CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil',3),('Eraser',4),('Notebook',2);

;with cte as (select * from Grouped
              union all
			  select Product, Quantity - 1 from cte where Quantity > 1
			  )
			  select Product, 1 Quantity from cte


--DROP TABLE IF EXISTS #RegionSales;
--GO
CREATE TABLE #RegionSales
(
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
GO
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10),
('South','ACE',67),
('East','ACE',54),
('North','ACME',65),
('South','ACME',9),
('East','ACME',1),
('West','ACME',7),
('North','Direct Parts',8),
('South','Direct Parts',7),
('West','Direct Parts',12);

select * from #RegionSales

;with region as (select distinct Region from #RegionSales),
 distributor as (select distinct Distributor from #RegionSales),
 reg_sal as (select * from region
 cross join distributor)

 select rg.Region, rg.Distributor, isnull(sl.Sales, 0) Sales from reg_sal rg left join #RegionSales sl
 on sl.Region = rg.Region and sl.Distributor = rg.Distributor



 CREATE TABLE Employee (
  id INT,
  name VARCHAR(255),
  department VARCHAR(255),
  managerId INT
);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL),
(102, 'Dan', 'A', 101),
(103, 'James', 'A', 101),
(104, 'Amy', 'A', 101),
(105, 'Anne', 'A', 101),
(106, 'Ron', 'B', 101);


select mn.name mnName  from Employee dp join Employee mn
on dp.managerId = mn.id
group by mn.name
having count(dp.name) >= 5


CREATE TABLE Products (
  product_id INT,
  product_name VARCHAR(40),
  product_category VARCHAR(40)
);
CREATE TABLE Orders (
  product_id INT,
  order_date DATE,
  unit INT
);

INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'),
(4, 'Lenovo', 'Laptop'),
(5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1, '2020-02-05', 60),
(1, '2020-02-10', 70),
(2, '2020-01-18', 30),
(2, '2020-02-11', 80),
(3, '2020-02-17', 2),
(3, '2020-02-24', 3),
(4, '2020-03-01', 20),
(4, '2020-03-04', 30),
(4, '2020-03-04', 60),
(5, '2020-02-25', 50),
(5, '2020-02-27', 50),
(5, '2020-03-01', 50);

;with leetcode as (select p.product_id, p.product_name, order_date, o.unit  from Orders o join Products p
on o.product_id = p.product_id),

leetcodefeb as (select l.product_name, datename(month, order_date) month, unit  from leetcode l
where product_id in (select product_id from leetcode where month(order_date) = 2)),

cte1 as (select * from leetcodefeb

where month = 'February')

select product_name, sum(unit) unit from  cte1
group by product_name
having sum(unit) >= 100

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID     INT PRIMARY KEY,
  CustomerID  INT NOT NULL,
  [Count]     MONEY NOT NULL,
  Vendor      VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1, 1001, 12, 'Direct Parts'),
(2, 1001, 54, 'Direct Parts'),
(3, 1001, 32, 'ACME'),
(4, 2002, 7, 'ACME'),
(5, 2002, 16, 'ACME'),
(6, 2002, 5, 'Direct Parts');


--5
select CustomerID, Vendor  from Orders o 
group by CustomerID, Vendor
having count(o.Count) > 1 

--6

declare @Check_Prime int  = 91;
declare @Divisor int = 2;
declare @IsPrime bit = 1;

while @Divisor * @Divisor <= @Check_Prime
begin
     if @Check_Prime % @Divisor = 0
	 begin
	      set @IsPrime = 0;
		  break;
     end; 
	 set @Divisor = @Divisor + 1
end;
;
if @IsPrime = 1
   print 'This number is prime'
else 
   print 'This number is not prime'

--7

   CREATE TABLE Device (
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Bangalore'),
(12, 'Hosur'),
(12, 'Hosur'),
(13, 'Hyderabad'),
(13, 'Hyderabad'),
(13, 'Secunderabad'),
(13, 'Secunderabad'),
(13, 'Secunderabad');

select * from Device

drop table Employee
CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001, 'Mark', 60000, 2),
(1002, 'Antony', 40000, 2),
(1003, 'Andrew', 15000, 1),
(1004, 'Peter', 35000, 1),
(1005, 'John', 55000, 1),
(1006, 'Albert', 25000, 3),
(1007, 'Donald', 35000, 3);

select * from Employee
where Salary > (select avg(Salary) from Employee)



--7
select * from Device

;with LocationSignalCounts as (
      select 
	  Device_id,
	  Locations,
	  count(*) as signal_count
	  from Device
	  group by 
	  Device_id,
	  Locations
),
--select * from LocationSignalCounts
 RankedLocations as (
       select 
	   Device_id,
	   Locations,
	   signal_count,
	   rank() over(partition by Device_id order by signal_count desc) as rank_num
	   from LocationSignalCounts
 ),
 --select * from RankedLocations

  MaxSignalLocation as (
        select Device_id,
		Locations as Max_signal_Location
        from RankedLocations
		where rank_num = 1
  
  )
 --- select * from MaxSignalLocation

  select 
  d.Device_id,
  count(Distinct d.Locations) as no_of_location,
  count(d.Locations) as no_of_signals
  
  from Device d
  join 
  MaxSignalLocation msl on d.Device_id = msl.Device_id
  group by 
  d.Device_id,
  msl.Max_signal_Location
  order by 
  d.Device_id;

  --10

  CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

select * from Spending
WITH UserPlatformUsage AS (
    SELECT
        Spend_date,
        User_id,
        STRING_AGG(Platform, ',') WITHIN GROUP (ORDER BY Platform) AS Platforms,
        SUM(Amount) AS TotalAmount
    FROM
        Spending
    GROUP BY
        Spend_date,
        User_id
),
PlatformCategories AS (
    SELECT
        Spend_date,
        User_id,
        CASE
            WHEN Platforms = 'Desktop' THEN 'Desktop'
            WHEN Platforms = 'Mobile' THEN 'Mobile'
            WHEN Platforms IN ('Desktop,Mobile', 'Mobile,Desktop') THEN 'Both'
        END AS PlatformCategory,
        TotalAmount
    FROM
        UserPlatformUsage
)
SELECT
    ROW_NUMBER() OVER (ORDER BY Spend_date, Platform) AS Row,
    Spend_date,
    Platform,
    SUM(CASE WHEN pc.PlatformCategory = p.Platform THEN pc.TotalAmount ELSE 0 END) AS Total_Amount,
    COUNT(DISTINCT CASE WHEN pc.PlatformCategory = p.Platform THEN pc.User_id ELSE NULL END) AS Total_users
FROM
    (SELECT DISTINCT Spend_date FROM Spending) AS d
CROSS JOIN
    (VALUES ('Mobile'), ('Desktop'), ('Both')) AS p(Platform)
LEFT JOIN
    PlatformCategories pc ON d.Spend_date = pc.Spend_date
GROUP BY
    d.Spend_date,
    p.Platform
ORDER BY
    d.Spend_date,
    p.Platform;
