
/* Question 1: Basic ROLLUP with Single Column*/
select name as category_name, count(*) as total_number_film
from film_category
join category
using (category_id)
group by name
with rollup;


/* Question 2: Basic ROLLUP with Two Columns*/

select 
       str.store_id,
       stf.staff_id,
       count(rt.rental_id) as Total_count
from store as str
join staff as stf using(store_id)
join rental as rt using (staff_id)
group by 
       store_id, 
       staff_id
       with rollup; 
       
       
/* Question 3: Understanding NULL in ROLLUP Results*/ 
SELECT 
    ct.country, 
    cc.city,
    COUNT(ct.country) AS 'country count', 
    COUNT(cc.city)    AS 'city count'
FROM
    customer AS c
JOIN 
    address AS ad 
USING 
    (address_id)
JOIN 
    city AS cc 
USING 
    (city_id)
JOIN 
    country AS ct 
USING 
    (country_id)
GROUP BY 
    ct.country, cc.city WITH rollup;


/*Question 4: Column Hierarchy - Version A */

SELECT 
    p.customer_id,
    YEAR(p.payment_date) AS payment_year,
    SUM(p.amount) AS total_payments
FROM payment p
GROUP BY p.customer_id, 
         YEAR(p.payment_date) 
         WITH ROLLUP;


-- Question 5: Column Hierarchy - Version B
SELECT 
    p.customer_id,
    YEAR(p.payment_date) AS payment_year,
    SUM(p.amount) AS total_payments
FROM payment p
GROUP BY YEAR(p.payment_date), 
         p.customer_id 
         WITH ROLLUP;
         
         
-- Question 7: Film Length Categories
SELECT 
    f.rating,
    CASE 
        WHEN f.length < 90 THEN 'Short'
        WHEN f.length BETWEEN 90 AND 120 THEN 'Medium'
        ELSE 'Long'
    END AS length_category,
    COUNT(*) AS film_count,
    GROUPING(f.rating) AS rating_grouping,
    GROUPING(CASE WHEN f.length < 90 THEN 'Short'
                  WHEN f.length BETWEEN 90 AND 120 THEN 'Medium'
                  ELSE 'Long' END) AS length_grouping
FROM film f
GROUP BY f.rating, 
         CASE WHEN f.length < 90 THEN 'Short'
              WHEN f.length BETWEEN 90 AND 120 THEN 'Medium'
              ELSE 'Long' END 
WITH ROLLUP;


-- Question 8
SELECT 
  CASE WHEN GROUPING(store_id) = 1 THEN 'All Stores' ELSE CAST(store_id AS CHAR) END AS store,
  CASE WHEN GROUPING(rental_month) = 1 THEN 'All Months' ELSE LPAD(rental_month, 2, '0') END AS rental_month,
  SUM(revenue) AS revenue
FROM (
  SELECT 
      s.store_id AS store_id,
      MONTH(r.rental_date) AS rental_month,
      SUM(p.amount) AS revenue
  FROM rental r
  JOIN payment p ON r.rental_id = p.rental_id
  JOIN staff sf ON r.staff_id = sf.staff_id
  JOIN store s ON sf.store_id = s.store_id
  GROUP BY s.store_id, MONTH(r.rental_date)
) AS sub
GROUP BY store_id, rental_month WITH ROLLUP
ORDER BY store_id, rental_month;


SELECT 
      s.store_id AS store_id,
      MONTH(r.rental_date) AS rental_month,
      SUM(p.amount) AS revenue
  FROM rental r
  JOIN payment p ON r.rental_id = p.rental_id
  JOIN staff sf ON r.staff_id = sf.staff_id
  JOIN store s ON sf.store_id = s.store_id
  GROUP BY s.store_id, MONTH(r.rental_date)


-- Qurstion 9 
SELECT 
    IF(GROUPING(co.country), 'Grand Total', co.country) AS country,
    IF(GROUPING(ci.city), 
       IF(GROUPING(co.country), '', 'All Cities'), ci.city) AS city,
    IF(GROUPING(cu.customer_id), 
       IF(GROUPING(ci.city), 
          IF(GROUPING(co.country), '', 'All Customers'),
          'All Customers'), 
       CONCAT(cu.first_name, ' ', cu.last_name)) AS customer,
    SUM(p.amount) AS total_payments
FROM payment p
JOIN customer cu ON p.customer_id = cu.customer_id
JOIN address a ON cu.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
GROUP BY co.country, ci.city, cu.customer_id WITH ROLLUP;

























