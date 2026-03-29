-- active database: classicmodels   (use classicmodels;)

# introduction to the MySQL Subquery

SELECT
    lastName,
    firstName
FROM
    employees
WHERE
    officeCode  IN
        (
        SELECT officeCode
        FROM offices
        WHERE country = 'USA'
        );


# Note

# 1.1 MySQL subquery:  with comparison operators
SELECT
    customerNumber,
    checkNumber,
    amount
FROM
    payments
WHERE
    amount = (
    SELECT MAX(amount)
    FROM payments
        );

SELECT
    payment_table.customerNumber,
    payment_table.checkNumber,
    payment_table.amount
FROM
    payments as payment_table
JOIN
    (SELECT MAX(amount) AS max_amount FROM payments) AS max_payments_table
ON
    payment_table.amount = max_payments_table.max_amount;



# 1.2 MySQL subquery:  with comparison operators
SELECT
    customerNumber,
    checkNumber,
    amount
FROM
    payments
WHERE
    amount > (
        SELECT AVG(amount)
        FROM payments
            );



SELECT
    payment_table.customerNumber,
    payment_table.checkNumber,
    payment_table.amount
FROM
    payments AS  payment_table
CROSS JOIN
    (SELECT AVG(amount) AS avg_amount FROM payments) AS avg_payments_table
WHERE
    payment_table.amount > avg_payments_table.avg_amount;


# 1.3 MySQL subquery: with IN and NOT IN operators
SELECT
    customerName
FROM
    customers
WHERE
    customerNumber NOT IN (
        SELECT DISTINCT customerNumber
        FROM orders
            );


SELECT
   customers_table.customerName
FROM
   customers as customers_table
LEFT JOIN
   orders as order_table
ON
   customers_table.customerNumber = order_table.customerNumber
WHERE
    order_table.customerNumber IS NULL;



# Example 2: MySQL subquery in the FROM clause

SELECT
  MAX(item_count) AS max_items,
  MIN(item_count) AS min_items,
  FLOOR(AVG(item_count)) AS avg_items
FROM (
  SELECT
    orderNumber,
    COUNT(orderNumber) AS item_count
  FROM
    orderdetails
  GROUP BY
    orderNumber
) AS lineitems;


# MySQL correlated subquery
SELECT
    productname,
    buyprice
FROM
    products as product_table
WHERE
    buyprice > (
        SELECT AVG(buyprice)
        FROM products
        WHERE productline = product_table.productline
        );





SELECT *
FROM products as product_table
WHERE EXISTS (
           SELECT 1
           FROM orderdetails as orderdetails_table
           WHERE orderdetails_table.productCode = product_table.productCode
           );



SELECT *
FROM products as product_table
WHERE NOT EXISTS (
           SELECT 1
           FROM orderdetails as orderdetails_table
           WHERE orderdetails_table.productCode = product_table.productCode
           )


# MySQL Derived Tables

SELECT
    productCode,
    ROUND(SUM(quantityOrdered * priceEach)) as sales
FROM
    orderdetails
INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY productCode
ORDER BY sales DESC
LIMIT 5;


SELECT
    productName, sales
FROM
    (SELECT
        productCode,
        ROUND(SUM(quantityOrdered * priceEach)) sales
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY productCode
    ORDER BY sales DESC
    LIMIT 5) as top5products2003
INNER JOIN
    products USING (productCode);


# complex sql query
SELECT
    customerNumber,
    ROUND(SUM(quantityOrdered * priceEach)) sales,
    (CASE
        WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
        WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
        WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
    END) customerGroup
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
WHERE
    YEAR(shippedDate) = 2003
GROUP BY customerNumber;



SELECT
    customerGroup,
    COUNT(cg.customerGroup) AS groupCount
