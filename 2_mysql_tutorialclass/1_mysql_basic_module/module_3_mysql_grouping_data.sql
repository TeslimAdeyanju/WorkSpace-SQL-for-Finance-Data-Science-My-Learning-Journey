select count(*)
from offices;

select count(email) as mail 
from employees;

SELECT COUNT(DISTINCT officeCode) AS total_department
FROM employees;


select status
from orders;


-- applying group
select status,
from orders
group by status;




-- same as distinct 

select distinct status
from orders;


--
select status, count(*)
from orders
group by status;


---Uisng join with group 
select status, sum(quantityOrdered * priceEach) as Total_Amount
from orders 
join orderdetails 
using(ordernumber)
group by 1

--- select info withing the same group 
SELECT 
  orderNumber, 
  SUM(quantityOrdered * priceEach) AS total 
FROM 
  orderdetails 
GROUP BY 
  orderNumber

-- using example 
SELECT
    year(orderdate) as order_date,
    SUM(quantityOrdered * priceEach) AS Total_Amount
FROM
    orders
INNER JOIN
    orderdetails
USING
    (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY
    year(orderdate)

--

select month(orderdate) as month
from orders
group by month(orderdate)

--

SELECT 
    MONTH(paymentdate) AS active_month, 
    AVG(amount) AS average_income
FROM 
    payments
GROUP BY 
    active_month
ORDER BY 
    active_month

--
SELECT
    count(customerNumber) as Total_Amount,
    month(orderNumber) as month
FROM
    orders
GROUP BY
    month(orderNumber)

-- Example 4:  Using MySQL GROUP BY with HAVING clause example

   SELECT
        year(orderDate) as year,
        sum(quantityOrdered * priceEach) as Total_Amount
    FROM
        orders
    inner JOIN
        orderdetails
    USING(orderNumber)
    WHERE
        status = 'Shipped'
    GROUP BY
        year
    HAVING
        Total_Amount > 10000

--
SELECT
    year(orderDate) as year,
    status,
    sum(quantityOrdered * priceEach) as Total_Amount
FROM
    orders
inner JOIN orderdetails USING(orderNumber)
GROUP BY
    year,
    status
HAVING
    Total_Amount > 10000



-- MySQL HAVING clause examples

select
    ordernumber,
    sum(quantityOrdered) as items_Count,
    sum(quantityOrdered * priceEach) as Total_Amount
from
    orderdetails
GROUP BY
    orderNumber
    
    
 -- using the same code with HAving 
 select
    ordernumber,
    sum(quantityOrdered) as items_Count,
    sum(quantityOrdered * priceEach) as Total_Amount
from
    orderdetails
GROUP BY
    orderNumber
HAVING
Total_Amount > 50000

-- complext code with Having 
SELECT
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING
    total > 1000
    AND
    itemsCount > 600;


--
select
    orderdetails.orderNumber,
    orders.status,
    sum(quantityOrdered * priceEach) as Total_Amount
from
    orderdetails
inner JOIN orders USING(orderNumber)
GROUP BY
    orderdetails.orderNumber,
    orders.status
HAVING
    status = 'Shipped'
    AND
    Total_Amount > 1500;



-- select product base on count 

select customername, count(*) as order_count
from orders 
join customers using (customernumber)
group by customername
having count(*) > 4
order by order_count


-- Usin the Rollup

SELECT
    orderYear, productLine,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    orderYear, productline
WITH ROLLUP;

--

SELECT
    productLine,orderYear,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    productline, orderYear
WITH ROLLUP;


--

SELECT 
    orderYear,
    productLine, 
    SUM(orderValue) totalOrderValue,
    GROUPING(orderYear),
    GROUPING(productLine)
FROM
    sales
GROUP BY 
    orderYear,
    productline
WITH ROLLUP;

--

SELECT 
    city, 
    YEAR(paymentdate) AS YEAR, 
    COUNT(*) AS count_city,
    grouping(city), grouping(YEAR(paymentdate))
FROM payments
JOIN 
    customers USING (customerNumber) 
GROUP BY city, YEAR(paymentdate)
with rollup

--
SELECT
    IF(GROUPING(orderYear),'%%%%%', orderYear) orderYear,
    IF(GROUPING(productLine), '$$$$', productLine) productLine,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY
    orderYear ,
    productline
WITH ROLLUP;
