CREATE TABLE sales(
    sales_employee VARCHAR(50) NOT NULL,
    fiscal_year INT NOT NULL,
    sale DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO sales(sales_employee,fiscal_year,sale)
VALUES('Bob',2016,100),
      ('Bob',2017,150),
      ('Bob',2018,200),
      ('Alice',2016,150),
      ('Alice',2017,100),
      ('Alice',2018,200),
       ('John',2016,200),
      ('John',2017,150),
      ('John',2018,250);

SELECT * FROM sales;

SELECT
    SUM(sale)
FROM
    sales;


SELECT
    fiscal_year,
    SUM(sale)
FROM
    sales
GROUP BY
    fiscal_year;
    
    
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10,2),
    hire_date DATE
);

INSERT INTO employees VALUES
(1, 'John', 'Finance', 70000, '2020-01-10'),
(2, 'Mary', 'Finance', 60000, '2021-03-05'),
(3, 'Alex', 'IT', 90000, '2019-07-14'),
(4, 'Kate', 'IT', 85000, '2020-09-18'),
(5, 'Emma', 'HR', 50000, '2021-11-01'),
(6, 'Liam', 'HR', 55000, '2018-12-22'),
(7, 'Noah', 'Finance', 65000, '2022-04-09'),
(8, 'Olivia', 'IT', 88000, '2023-06-02');


SELECT
    department,
    employee_name,
    salary,
    AVG(salary) OVER (PARTITION BY department) AS dept_avg_salary
FROM employees;


DROP TABLE sales_data;


CREATE TABLE sales_data (
    order_id INT PRIMARY KEY,
    customer_id VARCHAR(10),
    region VARCHAR(20),
    order_date DATE,
    quarter VARCHAR(2),
    sales DECIMAL(10,2)
);

INSERT INTO sales_data VALUES
(101, 'C1', 'North', '2024-01-01', 'Q1', 5000),
(102, 'C1', 'North', '2024-02-05', 'Q1', 3000),
(103, 'C1', 'North', '2024-03-10', 'Q1', 4000),
(104, 'C2', 'South', '2024-04-03', 'Q2', 6000),
(105, 'C2', 'South', '2024-05-07', 'Q2', 8000),
(106, 'C3', 'West', '2024-06-02', 'Q2', 7000),
(107, 'C3', 'West', '2024-07-06', 'Q3', 5000),
(108, 'C3', 'West', '2024-08-09', 'Q3', 9000);


SELECT * FROM sales_data

SELECT
    region,
    quarter,
    SUM(sales) OVER (PARTITION BY region) AS total_sales_region
FROM sales_data;

--

SELECT
    department,
    employee_name,
    salary,
    sum(salary) OVER (PARTITION BY department) AS dept_avg_salary; 
FROM employees;

--
SELECT 
    YEAR(paymentDate) AS year, 
    amount, 
    FORMAT(
        AVG(amount) OVER (PARTITION BY YEAR(paymentDate)), 
        2
    ) AS avg_amt
FROM 
    payments
group by YEAR(paymentDate)

--
SELECT
    department,
    format(avg(salary),2) as avg_salary
FROM employees
group by department;

--
SELECT
    region, sales
    quarter,
    SUM(sales) OVER (PARTITION BY region) AS total_sales_region
FROM sales_data;


--
SELECT
    customer_id,
    order_id,
    COUNT(order_id) OVER (PARTITION BY customer_id) AS total_orders
FROM sales_data;

--
SELECT
    department,
    employee_name,
    salary,
    YEAR(hire_date) AS hire_year,
    AVG(salary) OVER (
        PARTITION BY department, YEAR(hire_date)
    ) AS dept_year_avg_salary
FROM employees;


--
SELECT
    region,
    quarter,
    order_id,
    sales,
    SUM(sales) OVER (
        PARTITION BY region, quarter
    ) AS total_sales_region_quarter
FROM sales_data
ORDER BY region, quarter, order_id;



/* Aggregate Window Functions */ 

SELECT
    customer_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ) AS running_total
FROM payment
WHERE customer_id IN (1, 2)
ORDER BY customer_id, payment_date


