
-- Database: classicmodels



-- Example 1
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



-- Example 2: 
SELECT
    productName, sales
FROM
    (SELECT
        productCode,
        ROUND(SUM(quantityOrdered * priceEach)) as sales
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


-- Example 3
SELECT customerName, 
       FORMAT(creditlimit, 2) AS formatted_creditlimit,
  CASE 
    WHEN creditlimit < 100000 THEN 'spending_below_100'
    WHEN creditlimit < 200000 THEN 'spending_above_100'
    ELSE 'check'
  END AS spending_group
FROM customers;


-- Example 4
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


--Example 5

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




