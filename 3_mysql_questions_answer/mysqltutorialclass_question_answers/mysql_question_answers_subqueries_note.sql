SELECT 
    a.name,
    COUNT(*)      AS number_views,
    AVG(r.rating) AS avg_rating
FROM 
    renting AS r
LEFT JOIN 
    customers AS c
ON 
    r.customer_id = c.customer_id
LEFT JOIN 
    actsin AS ai
ON 
    r.movie_id = ai.movie_id
LEFT JOIN 
    actors AS a
ON 
    ai.actor_id = a.actor_id
WHERE 
    c.gender = 'male'
GROUP BY 
    a.name
HAVING 
    AVG(r.rating) IS NOT NULL
ORDER BY 
    avg_rating DESC, 
    number_views DESC
---

SELECT *
FROM customers
where  customer_id in            -- Select all customers with more than 10 movie rentals
        (SELECT customer_id
        FROM renting
        GROUP BY customer_id
        Having customer_id >10);
        
        
        
---

SELECT *
FROM customers
where  customer_id in            -- Select all customers with more than 10 movie rentals
        (SELECT customer_id
        FROM renting
        GROUP BY customer_id
        Having count(*) >10);    
        
        
---

select *
from customers
where customer_id in ( select count(*)
from renting
where customer_id <5)
        
---

SELECT min(rating)
from renting as r
where r.customer_id = 7;


---


SELECT *
FROM customers as c
WHERE 4 > -- Select all customers with a minimum rating smaller than 4 
        (SELECT MIN(rating)
        FROM renting AS r
        WHERE r.customer_id = c.customer_id);



----


SELECT *
FROM movies AS m
WHERE 8 < -- Select all movies with an average rating higher than 8
        (SELECT avg(rating)
        FROM renting AS r
        WHERE r.movie_id = m.movie_id);


 ---
SELECT *
FROM customers as c-- Select all customers with at least one rating
WHERE EXISTS
        (SELECT *
        FROM renting AS r
        WHERE rating IS NOT NULL 
        AND r.customer_id = c.customer_id); 
        
-- 



select fm.title, 
fm.rental_duration, 
sum(fm.rental_rate * fm.length) as revenue, 
year(fm.last_update) as Year, pm.amount,
case 
when sum(fm.rental_rate * fm.length) <500 then 'Silver'
when sum(fm.rental_rate * fm.length) BETWEEN 500 and 1000 then 'Gold'
WHEN sum(fm.rental_rate * fm.length) > 1000 then 'Platinum'
     else 'check'
     end as grouping_list
from film as fm 
join inventory as iv USING(film_id)
JOIN rental as rt USING(inventory_id)
JOIN payment as pm USING(rental_id)
GROUP by fm.title, fm.rental_duration, year(fm.last_update), pm.amount



-- using the consoto database 


   SELECT 
          concat(c.surname, ' ', c.givenname) AS full_name, 
          c.vehicle, 
          s.unitprice, 
          s.quantity, 
          round((s.unitprice * s.quantity):: NUMERIC,2) AS revenue, 
   (SELECT 
          MAX(unitprice * quantity) FROM sales)
   from customer as c
   JOIN   sales AS s USING (customerkey);
























































        
        
        