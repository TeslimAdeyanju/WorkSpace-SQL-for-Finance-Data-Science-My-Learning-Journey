
-- Database: Contoso_db


SELECT 
  c.surname,
  c.givenname,
  c.city,
  s.unitprice,
  s.netprice,
  'high_paying' AS customer_group
FROM customer AS c
JOIN sales AS s USING (customerkey)
WHERE s.netprice > 100
  AND EXTRACT(YEAR FROM c.birthday) = 2000
 UNION
 SELECT
  c.surname,
  c.givenname,
  c.city,
  s.unitprice,
  s.netprice,
  'Resident_identity' AS customer_group
FROM customer AS c
JOIN sales AS s USING (customerkey)
WHERE c.state in ('LA', 'RM')
order by customer_group