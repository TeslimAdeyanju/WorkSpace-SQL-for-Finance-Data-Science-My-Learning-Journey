
/* MySQL ADDTIME() Function */


--add hours to the time 
select addtime('2023-10-23 14:30:00', '03:30:45');

-- Add minutes to the time 
SELECT ADDTIME('00:30:00', '00:15:00');

--  Using the ADDTIME() function with negative time intervals
SELECT ADDTIME('00:15:00', '-00:10:00');


/* MySQL DATE_ADD() Function */

select date_add('2025-12-10 23:10:23', interval 1 second) as time_taken;

-- adding day 
SELECT 
    DATE_ADD('1999-12-31 00:00:01',
        INTERVAL 1 DAY) result;    
        
        
        
        
--adding multiple day, time, and seconds 
SELECT 
    DATE_ADD('1999-12-31 23:59:59',
        INTERVAL '1:1' MINUTE_SECOND) result;
        
   
-- MySQL DATEDIFF() Function

select datediff('1977-10-26', '2025-09-04') as age;

SELECT 
  orderNumber, 
  DATEDIFF(requiredDate, shippedDate) daysLeft 
FROM 
  orders 
ORDER BY 
  daysLeft DESC;  
        
-- another examples 
SELECT 
  orderNumber, 
  DATEDIFF(requiredDate, orderDate) remainingDays 
FROM 
  orders 
WHERE 
  status = 'In Process' 
ORDER BY 
  remainingDays;        
        
-- usinf the dateddii with ifnull

SELECT 
  orderNumber, 
  IFNULL(DATEDIFF(shippedDate, orderDate), 'Not Available') orderToShip 
FROM 
  orders 
ORDER BY 
  orderDate DESC;
        
        
--  MySQL TIMEDIFF() Function

select timediff('12:00:00', '10:00:00') as diff;

-- using the timediff to get a difference btw two time 

select 
     orderNumber, 
     timediff(shippedDate, orderDate) as shiptime
from orders;


-- Using time_format 
select orderNumber, 
     time_format(timediff(shippedDate, orderDate), '%H hours %i minutes')  as shiptime
from orders;



/* MySQL TIMESTAMPADD() Function */

SELECT TIMESTAMPADD(DAY, 7, '2025-01-01 15:30:30') AS time_day
        
      
      
/*   MySQL QUARTER() Function */ 
      
SELECT 
  QUARTER(orderDate) quarter, 
  COUNT(*) orderCount 
FROM 
  orders 
WHERE 
  year(orderDate) = 2004 
GROUP BY 
  QUARTER(orderDate);
        
 
 
 -- Example 2 
 SELECT 
  QUARTER(orderDate) quarter, 
  COUNT(*) orderCount 
FROM 
  orders 
WHERE 
  year(orderDate) = 2004 
GROUP BY 
  QUARTER(orderDate);
 
      

 -- MySQL MONTH() Function

SELECT 
  MONTH(orderDate) month, 
  ROUND(
    SUM(quantityOrdered * priceEach)
  ) subtotal 
FROM 
  orders 
  INNER JOIN orderdetails USING (orderNumber) 
WHERE 
  YEAR(orderDate) = 2004 
GROUP BY 
  month;  
  
  
 -- day of the month 
 SELECT 
  DAY(orderdate) dayofmonth, 
  COUNT(*) 
FROM 
  orders 
WHERE 
  YEAR(orderdate) = 2004 
GROUP BY 
  dayofmonth 
ORDER BY 
  dayofmonth;
  
 
 
 SELECT @@lc_time_names;
 
 
 select dayname('2025-09-25');
 
 select dayname('1977-10-26')
 
-- select dayname 
SELECT 
    dayname(orderdate) AS DAY,
    COUNT(*)              total_orders
FROM 
    orders
WHERE 
    YEAR(orderdate) = 2004
GROUP BY 
    1
 
-- select monthname 
SELECT 
    monthname(orderdate) AS DAY,
    COUNT(*)              total_orders
FROM 
    orders
WHERE 
    YEAR(orderdate) = 2004
GROUP BY 
    1;
    
SELECT
    SUM(CASE WHEN status = 'Shipped' THEN 1 ELSE 0 END) AS shipped_orders,
    SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END) AS pending_orders,
    SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END) AS cancelled_orders,
    COUNT(*) AS total_orders
FROM orders;
        
