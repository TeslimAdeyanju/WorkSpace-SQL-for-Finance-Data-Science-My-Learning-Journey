


SELECT 
   MAX(ratio)
FROM ( SELECT
      customername,
      SUM(amount) AS total_spend,
      COUNT(customername) AS number_of_transaction,
      ROUND(SUM(amount)/COUNT(customername),2) AS ratio
   FROM customers
   JOIN payments
   USING (customerNumber)
   GROUP BY
      customername
   ORDER BY
      number_of_transaction) AS a;


--
SELECT 
    c.customername, 
    AVG(p.amount) as amount
FROM customers AS c
JOIN payments AS p ON c.customerNumber = p.customerNumber
JOIN orders AS o   ON o.customernumber = c.customerNumber
where p.amount in (38983.226667, 26056.197500, 64909.804444)
GROUP BY 
    c.customernumber;


