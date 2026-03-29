SELECT 
    ABS(-10), 
    ABS(0), 
    ABS(10);  

-- Abs Examples 
SELECT
    productName,
    productLine,
    msrp,
    ABS(ROUND(msrp - AVG(msrp) OVER (PARTITION BY productLine))) deviation
FROM
    products
ORDER BY
    productName;
    
    
-- Example on ceiling 

select productline, avg(msrp)as average_without_ceil, ceil(avg(msrp)) as average_with_ceil
from products
group by productline
order by average_without_ceil
