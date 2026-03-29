

-- topic: MySQL CONCAT() Function

SELECT 
  CONCAT(firstName, ' ', lastName) full_name 
FROM 
  employees;
  
-- Using MySQL CONCAT with NULL values
SELECT 
  city, 
  state, 
  CONCAT(city, ',', state) city_state 
FROM 
  customers
where city is not null and
state is not null;

-- Handling the null value in concat
SELECT 
  city, 
  state, 
  CONCAT(
    city, 
    IF(state IS NULL, '', ','), 
    IFNULL(state, '')
  ) city_state 
FROM 
  customers;



-- topic: MySQL CONCAT_WS() Function

SELECT CONCAT_WS(' ', firstName, lastName) full_name1,
      CONCAT(firstName," ", lastName) full_name_2
FROM employees
ORDER BY lastName;


-- using conc_w for null 
SELECT
  city,
  state,
  CONCAT(city, ',', state) city_state_using_concat,
  concat_ws( ' ', city,state) city_state_using_concat_ws
FROM
  customers;








--MySQL INSTR() Function

SELECT INSTR('MySQL INSTR', 'MySQL');



SELECT
    productName
FROM
    products
WHERE
    INSTR(productname,'Car') >0;



SELECT
    productName
FROM
    products
WHERE
    productname like '%Car%'

-- create an index
CREATE INDEX idx_products_name ON products(productname)

select *
from products

SELECT
    productname
FROM
    products
WHERE
    productname LIKE '1900%';


EXPLAIN SELECT
    productname
FROM
    products
WHERE
    productname LIKE '1900%';


EXPLAIN SELECT
    productname
FROM
    products
WHERE
    instr(productname,'1900');



SHOW CHARACTER SET;

SELECT @@character_set_database;

SELECT LENGTH('Hello') as length;


SELECT
  LENGTH('Café') length_latin1,
  LENGTH(
    CONVERT('Café' USING utf8mb3)
  ) length_utf8;



 -- Topic Concatenation Functions
 
 





