FROM
    (SELECT
        customerNumber,
            ROUND(SUM(quantityOrdered * priceEach)) sales,
            (CASE
                WHEN SUM(quantityOrdered * priceEach) < 10000 THEN 'Silver'
                WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 THEN 'Gold'
                WHEN SUM(quantityOrdered * priceEach) > 100000 THEN 'Platinum'
            END) customerGroup
    FROM
        orderdetails
    INNER JOIN orders USING (orderNumber)
    WHERE
        YEAR(shippedDate) = 2003
    GROUP BY customerNumber) cg
GROUP BY cg.customerGroup;
Code language: SQL (Structured Query Language) (sql)


# EXIST
SELECT
    customerNumber,
    customerName
FROM
    customers
WHERE
    NOT EXISTS(
	SELECT
            1
        FROM
            orders
        WHERE
            orders.customernumber = customers.customernumber
	);


SELECT
    customerNumber,
    customerName
FROM
    customers
WHERE
    EXISTS(
	SELECT 1
        FROM
            orders
        WHERE
            orders.customernumber
		= customers.customernumber);



SELECT
    customerName,
    COUNT(orderNumber) AS orderCount
FROM
    customers
RIGHT JOIN
    orders ON customers.customerNumber = orders.customerNumber
GROUP BY
    customerName;

SELECT
    employeenumber,
    firstname,
    lastname,
    extension
FROM
    employees
WHERE
    EXISTS(
        SELECT
            1
        FROM
            offices
        WHERE
            city = 'San Francisco' AND
           offices.officeCode = employees.officeCode);


UPDATE employees
SET
    extension = CONCAT(extension, '1')
WHERE
    EXISTS(
        SELECT
            1
        FROM
            offices
        WHERE
            city = 'San Francisco'
                AND offices.officeCode = employees.officeCode);






SELECT
        customername,
        country
FROM
        customers
WHERE country = 'USA' OR
      country = 'France';
      
      
      
SELECT   
        customername, 
        country, 
        creditLimit
FROM   
        customers
WHERE(country = 'USA' OR country = 'France')
          AND creditlimit > 100000;
          
          
SELECT    
    customername, 
    country, 
    creditLimit
FROM    
    customers
WHERE 
    country = 'USA'
    OR country = 'France'
    AND creditlimit > 100000;

SELECT
    lastName,
    firstName,
    jobTitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR
    officeCode = 1
ORDER BY
    officeCode ,
    jobTitle;
    
    
SELECT
    lastname,
    firstname,
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND
    officeCode = 1;

SELECT
    customername,
    country,
    state
FROM
    customers
WHERE
    country = 'USA' AND
    state = 'CA';
    
    
SELECT 
    customername, 
    country, 
    state, 
    creditlimit
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA' AND 
    creditlimit > 100000;
    
    
    
SELECT
    productCode,
    productName,
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;


SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice NOT BETWEEN 20 AND 100;
    
    
    
SELECT
   orderNumber,
   requiredDate,
   status
FROM
   orders
WHERE
   requireddate BETWEEN
     CAST('2003-01-01' AS DATE) AND
     CAST('2003-01-31' AS DATE);
     
     
     
SELECT
    employeeNumber,
    lastName,
    firstName
FROM
    employees
WHERE
    firstName LIKE 'a%'; 
    
    
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName LIKE '%on';
     
     
     SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastname LIKE '%on%' or  lastname LIKE '%on';
     
     SELECT
    employeeNumber,
    lastName,
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';
     
     
SELECT
    employeeNumber,
    lastName,
    firstName
INTO
@label1, @label2, @label3

FROM
    employees
LIMIT 1;

SELECT @label1, @label2, @label3

     
     
SELECT
    city
INTO
    @city
FROM
    customers
WHERE
    customerNumber = 103;


SELECT lastName
INTO @lname
FROM employees
WHERE employeeNumber = 1002
LIMIT 1;

SELECT @lname;


SELECT employeeNumber, lastName, firstName
INTO @empNo, @lname, @fname
FROM employees
WHERE jobTitle = 'Sales Rep'
LIMIT 1;

SELECT @empNo, @lname, @fname;


select id/qty
from inventory

     
     