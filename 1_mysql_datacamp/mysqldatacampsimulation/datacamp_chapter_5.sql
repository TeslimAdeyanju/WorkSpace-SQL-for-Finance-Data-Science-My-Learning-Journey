
/*-

function_name (expression) 
OVER (
    [PARTITION BY column_name(s)] 
    [ORDER B
/*-

function_name (expression) 
OVER (
    [PARTITION BY column_name(s)] 
    [ORDER BY column_name(s)] 
    [frame_clause])


*/


select *
from customers;

--
SELECT
    customerName,
    contactLastName,
    city,
    state,
    country,
    ROW_NUMBER() OVER (PARTITION BY state ORDER BY country) AS row_num
FROM
    customers
WHERE state IS NOT NULL;

--

select *,
ROW_NUMBER() over() as count_number
from payments;

--

select officecode, city, state,
row_number() over(order by city desc) as row_n
from offices
order by city;

--
select 
      id,
      item_no,
      LAG(id) over() as previous
from inventory;
       
---
select 
     city,
     state,
     country,
     lag(country) over() as previous_n
from offices
where state is not Null;


---
WITH product_category as(
     select productline, avg(buyprice) as average_price, count(productline) as line
     from products
     group by productline
)
select line, row_number() over(order by productline desc) as row_n, average_price, lag(average_price, 1) over () as previous
from product_category
order by line desc

--
Y column_name(s)] 
    [frame_clause])


*/


select *
from customers;

--
SELECT
    customerName,
    contactLastName,
    city,
    state,
    country,
    ROW_NUMBER() OVER (PARTITION BY state ORDER BY country) AS row_num
FROM
    customers
WHERE state IS NOT NULL;

--

select *,
ROW_NUMBER() over() as count_number
from payments;

--

select officecode, city, state,
row_number() over(order by city desc) as row_n
from offices
order by city;

--
select 
      id,
      item_no,
      LAG(id) over() as previous
from inventory;
       
---
select 
     city,
     state,
     country,
     lag(country) over() as previous_n
from offices
where state is not Null;


---
WITH product_category as(
     select productline, avg(buyprice) as average_price, count(productline) as line
     from products
     group by productline
)
select line, row_number() over(order by productline desc) as row_n, average_price, lag(average_price, 1) over () as previous
from product_category
order by line desc

--

SELECT 
    customernumber AS customer_number, 
    customerName, 
    city,country,
    lag(city, 1) over (partition by country) as previous
FROM 
    customers
WHERE 
    addressLine2 IS NOT NULL
    
--using the LEAD
WITH 
    product_info AS 
    (   SELECT 
            * 
        FROM products 
        WHERE 
            buyprice > 50 
    )
SELECT 
    productname, 
    row_number() over () AS list_number
FROM product_info
WITH 
    detail AS 
    (   SELECT 
            DISTINCT customerName, 
            country 
        FROM customers 
    )
SELECT
    country,
    lead(country, 1) over() AS next_country,
    lead(country, 2) over() AS next_country_2
FROM detail
--
select 
       count(amount) as bill, state
from payments
inner join customers
using(customerNumber)
group by state,rollup(state)
order by bill

--








