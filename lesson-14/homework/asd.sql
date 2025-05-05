-1.Create a numbers table using a recursive query.
   ;with cte as (select 1 as num
                union all
				select num + 1 from cte where num < 100
   ) select * from cte


--2.Beginning at 1, this script uses a recursive statement to double the number for each record
     ;with cte1 as (select 1 as num 
	            union all
				select num + 1 from cte1 where num < 10
	 ),
	 cte2 as (select num*2 as double_num from cte1)
	 select * from cte2
	 
--3.Write a query to find the total sales per employee using a derived table.(Sales, Employees)
    select c.totalsales, e.FirstName, e.LastName from
	(select s.EmployeeID, sum(s.SalesAmount) totalsales  from Sales s
	 group by s.EmployeeID) c
	 join Employees e on c.EmployeeID = e.EmployeeID

--4.Create a CTE to find the average salary of employees.(Employees)
   ;with avg_salary as (
          select avg(salary) avg_sal from Employees
   ) select * from avg_salary

--5.Write a query using a derived table to find the highest sales for each product.(Sales, Products)
    select p.ProductName, c.max_sales from (
	    select ProductID, max(SalesAmount) max_sales from Sales
		group by ProductID
	)c join Products p on c.ProductID = p.ProductID

	--select * from Products


--6.Use a CTE to get the names of employees who have made more than 5 sales.(Sales, Employees)
    ;with stockQuantity as (
	select s.EmployeeID, count(s.ProductID) count_sales  from Sales s
	group by s.EmployeeID
	     ),
    name_emp as (select e.EmployeeID, concat(e.FirstName, ' ', e.LastName) fullName from Employees e)
	select ne.fullName, st.count_sales from stockQuantity st join name_emp ne on st.EmployeeID = ne.EmployeeID
	and st.count_sales > 5

--7.Write a query using a CTE to find all products with sales greater than $500.(Sales, Products)
     ;with about_sales as (select 
	 ProductID, sum(SalesAmount) totalsales from Sales
	 group by ProductID),
	 about_products as (select ProductID, ProductName from Products)
	 select p.ProductName, a.totalsales from about_sales a join about_products p on a.ProductID = p.ProductID
	 and a.totalsales > 500




--8.Create a CTE to find employees with salaries above the average salary.(Employees)
   ;with cte_emp as (select avg(Salary) avg_salary from Employees)
   select * from Employees
   where Salary > (select * from cte_emp)

--9.Write a query to find the total number of products sold using a derived table.(Sales, Products)
   select p.ProductName, c.count_products from 
   (select s.ProductID, 
   count(s.ProductID)
   count_products from Sales s
   group by s.ProductID)c
   join Products p on c.ProductID = p.ProductID

     

--10.Use a CTE to find the names of employees who have not made any sales.(Sales, Employees)
  ;with cte_emplo as (select e.EmployeeID, e.FirstName, e.LastName from Employees e),
  cte_sales as (select s.EmployeeID  from Sales s)
  select * from cte_emplo e where e.EmployeeID not in (select EmployeeID from cte_sales)
  
  --11
  declare @num int = 7

  ;with factorial as (
       select 1 as Num, 1 as Fact
	   union all
	   select Num + 1, Fact*(Num + 1) from factorial
	   where Num + 1 <= @num
  )
  select top 1 fact as fact_orial
  from factorial 
  order by num desc
  option (maxrecursion 32767);

  --12 

  declare @numN int = 10;

  ;with fibo as (
       select 1 as N, 0 as f1, 1 as f2
	   union all
	   select N + 1, f2, f1 + f2
	   from fibo
	   where N + 1 <= @numN
   )
   select  F1 as Fibo_number
   from fibo 
   option(maxrecursion 32767);

   --13 
   ;with cte_string as (
   select 'Example' as string
   union all
   select left(string, len(string)-1) from cte_string
   where len(string) > 1
   
   ) select * from cte_string

   --14
 ;with emp_cte as (select e.EmployeeID, 
 concat(e.FirstName, ' ', e.LastName) full_name from Employees e),
 sales_emp as (
          select s.EmployeeID, sum(s.SalesAmount) totalsales  from Sales s
		  group by s.EmployeeID ) 
 select e.full_name, s.totalsales 
 from emp_cte e join sales_emp s 
 on e.EmployeeID = s.EmployeeID
 order by s.totalsales desc

 --15
 select top 5 e.FirstName, e.LastName, c.count_orders from (select s.EmployeeID, count(ProductID) count_orders
               from Sales s
			   group by s.EmployeeID)c
			   join Employees e on c.EmployeeID = e.EmployeeID
 

   --16
   ;with cte_month as (select s.EmployeeID,
   s.ProductID, 
   s.SalesID,
   abs((month(s.SaleDate) - month(getdate()))) diff_month
   from Sales s)
   select * from cte_month

   --17
   select p.ProductName, a.totalsales from (select  
   s.ProductID,  sum(s.SalesAmount) totalsales
   from sales s
   group by s.ProductID)a join Products p on a.ProductID = p.ProductID

   --18
   ; with cte_lastyear as (select * from Sales 
    where  year(SaleDate) =2024)
	select * from cte_lastyear

	--19
	;with cte_sal as (select s.EmployeeID, sum(s.SalesAmount) totalsales from Sales s
	                   group by s.EmployeeID),
     cte_em as (select e.EmployeeID, CONCAT(e.FirstName, ' ', e.LastName) fullname from Employees e)
	 select e.fullname, s.totalsales 
	 from cte_sal s join cte_em e 
	 on s.EmployeeID = e.EmployeeID

	 --20
	 select e.FirstName, e.LastName, c.totalsales from(
	      select s.EmployeeID, sum(s.SalesAmount) totalsales from Sales s
		  where month(s.SaleDate) = 2
		  group by s.EmployeeID
		  ) c join Employees e on c.EmployeeID = e.EmployeeID

    --21 
	declare @n int = 5 
	;with Num_cte (level, result) as (
	   select 1 as level, cast('1' as varchar(max)) as result
	   union all
	   select level + 1, result + cast(level + 1 as varchar) from Num_cte
	   where level + 1 <= @n
	)
	select result from Num_cte

	--23
	select * from Activity
	select * from Schedule


	--Create a complex query that uses both a CTE and a derived table to calculate sales totals for each department and product.
	--(Employees, Sales, Products, Departments)
  
   ;with cte_dep as (select * from Departments),
	cte_e as (select e.DepartmentID, e.EmployeeID from Employees e),
	cte_s as (select s.EmployeeID, sum(s.SalesAmount) totalsales from Sales s
	      group by s.EmployeeID),
	cte_total_dep as (select d.DepartmentName, s.totalsales from cte_e e 
	              join cte_dep d on e.DepartmentID = d.DepartmentID
	              join cte_s s on e.EmployeeID = s.EmployeeID)
     select DepartmentName, sum(totalsales) totalsum_by  from cte_total_dep
	 group by DepartmentName

	              
	         
