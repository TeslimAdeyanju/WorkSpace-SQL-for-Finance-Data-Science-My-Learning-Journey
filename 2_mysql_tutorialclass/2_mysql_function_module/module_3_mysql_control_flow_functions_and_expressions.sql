--Topic: CASE
SELECT 
    customerName, 
    COUNT(*) orderCount
FROM
    orders
INNER JOIN customers 
        USING (customerNumber)
GROUP BY customerName
ORDER BY COUNT(*);

--
WITH cte AS (
        SELECT 
                customerName, 
                COUNT(*) orderCount
        FROM
                orders
        INNER JOIN customers 
                USING (customerNumber)
        GROUP BY customerName
)

SELECT 
    customerName, 
    orderCount,
    CASE orderCount
                WHEN 1 THEN 'One-time Customer'
        WHEN 2 THEN 'Repeated Customer'
        WHEN 3 THEN 'Frequent Customer'
        ELSE 'Loyal Customer'
        end customerType
FROM
    cte
ORDER BY customerName;


--

SELECT 
    customerName, 
    state, 
    country
FROM
    customers
ORDER BY (
    CASE
        WHEN state IS NULL THEN country
        ELSE state
    END
);


SELECT DISTINCT status
FROM orders
ORDER BY status;

--

SELECT 
    SUM(CASE
        WHEN status = 'Shipped' THEN 1
        ELSE 0
    END) AS 'Shipped',
    
    SUM(CASE
        WHEN status = 'On Hold' THEN 1
        ELSE 0
    END) AS 'On Hold',
    
    SUM(CASE
        WHEN status = 'In Process' THEN 1
        ELSE 0
    END) AS 'In Process',
    
    SUM(CASE
        WHEN status = 'Resolved' THEN 1
        ELSE 0
    END) AS 'Resolved',
    
    SUM(CASE
        WHEN status = 'Cancelled' THEN 1
        ELSE 0
    END) AS 'Cancelled',
    
    SUM(CASE
        WHEN status = 'Disputed' THEN 1
        ELSE 0
    END) AS 'Disputed',
    
    COUNT(*) AS Total
FROM
    orders;



-- Topic: IF statement

select if(1 =2, 'true', 'false');


-- MySQL IFNULL


CREATE TABLE IF NOT EXISTS contacts (
    contactid INT AUTO_INCREMENT PRIMARY KEY,
    contactname VARCHAR(20) NOT NULL,
    bizphone VARCHAR(15),
    homephone VARCHAR(15)
);

--insert into the table 

INSERT INTO contacts(contactname,bizphone,homephone)
VALUES('John Doe','(541) 754-3009',NULL),
      ('Cindy Smith',NULL,'(541) 754-3110'),
      ('Sue Greenspan','(541) 754-3010','(541) 754-3011'),
      ('Lily Bush',NULL,'(541) 754-3111');

-- select from the table 

SELECT 
    contactName, bizphone, homephone
FROM
    contacts;
    
    
-- using the ifnull to replace the content of the missing values 

select 
contactname,
IFNULL(bizphone, homephone) as phone
from contacts;








