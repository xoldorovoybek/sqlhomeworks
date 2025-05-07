
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

INSERT INTO employees (id, name, salary) VALUES
(1, 'Alice', 50000),
(2, 'Bob', 60000),
(3, 'Charlie', 50000);

select * from employees
where salary in (select min(salary) from employees)

CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2)
);

INSERT INTO products (id, product_name, price) VALUES
(1, 'Laptop', 1200),
(2, 'Tablet', 400),
(3, 'Smartphone', 800),
(4, 'Monitor', 300);


select * from products
where price > (select avg(price) from products)


CREATE TABLE departments (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);
drop table employees
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departments (id, department_name) VALUES
(1, 'Sales'),
(2, 'HR');

INSERT INTO employees (id, name, department_id) VALUES
(1, 'David', 1),
(2, 'Eve', 2),
(3, 'Frank', 1);


select e.name, d.department_name from employees e join departments d on e.department_id = d.id

where d.department_name = 'Sales'


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, name) VALUES
(1, 'Grace'),
(2, 'Heidi'),
(3, 'Ivan');

INSERT INTO orders (order_id, customer_id) VALUES
(1, 1),
(2, 1);

select c.name from customers c left join orders o on c.customer_id = o.customer_id 
where o.customer_id is null

drop table products
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Tablet', 400, 1),
(2, 'Laptop', 1500, 1),
(3, 'Headphones', 200, 2),
(4, 'Speakers', 300, 2);

select *, (select max(price) from products b where a.category_id = b.category_id) max_price_by_category from products a

drop table departments
CREATE TABLE departmentss (
    id INT PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE employeess (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES departments(id)
);

INSERT INTO departmentss (id, department_name) VALUES
(1, 'IT'),
(2, 'Sales');

INSERT INTO employeess (id, name, salary, department_id) VALUES
(1, 'Jack', 80000, 1),
(2, 'Karen', 70000, 1),
(3, 'Leo', 60000, 2);

WITH DepartmentAvgSalary AS (
    SELECT
        d.id AS department_id,
        d.department_name,
        AVG(e.salary) AS avg_salary
    FROM
        departmentss d
    JOIN
        employeess e ON d.id = e.department_id
    GROUP BY
        d.id, d.department_name
),
MaxAvgSalary AS (
    SELECT
        MAX(avg_salary) AS max_avg_salary
    FROM
        DepartmentAvgSalary
),
TargetDepartment AS (
    SELECT
        das.department_id
    FROM
        DepartmentAvgSalary das
    JOIN
        MaxAvgSalary mas ON das.avg_salary = mas.max_avg_salary
)
SELECT
    e.name,
    e.salary,
    d.department_name
FROM
    employeess e
JOIN
    departmentss d ON e.department_id = d.id
WHERE
    e.department_id IN (SELECT department_id FROM TargetDepartment);



	CREATE TABLE employeesss (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employeesss (id, name, salary, department_id) VALUES
(1, 'Mike', 50000, 1),
(2, 'Nina', 75000, 1),
(3, 'Olivia', 40000, 2),
(4, 'Paul', 55000, 2);

select * from employeesss

SELECT
    e.name,
    e.salary,
    d.department_name
FROM
    employeesss e
JOIN
    departmentss d ON e.department_id = d.id
WHERE
    e.salary > (
        SELECT
            AVG(salary)
        FROM
            employeesss
        WHERE
            department_id = e.department_id
    );

	CREATE TABLE students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE grades (
    student_id INT,
    course_id INT,
    grade DECIMAL(4, 2),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO students (student_id, name) VALUES
(1, 'Sarah'),
(2, 'Tom'),
(3, 'Uma');

INSERT INTO grades (student_id, course_id, grade) VALUES
(1, 101, 95),
(2, 101, 85),
(3, 102, 90),
(1, 102, 80);

;with cte as (select s.name, g.course_id, g.grade 
from students s join grades g on s.student_id = g.student_id)
select *, (select max(grade) from cte b where a.course_id = b.course_id) max_grade from cte a


drop table products
CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    category_id INT
);

INSERT INTO products (id, product_name, price, category_id) VALUES
(1, 'Phone', 800, 1),
(2, 'Laptop', 1500, 1),
(3, 'Tablet', 600, 1),
(4, 'Smartwatch', 300, 1),
(5, 'Headphones', 200, 2),
(6, 'Speakers', 300, 2),
(7, 'Earbuds', 100, 2);

;with ctw as (select *, rank() over(partition by category_id order by (id)) rk  from products)
 select * from ctw
 where rk = 3

 CREATE TABLE employees1 (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department_id INT
);

INSERT INTO employees1 (id, name, salary, department_id) VALUES
(1, 'Alex', 70000, 1),
(2, 'Blake', 90000, 1),
(3, 'Casey', 50000, 2),
(4, 'Dana', 60000, 2),
(5, 'Evan', 75000, 1);



;WITH DepartmentMaxSalary AS (
    SELECT
        id,
        name,
        salary,
        department_id,
        MAX(salary) OVER (PARTITION BY department_id) AS max_salary_in_department,
        AVG(salary) OVER () AS company_avg_salary
    FROM
        employees1
)
SELECT
    dms.name,
    dms.salary,
    dep.department_name
FROM
    DepartmentMaxSalary dms
JOIN
    departmentss dep ON dms.department_id = dep.id
WHERE
    dms.salary > dms.company_avg_salary
    AND dms.salary < dms.max_salary_in_department;
