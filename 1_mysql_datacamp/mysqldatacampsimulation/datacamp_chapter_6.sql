SELECT 
    c.FIRST_NAME, 
    c.LAST_NAME,
    ad.location,
    ad.postal_code,
    ct.city
FROM
    customer AS c
INNER JOIN 
    address AS ad
USING 
    (address_id)
INNER JOIN 
    city AS ct
USING (city_id)

--
SELECT 
    first_name, 
    last_name, 
    district, 
    city_id, 
    last_update
FROM 
    customer
INNER JOIN
    address
USING 
    (address_id) INNER Join city
USING 
    (city_id)


--
select *
from city


--
select city_id
from city
order by city_id asc


--
select rating, count(*)
from film
group by rating

--
SELECT
    f.title,
        r.rental_date,
    f.rental_duration,
    -- Add the rental duration to the rental date
    INTERVAL '1' day * f.rental_duration + r.rental_date AS expected_return_date,
    r.return_date
FROM film AS f
    INNER JOIN inventory AS i ON f.film_id = i.film_id
    INNER JOIN rental AS r ON i.inventory_id = r.inventory_id
ORDER BY f.title;


--
SELECT NOW()::timestamp;

select current_date, now(), cast(now() as date) as converttion

---

SELECT CURRENT_TIMESTAMP;

--
SELECT
    EXTRACT(quarter FROM payment_date) AS quarter,
    EXTRACT(YEAR FROM payment_date)    AS YEAR,
    SUM(amount)                        AS total_payments
FROM 
    payment
GROUP BY 
    1, 
    2;

--
SELECT
    EXTRACT(quarter FROM payment_date) AS quarter
    from payment

select 
EXTRACT(YEAR FROM TIMESTAMP payment_date) AS YEAR
from payment


--
select 
REPLACE(title, ' ', '_') as title
from film

--
select 
first_name, 
last_name,
first_name || '&' || last_name as full_name
from customer

--

select 
email,
position('@' in email)
from customer

--
select 
email,
STRPOS(email, '@')

--
SELECT
LEFT(description, 50) FROM film;

--
SELECT
right(description, 50) FROM film;

--
SELECT 
  -- Select only the street name from the address table
  SUBSTRING(address from position(' ' in  address)+1 FOR CHAR_LENGTH(address)) as info
FROM 
  address;
  
---
  
select to_tsvector(description)
from film



---- Select the film description as a tsvector
SELECT title, description FROM film WHERE to_tsvector(title) @@ to_tsquery('elf');




-- Select the title and description
SELECT title, description
FROM film
-- Convert the title to a tsvector and match it against the tsquery 
WHERE to_tsvector(title) @@ to_tsquery('elf');

--  
select typname, typcategory
from pg_type

--

SELECT 
        f.title, 
    i.inventory_id,
    -- Determine whether the inventory is held by a customer
      inventory_held_by_customer(i.inventory_id) AS held_by_cust 
FROM film as f 
        -- Join the film table to the inventory table
        INNER JOIN inventory AS i ON f.film_id=i.film_id

---

CREATE EXTENSION pg_trgm;

---
SELECT * 
FROM pg_extension;

---

select product_name, sub_product,
similarity(product_name, sub_product)
from consumer_complaint















