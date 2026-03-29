


# SELECT

select lastname
from employees


SELECT
    lastname,
    firstname,
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';


# 02: SECTION TOPIC: ORDER BY

select
 contactlastname
 contactfirstname
from
 customers
order by
 `contactLastName`


select
 contactlastname
 contactfirstname
from
 customers
order by
 `contactLastName`DESC


select
 ordernumber,
 orderlinenumber,
 quantityordered * priceeach as total
from
 orderdetails
order BY
 total DESC


# 03: SECTION TOPIC: FILTERING DATA

select
 lastname,
 firstname,
 jobtitle
from employees
where
 jobtitle = 'Sales Rep'


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







 select
  customername, country, state, creditlimit
from customers
where
 country = 'USA' and state = 'CA' and creditlimit > 100000


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








select customername, country, state, creditlimit
from customers
where country = 'USA' and (state = 'CA' or state = 'NY')


select firstname, lastname, jobtitle, officecode
from employees
where officecode BETWEEN 1 and 3
order by officecode



select firstname, lastname, jobtitle, officecode
from employees
where officecode >= 1 and `officeCode` <= 4
order by officecode


select productcode, productname, productline, buyprice
from products
where buyprice not between 20 and 100
order by buyprice


select ordernumber, orderdate, requireddate, shippeddate
from orders
where
requireddate between
cast('2003-01-01' as date) and
cast('2003-12-31' as date)
order by `ordernumber`

select `firstName`, lastname
from employees
where lastname like "%o%"

select firstname, `lastName`
from employees
order by `firstName`


SELECT
    firstName,
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY
    firstName;





SELECT * FROM Employees
WHERE FirstName LIKE 'J%';  -- Finds any values that start with 'J'

SELECT * FROM Employees
WHERE FirstName LIKE '%n';  -- Finds any values that end with 'n'

SELECT * FROM Employees
WHERE FirstName LIKE '_a%';  -- Finds any values that have 'a' as the second character

SELECT * FROM Employees
WHERE FirstName LIKE 'J%n';  -- Finds any values that start with 'J' and end with 'n'


select employeenumber, lastname, firstname, jobtitle
from employees
where jobtitle like '%Sales%'


select employeenumber, lastname, firstname, jobtitle
from employees
where firstname like 'T_m'


SELECT productcode, productname ##
FROM products
WHERE productCode LIKE '%\_20%'

## Using the In operator

select
  firstname,
  lastname,
  officecode
from
  employees
where
  officecode in (1, 2, 3)
order by
  officeCode

SELECT
    officeCode,
    city,
    phone,
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France')

SELECT
    officeCode,
    city,
    phone
FROM
    offices
WHERE
    country = 'USA' OR country = 'France';
Code language: SQL (Structured Query Language) (sql)



select officecode, city, phone, country
from offices
where country in ('USA', 'France', 'Australia')

## Using IS NULL and IS NOT NULL

select lastname, firstname, reportsto
from employees
where reportsto is null


select lastname,
firstname, reportsto
from employees
where reportsto is not null

select state
from customers
where state is null


## Using not in operator

select officecode, city, phone, country
from offices
where country not in ('USA', 'France')
order by officeCode DESC


## Using LIMIT in operator

select customername, country, state, creditlimit
from customers
order by creditlimit DESC

select customername, `customerNumber`, country, state, creditlimit
from customers
order by creditlimit DESC
limit 10

select customername, `customerNumber`, country, state, creditlimit
from customers
order by `creditLimit`
limit 10

select count(*)
from customers

## Using DISTINCT clause

select DISTINCT state
from customers

select DISTINCT state, city
from customers
where state is not NULL
order by state, city

select DISTINCT state, city, country
from customers
where country in ('USA', 'France')
order by country DESC

select *
from customers






SELECT
    lastname,
    firstname,
    jobtitle
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';

SELECT
    lastname,
    firstname,
    officeCode
FROM
    employees
WHERE
    officecode > 5;

SELECT
    lastname,
    firstname,
    officeCode
FROM
    employees
WHERE
    officecode <= 4;


SELECT
    firstName,
    lastName,
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY officeCode;

SELECT
    officeCode,
    city,
    phone
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France')
ORDER BY
    city;

SELECT
    firstName,
    lastName,
    officeCode
FROM
    employees
WHERE
    officeCode >= 1 AND officeCode <= 3

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
    lastname LIKE '%on%';

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
FROM
    employees
WHERE
    lastName NOT LIKE 'B%';

SELECT
    productCode,
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%'
ESCAPE '$';


SELECT
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;

SELECT
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY creditLimit
LIMIT 5;

SELECT
    customerNumber,
    customerName,
    creditLimit
FROM
    customers
ORDER BY
    creditLimit,
    customerNumber
LIMIT 5;


SELECT
    COUNT(*)
FROM
    customers;

SELECT
    customerNumber,
    customerName
FROM
    customers
ORDER BY customerName
LIMIT 10;

SELECT
    customerNumber,
    customerName
FROM
    customers
ORDER BY customerName
LIMIT 10 offset 20;

SELECT
    customerName,
    creditLimit
FROM
    customers
ORDER BY
    creditLimit DESC
LIMIT 1,1;

SELECT
    customerName,
    country,
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY
    customerName
LIMIT 10;

SELECT
    customerName,
    country,
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NOT NULL
ORDER BY
   customerName;
Code language: SQL (Structured Query Language) (sql)
