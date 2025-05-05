select * from ProductSales
select
ROW_NUMBER() over(order by SaleDate) row_num, *
from ProductSales

--2

select DENSE_RANK() over(order by Quantity) dens_num,
* from ProductSales

--3 
select
ROW_NUMBER() over(partition by customerID order by Saleamount desc) row_num, *
from ProductSales

--4
select*, lead(SaleAmount, 1, 0) over (order by SaleDate desc) as next_sale
 from ProductSales


--5
  select *, lag(SaleAmount, 1, 0) over (order by SaleDate)  as pre_sale
  from ProductSales

  --6
  select *, rank() over(partition by ProductName  order by SaleAmount desc) saleRank
  from ProductSales
  order by ProductName, saleRank

  --7
  ;with Sales_pre as (
       select
	   *, lag(SaleAmount, 1, 0) over(Partition by CustomerID order by SaleDate) pre_sales
	   from ProductSales
  )
  select 
  SaleID,
  CustomerID,
  SaleDate,
  SaleAmount
  from Sales_pre
  where SaleAmount > pre_sales


  --8
  ;with Sales_pre as (select
  s.SaleID,
  s.ProductName,
  s.SaleDate,
  s.SaleAmount,
  lag(SaleAmount, 1, 0) over(Partition by ProductName order by Saledate) as pre_sal_amount
   from ProductSales s)
   select 
   sp.SaleID,
   sp.ProductName,
   sp.SaleAmount,
   (sp.SaleAmount - sp.pre_sal_amount) as diff
   from Sales_pre sp

   --9
   select *,
   lead(SaleAmount, 1, 0) over(order by Saledate desc) next_sale,
   (SaleAmount - lead(SaleAmount, 1, 0) over(partition by ProductName order by Saledate desc))/ SaleAmount * 100  as diff_percentage
   from ProductSales

   --10
   select *,
   lag(SaleAmount, 1, 1) over(partition by ProductName order by Saledate) pre_sale,
   SaleAmount / (lag(SaleAmount, 1, 1) over(partition by ProductName order by Saledate)) ratio
  
   from ProductSales

   --11
   select *,
   FIRST_VALUE(SaleAmount) over( order by SaleDate) as first_sale,
   SaleAmount - (FIRST_VALUE(SaleAmount) over(Partition by ProductName order by SaleDate)) as diffwithfirst
   from 
   ProductSales 

   --12

   ;with pre_sales as (
                 select  
				 s.SaleID,
				 s.ProductName,
				 s.SaleDate,
				 s.SaleAmount,
				 lag(SaleAmount,1) over(order by SaleDate) sales_pre
				 from ProductSales s
   )
   select 
   p.SaleID,
   p.ProductName,
   p.SaleAmount,
   p.SaleDate
   from pre_sales p
   where SaleAmount > sales_pre

   --13

   select *, 
   sum(SaleAmount) over(Partition by ProductName order by Saledate rows between unbounded preceding and current row) closingBalance
   from ProductSales

   --15
   select *, 
   (Saleamount - avg(SaleAmount) over()) as difffromaverage
   from ProductSales

-16
select *, rank() over(order by Salary)
from Employees1

--17
     
	;with Rank_sal as (
	     select 
		 e.EmployeeID,
		 e.Name,
		 e.Salary,
		 e.HireDate,
		 e.Department,
		 DENSE_RANK() over(Partition by Department Order by Salary desc) as Salary_rank
		 from Employees1 e
	
	)
	select 
	*
	
	from Rank_sal
	where Salary_rank <= 2
	order by Department, Salary desc


	--18
	;with Lowest_sal as (
	      select *,
		  RANK() over(partition by Department order by Salary desc) as sal_rank
		  
		  from Employees1
     )
          select * from 
		  Lowest_sal
		  where sal_rank = 1 
		  order by Department, Salary asc


    --19
	  SELECT
    EmployeeID,
    Name,
    Department,
    Salary,
    HireDate,
    SUM(Salary) OVER(PARTITION BY Department ORDER BY HireDate ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotalSalary
FROM
    Employees1
ORDER BY
    Department,
    HireDate;


	--20
	 select *,
	 sum(Salary) over(partition by Department) as Total_depart
	 
	 from Employees1
	 --21
	 select *,
	 avg(Salary) over(partition by Department) as Total_depart,
	 avg(Salary) over(partition by Department) - Salary as diff_avg_sal_emp
	 
	 from Employees1


	 --23
	 SELECT
    EmployeeID,
    Name,
    Department,
    Salary,
    HireDate,
    AVG(Salary) OVER(PARTITION BY Department ORDER BY HireDate ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS MovingAverageSalary
FROM
    Employees1
ORDER BY
    Department,
    HireDate;
	--24
	WITH RankedEmployees AS (
    SELECT
        EmployeeID,
        Name,
        Department,
        Salary,
        HireDate,
        ROW_NUMBER() OVER(ORDER BY HireDate DESC) AS HireRank
    FROM
        Employees1
)
SELECT
    SUM(Salary) AS SumOfLast3HiredSalaries
FROM
    RankedEmployees
WHERE
    HireRank <= 3;