/* Aggregate Window Functions */ 

SELECT
    i.store_id,
    f.title,
    p.amount,
    SUM(p.amount) OVER (PARTITION BY i.store_id) AS store_total_revenue,
    ROUND(p.amount / SUM(p.amount) OVER (PARTITION BY i.store_id) * 100, 2) AS pct_of_store_revenue
FROM payment p
JOIN rental r ON p.rental_id = r.rental_id
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
limit 20;


/* Moving 3-Payment Average */
SELECT
    customer_id,
    payment_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS last_3_payments_sum,
    ROUND(AVG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ), 2) AS last_3_payments_avg
FROM payment
WHERE customer_id in (1, 2)
ORDER BY customer_id;

/* Example 1: Compare Each Film's Rental Rate to Category Average */
SELECT
    c.name AS category,
    f.title,
    f.rental_rate,
    ROUND(AVG(f.rental_rate) OVER (PARTITION BY c.name), 2) AS category_avg_rate,
    ROUND(f.rental_rate - AVG(f.rental_rate) OVER (PARTITION BY c.name), 2) AS diff_from_avg
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name IN ('Action', 'Comedy', 'Drama')
ORDER BY category, diff_from_avg DESC;



/* Example 2: Running Average of Payment Amounts */
SELECT
    customer_id,
    payment_date,
    amount,
    ROUND(AVG(amount) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ), 2) AS running_avg,
    COUNT(*) OVER (
        PARTITION BY customer_id
        ORDER BY payment_date
    ) AS payment_count
FROM payment
WHERE customer_id IN (5, 6)
ORDER BY customer_id, payment_date
LIMIT 20;

--
SELECT
    DATE(payment_date) AS payment_day,
    COUNT(*) AS daily_payment_count,
    ROUND(AVG(COUNT(*)) OVER (
        ORDER BY DATE(payment_date)
        ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING
    ), 2) AS centered_5day_avg
FROM payment
GROUP BY DATE(payment_date)
ORDER BY payment_day
LIMIT 20;

--
SELECT
    c.name AS category,
    f.title,
    f.rental_rate,
    MIN(f.rental_rate) OVER (PARTITION BY c.name) AS category_min_rate,
    CASE
        WHEN f.rental_rate = MIN(f.rental_rate) OVER (PARTITION BY c.name)
        THEN 'CHEAPEST'
        ELSE ''
    END AS is_cheapest
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name IN ('Horror', 'Sci-Fi', 'Animation')
ORDER BY category, rental_rate
LIMIT 25;


SELECT rental_rate * replacement_cost as m
from film


--using the sample database of classicmodels 
SELECT
  ROW_NUMBER() OVER (
    ORDER BY productName
  ) row_num,
  productName,
  msrp
FROM
  products
ORDER BY
  productName;
  
  
-- Another Example 
SELECT
    productLine,
    productName,
    quantityInStock,
    ROW_NUMBER() OVER (
      PARTITION BY productLine
      ORDER BY
        quantityInStock DESC
    ) row_num
  FROM
    products;


--
WITH inventory AS (
  SELECT
    productLine,
    productName,
    quantityInStock,
    ROW_NUMBER() OVER (
      PARTITION BY productLine
      ORDER BY
        quantityInStock DESC
    ) row_num
  FROM
    products
)
SELECT
  productLine,
  productName,
  quantityInStock
FROM
  inventory
WHERE
  row_num <= 3;
  
  
-- -- Rank actors by the number of films they've appeared in
-- Ties get the same rank with gaps in the sequence

SELECT
    a.actor_id,
    CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
    COUNT(fa.film_id) AS film_count,
    -- RANK assigns same rank to ties and skips next ranks
    -- Example: If 2 actors tie at rank 3, next actor gets rank 5
    RANK() OVER (ORDER BY COUNT(fa.film_id) DESC) AS actor_rank
FROM
    actor a
    JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY
    a.actor_id, a.first_name, a.last_name
ORDER BY
    actor_rank
LIMIT 15;

-- Notice: If actors have same film count, they get same rank
-- The rank after tied values shows a gap



--- 
select * 
from orders
