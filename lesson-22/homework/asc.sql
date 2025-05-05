--1
	select *,
	sum(total_amount) over(partition by customer_name) total_sales
	from sales_data

	--2
	select *, count(product_name) over(partition by product_category)
	from sales_data
	--3
	select *, 
	max(total_amount) over(partition by product_category) from sales_data

	--4
	select *, 
	min(total_amount) over(partition by product_category) from sales_data

	--5
	select *, avg(total_amount) over(order by order_date rows between 1 preceding and 1 following)
	from sales_data

	--6
	select *, sum(total_amount) over(partition by region) 
	from sales_data

	--7
	;with cte1 as (
	 select customer_id,
	 customer_name,
	 sum(total_amount) as total_purchase_amount
     from sales_data
	 group by customer_id, customer_name
	)
	select *,
	rank() over (order by total_purchase_amount desc) as customer_rank
	from cte1

	--8
	select s.customer_id, s.customer_name, s.order_date, 
	s.product_category, s.product_name, 
	s.quantity_sold, s.region, s.sale_id,
	s.total_amount, s.total_amount-lag(total_amount, 1, 0) over(partition by customer_name order by order_date)  as diff_pre_day
	from sales_data s

	--9

	;with cte2 as (
	select s.product_category, s.product_name, s.unit_price,
	ROW_NUMBER() over(partition by product_category order by unit_price desc) rn
	
	from sales_data s
	)
	select * from cte2
	where rn <= 3
	order by  product_category, unit_price desc

	--10

   select region, order_date,
   
   sum(total_amount) over(partition by region) cumulative_sales
   from sales_data
   order by region, order_date;


   --11
   select  distinct product_category, 
   sum(total_amount) over(partition by product_category) revenue

   from sales_data


   --12
   create table pre_values (id int)
   insert into pre_values values  (1)
   insert into pre_values values  (2)
   insert into pre_values values  (3)
   insert into pre_values values  (4)
   insert into pre_values values  (5)

   select *, sum(id) over(order by id) sumPreValues from pre_values

   --13
   CREATE TABLE OneColumn (
    Value SMALLINT
		);
		INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);

   select *, sum(Value) over(order by Value rows between 1 preceding and current row) Sum_of_previos from OneColumn 

	--14
	CREATE TABLE Row_Nums (
    Id INT,
    Vals VARCHAR(10)
);
INSERT INTO Row_Nums VALUES
(101,'a'), (102,'b'), (102,'c'), 
(103,'f'), (103,'e'), (103,'q'), (104,'r'), (105,'p');

;with PartionDate as (
   select *,
   ROW_NUMBER() over (partition by Id order by Vals) as rn
   from Row_Nums
  ),
  startNum as (
            select Id, (ROW_NUMBER() over(order by Id)*2) - 1 as start_num
			from(select distinct Id from Row_Nums) as UniqueIds
  )

  --select * from startNum
  select pd.Id, pd.Vals, sn.start_num + pd.rn - 1 as ROwnumber 
  from PartionDate pd 
  join 
      startNum sn on pd.Id = sn.Id
	  order by pd.Id, pd.Vals

select customer_id, customer_name
from sales_data
group by
customer_id, customer_name
having count(distinct product_category) >1 ;
 
 ;WITH CustomerCategoryCount AS (
    SELECT
        customer_id,
        customer_name,
        product_category,
        ROW_NUMBER() OVER (PARTITION BY customer_id, product_category ORDER BY (SELECT NULL)) AS rn
    FROM
        sales_data
),


CategoryCountPerCustomer AS (
    SELECT
        customer_id,
        customer_name,
        COUNT(*) OVER (PARTITION BY customer_id) AS distinct_categories
    FROM
        CustomerCategoryCount
    GROUP BY
        customer_id,
        customer_name,
        product_category
)
SELECT DISTINCT
    customer_id,
    customer_name
FROM
    CategoryCountPerCustomer
WHERE
    distinct_categories > 1;
--16
;with cte4 as (select *, avg(total_amount) 
over(partition by region) avg_region  from sales_data)
select * from cte4
where total_amount > avg_region

--17
select *, 
rank() over(partition by region order by total_amount) rank_num,
dense_rank() over(order by total_amount) dens_runk
from sales_data

--18
select customer_id, order_date,
 sum(total_amount) over(order by order_date) cumulative_sum
 from sales_data

 --19

;WITH MonthlySales AS (
    SELECT
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS sale_month,
        SUM(total_amount) AS monthly_total
    FROM
        sales_data
    GROUP BY
        DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1)
),
--select * from MonthlySales

LaggedSales AS (
    SELECT
        sale_month,
        monthly_total,
        LAG(monthly_total, 1, 0) OVER (ORDER BY sale_month) AS previous_month_total
    FROM
        MonthlySales
)
---select * from LaggedSales
SELECT
    sale_month,
    monthly_total,
    previous_month_total,
    CASE
        WHEN previous_month_total = 0 THEN NULL -- Избегаем деления на ноль
        ELSE (CAST(monthly_total AS DECIMAL(18, 2)) - previous_month_total) / previous_month_total * 100
    END AS growth_rate
FROM
    LaggedSales
ORDER BY
    sale_month;
	--20
;with cte_t as (
      select customer_id,
	  total_amount, order_date,
	  sum(total_amount) over(partition by customer_id) as total_purchase_amount,
	  ROW_NUMBER() over (partition by customer_id order by order_date desc) as rn
	  
	  from sales_data
)


select distinct
  customer_id
  from cte_t
  where rn = 1 and total_purchase_amount > total_amount


  --21

  ;with ctea as (select *, avg(unit_price) over(partition by product_category) as avg_price from sales_data)
  select * from ctea
  where unit_price >= avg_price

  --22

  CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);
  
  select *, 
  case 
  when ROW_NUMBER() over (partition by Grp order by Id) = 1
  then sum(Val1 + Val2) over(partition by Grp) 
  else null end as  Tot
  
  
  from MyData

  --23

  CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);


select ID,
       sum(Cost) as Cost,
	   case
	        when min(Quantity) = MAX(Quantity) then min(Quantity)
	   else sum(Quantity)
	   end as Quantity
from TheSumPuzzle
group by ID;
