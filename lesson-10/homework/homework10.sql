use homework9
--1. Write a query to perform an INNER JOIN between Orders and Customers 
--using AND in the ON clause to filter orders placed after 2022.
select c.firstname, o.orderdate from Customers c
join Orders o on c.CustomerID = o.CustomerID 
and o.OrderDate > '2022-01-01';

--2. Write a query to join Employees and Departments using OR in the ON clause to show employees in either
--the 'Sales' or 'Marketing' department.
select e.name, d.departmentname from employees e 
join departments d on d.departmentid = e.departmentid and ( d.departmentname = 'Sales' or d.departmentname = 'Marketing');

--3. Write a query to demonstrate a CROSS APPLY between Departments and a derived table that shows their Employees, 
--top-performing employee (e.g., top 1 Employee who gets the most salary).

select * from departments d
cross apply
(select top 1 
name, salary from employees
where departmentid = d.departmentid
order by salary desc) as o

--4. Write a query to join Customers and Orders using AND in the ON clause to filter customers who have placed orders in 2023 
--and who lives in the USA.
select c.firstname, o.orderdate, c.country from Customers c
join Orders o on c.CustomerID = o.CustomerID 
and (o.OrderDate > '2023-01-01' and c.country = 'USA');

--5. Write a query to join a derived table (SELECT CustomerID, COUNT(*) FROM Orders GROUP BY CustomerID) 
--with the Customers table to show the number of orders per customer.
select c.firstname, COUNT(o.customerid) as order_count from orders o
join customers c on c.CustomerID = o.CustomerID 
group by c.customerid, c.firstname; 

--6. Write a query to join Products and Suppliers using OR in the ON clause to show products supplied 
--by either 'Gadget Supplies' or 'Clothing Mart'.
select s.suppliername, p.productname from products p 
join suppliers s on p.supplierid = s.supplierid
and (s.suppliername ='Gadget Supplies' or s.suppliername ='Clothing Mart');

--7. Write a query to demonstrate the use of OUTER APPLY between Customers and a derived table that returns each 
--Customers''s most recent order.
select firstname, o.orderdate from customers c
outer apply
(select top 1
orderdate from orders
where customerid = c.customerid
order by orderdate desc) as o

-- medium 8. Write a query that uses the AND logical operator in the ON clause to join Orders and Customers, 
--and filter customers who placed an order with a total amount greater than 500.
select c.firstname, o.totalamount, c.country from Customers c
join Orders o on c.CustomerID = o.CustomerID 
and o.totalamount > 500;

--9. Write a query that uses the OR logical operator in the ON clause to join Products and Sales to 
--filter products that were either sold in 2022 or the SaleAmount is more than 400.
select p.productname, s.saleamount, s.saledate  from sales s
join products p on p.productid = s.productid
and (s.saledate > '2022-01-01' or s.saleamount > 400);

--10. Write a query to join a derived table that calculates the total sales (SELECT ProductID, SUM(Amount) FROM 
--Sales GROUP BY ProductID) with the Products table to show total sales for each product.
select p.productname, sum(s.saleamount) as total_sales from sales s
join products p on p.productid = s.productid
group by p.productname

--11. Write a query to join Employees and Departments using AND in the ON clause to filter employees 
--who belong to the 'HR' department and whose salary is greater than 50000.
select e.name, e.salary, d.departmentname from employees e 
join departments d on d.departmentid = e.departmentid and ( d.departmentname = 'Human Resources' and e.salary > 50000);

--12. Write a query to use OUTER APPLY to return all customers along with their most recent orders, 
--including customers who have not placed any orders.
select firstname, o.orderdate from customers c
outer apply
(select top 1
orderdate from orders
where customerid = c.customerid
order by orderdate desc) as o

--13. Write a query to join Products and Sales using AND in the ON clause to filter products that were sold in 2023 
--and StockQuantity is more than 50.
select p.productname, p.stockquantity, s.saledate  from sales s
join products p on p.productid = s.productid
and (s.saledate > '2023-01-01' and p.stockquantity > 50);

--14. Write a query to join Employees and Departments using OR in the ON clause to show employees
--who either belong to the 'Sales' department or hired after 2020
select e.name, e.hiredate, d.departmentname from employees e 
join departments d on d.departmentid = e.departmentid and ( d.departmentname = 'Sales' or e.hiredate > '2020-01-01');

--15. Write a query to demonstrate the use of the AND logical operator in the ON clause between Orders and Customers, 
--and filter orders made by customers who are located in 'USA' and lives in an address that starts with 4 digits.
select c.firstname, C.ADDRESS, c.country from Customers c
join Orders o on c.CustomerID = o.CustomerID 
and (c.country = 'USA' and o.OrderDate like '[0-9][0-9][0-9][0-9]%');

--16. Write a query to demonstrate the use of OR in the ON clause when joining Products and Sales to show products that are 
--either part of the 'Electronics' category or Saleo amunt is greater than 350.
select * from Sales s
join Products p on p.ProductID = s.ProductID
join Categories c on c.CategoryID = p.Category
and (c.categoryname = 'Electronics' or SaleAmount > 350); 

--17. Write a query to join a derived table that returns a count of products per category (SELECT CategoryID, COUNT(*) 
--FROM Products GROUP BY CategoryID) with the Categories table to show the count of products in each category.
select c.categoryname, COUNT(p.category) as Count_of_product
from products p
join categories c on c.categoryid = p.category 
group by c.categoryname

--18. Write a query to join Orders and Customers using AND in the ON clause to show orders where the customer is from 'Los Angeles' 
--and the order amount is greater than 300.
select c.firstname, o.totalamount, c.country from orders o
join customers c on c.CustomerID = o.CustomerID 
and (o.totalamount > 300 and c.city = 'Los Angeles');

--19. Write a query to join Employees and Departments using a complex OR condition in the ON clause to show employees
--who are in the 'HR' or 'Finance' department, or have at least 4 wowels in their name.
select e.name, e.hiredate, d.departmentname from employees e 
join departments d on d.departmentid = e.departmentid and  d.departmentname in('Human resources', 'Finance') 
or (e.Name like '%[aieou]%[aieou]%[aieou]%[aieou]%');   

--20. Write a query to join Sales and Products using AND in the ON clause to filter products that have both a sales 
--quantity greater than 100 and a price above 500.
SELECT distinct p.ProductName, p.StockQuantity, p.Price, s.SaleAmount
FROM Products p
JOIN Sales s ON p.ProductID = s.ProductID
WHERE p.StockQuantity > 100
  AND s.SaleAmount > 500;

--21. Write a query to join Employees and Departments using OR in the ON clause to show employees in either the
--'Sales' or 'Marketing' department, and with a salary greater than 60000.
select e.name, e.salary, d.departmentname from employees e 
join departments d on d.departmentid = e.departmentid 
and  d.departmentname in('Sales', 'Marketing') and e.salary > 60000;


