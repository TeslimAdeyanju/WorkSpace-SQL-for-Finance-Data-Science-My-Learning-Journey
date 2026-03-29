-- SQLBook: Code
-- Active: 1712274533216@@127.0.0.1@3306@classicmodels

## Column Alias

select lastname as "Surname Detail", firstname as forename
from employees

select CONCAT_WS(' , ', lastname, firstname) as "Staff Fullname"
from employees

select CONCAT(lastname, " - ", firstname) as "Staff Fullname"
from employees

select lastname as detail
from employees

select * from employees e
where e.jobtitle = 'Sales Rep'

select *
from employees
where jobtitle = 'Sales Rep'
limit 10

# Table Alias

select CleanAce.firstname as Name, CleanAce.lastname as 2Name, CleanAce.jobtitle as 3Name
from employees AS CleanAce
where CleanAce.jobtitle = 'Sales Rep'
limit 4


# inner JOIN

select
    products.productcode,
    products.productname,
    productlines.textdescription
from
products
inner join
  productlines
ON
  products.productline = productlines.productline


select
   employees.firstName,
   employees.lastName,
   offices.city
from
   employees
inner join
   offices
ON
   employees.officeCode = offices.officeCode


select
    products.productcode,
    products.productname,
    productlines.textdescription
from
    products
inner join
    productlines
  using(productline)



select
    products.productcode,
    products.productname,
    productlines.textdescription
from
    products
inner join
    productlines
on
    products.productline = productlines.productline


SELECT
    orderdetails.orderNumber,
    orders.status,
    sum(orderdetails.quantityOrdered * orderdetails.priceEach) as "Total"
FROM
    orderdetails
INNER JOIN
    orders
ON
    orderdetails.orderNumber = orders.orderNumber
GROUP BY
    orderNumber


SELECT
    orderdetails.orderNumber,
    orders.status,
    sum(orderdetails.quantityOrdered * orderdetails.priceEach) as "Total"
FROM
    orderdetails
INNER JOIN
    orders
USING (orderNumber)
GROUP BY
      orderNumber


SELECT
    orders.orderNumber,
    orders.orderDate,
    orderdetails.orderlinenumber,
    products.productName,
    orderdetails.quantityOrdered
FROM
    orders
INNER JOIN
    orderdetails
USING (orderNumber)
INNER JOIN
    products
using(productCode)
ORDER BY
    orderNumber, orderlinenumber



select
   orders.orderNumber,
   orders.orderDate,
   customers.customerName,
   orderdetails.orderLineNumber,
   products.productName,
   orderdetails.quantityOrdered,
   orderdetails.priceEach
from
    orders
inner join
     customers
using(customerNumber)
inner join
    orderdetails
using(orderNumber)
inner join
    products
using(productCode)
order by
    orderNumber, orderLineNumber


select
    products.productName,
    orders.orderNumber,
    products.MSRP,
    orderdetails.priceEach
from
    products
inner join
    orderdetails
using(productCode)
inner join
    orders
using(orderNumber)
where
    orderdetails.priceEach < products.MSRP
and
    products.`productCode` = 'S10_1678'



## LEFT JOIN

select
    customers.customerName,
    orders.orderNumber,
    orders.orderDate
from
    customers
left join
    orders
on
    customers.customerNumber = orders.customerNumber


select
    customers.customerName,
    orders.orderNumber,
    orders.orderDate
from
    customers
left join
    orders
using(customerNumber)


select
    customers.customerName,
    customers.customerNumber,
    orders.orderNumber,
    orders.status
from
    customers
left join
    orders
on
    customers.customerNumber = orders.customerNumber
where
    orders.orderNumber is null


select
    payments.checkNumber,
    payments.amount,
    customers.customerName,
    customers.customerNumber,
    employees.firstName,
    employees.lastName
from
    payments
left join
    customers
on
    payments.customerNumber = customers.customerNumber
left join
    employees
on
    payments.checkNumber = employees.employeeNumber
order by
    checkNumber,
    customerNumber;


select
    payments.checkNumber,
    payments.amount,
    customers.customerName,
    customers.customerNumber,
    employees.firstName,
    employees.lastName
from
    employees
left join
    customers
on
    employees.employeeNumber = customers.salesRepEmployeeNumber
left join
    payments
on
    payments.customerNumber = customers.customerNumber
order by
    checkNumber,
    customerNumber



select
    orders.orderNumber,
    orders.customerNumber,
    orderdetails.productCode
from
    orders
left join
    orderdetails
on
    orders.orderNumber = orderdetails.orderNumber
where
    orders.orderNumber = 10123


select
    orders.orderNumber,
    orders.customerNumber,
    orderdetails.productCode
from
    orders
left join
    orderdetails
on
    orders.orderNumber = orderdetails.orderNumber
and
    orders.orderNumber = 10123

# right Join

SELECT
    customers.customerName,
    employees.employeeNumber
FROM
    customers
RIGHT JOIN
    employees
ON
    customers.salesRepEmployeeNumber = employees.employeeNumber

# self JOIN

SELECT
    concat(data_1.employeeNumber, ' - ', data_1.lastName, ' - ', data_1.firstName) as "Employee",
    concat(data_2.employeeNumber, ' - ', data_2.lastName, ' - ', data_2.firstName) as "Manager"
FROM
    employees as data_1
INNER JOIN
    employees as data_2
ON
    data_1.reportsTo = data_2.employeeNumber
ORDER BY
    data_1.employeeNumber


SELECT
    ifnull(concat(data_2.employeeNumber, ' - ', data_2.lastName, ' - ', data_2.firstName), 'No Manager') as "Manager",
    concat(data_1.employeeNumber, ' - ', data_1.lastName, ' - ', data_1.firstName) as "Direct report"
FROM
    employees as data_1
LEFT JOIN
    employees as data_2
ON
    data_1.employeeNumber = data_2.reportsTo
ORDER BY
    Manager DESC


select
    cust_1.city,
    cust_1.customerName,
    cust_2.customerName as "Customer City"
from
    customers as cust_1
inner join
    customers as cust_2
on
    cust_1.city = cust_2.city
and
    cust_1.customerName != cust_2.customerName
order by
    cust_1.city, cust_1.customerName


select
    cust_1.city,
    cust_1.customerName,
    cust_2.customerName as "Customer City"
from
    customers as cust_1
inner join
    customers as cust_2
on
    cust_1.city = cust_2.city
order by
    cust_1.city, cust_1.customerName


## CROSS JOIN

select
    customers.customerName,
    employees.firstName,
    employees.lastName
from
    customers
cross join
    employees
order by
    customerName, lastName


select
    customers.customerName,
    employees.firstName,
    employees.lastName
from
    customers
cross join
    employees
where
    employees.jobTitle = 'Sales Rep'
order by
    customerName, lastName

SELECT BIT_AND(employee_id) AS bitwise_and_result
FROM employees;



-- SQLBook: Code
