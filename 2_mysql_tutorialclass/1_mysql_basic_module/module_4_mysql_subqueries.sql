    /** 3.1  COMPLETE GUIDE: SINGLE-ROW OPERATORS WITH AGGREGATE FUNCTIONS**/ 
   
   
    /*-- 1. USING > (GREATER THAN) WITH AGGREGATE FUNCTIONS*/
   -- Example 1.1: > with AVG()
   -- Business Scenario: "Find all films with a rental rate higher than the average rental rate
   SELECT
          film_id,
          title,
          rental_rate
   FROM   film
   WHERE  rental_rate >
          ( SELECT
                  AVG(rental_rate)
          FROM    film );
   
   
   /*-- Example 1.2: > with MAX()*/
   /*-- Business Scenario: "Find customers who have made more payments than the customer with the 
   -- maximum number of payments"*/
   SELECT
            c.customer_id,
            c.first_name,
            c.last_name,
            COUNT(p.payment_id) AS payment_count
   FROM     customer AS c
   JOIN     payment AS p
   USING 
            customer_id
   GROUP BY c.customer_id,
            c.first_name,
            c.last_name
   HAVING
            COUNT(p.payment_id) >=
            ( SELECT
                    MAX(payment_count)
            FROM   ( SELECT
                             customer_id,
                             COUNT(*) AS payment_count
                    FROM     payment
                    GROUP BY customer_id) AS customer_payments)
   
   
   /*-- Example 1.3: > with SUM()*/
   /*-- Business Scenario: "Find films that have generated more total revenue than the average film's 
   -- total revenue"*/
   SELECT
          ROUND(AVG(film_revenue), 2)
   FROM   ( SELECT
                   SUM(p2.amount) AS film_revenue
          FROM     sakila.film AS f2
          JOIN     sakila.inventory AS i2
          USING
                   (film_id)
          JOIN     sakila.rental AS r2
          USING
                   (inventory_id)
          JOIN     sakila.payment AS p2
          USING 
                   rental_id
          GROUP BY f2.film_id) AS average_revenue
   
   
    /*-- Example 1.4: > with MIN()*/
   --Business Scenario: "Find all films longer than the shortest film duration"
   SELECT 
          film_id, 
          title, 
          LENGTH
   FROM   film
   WHERE  LENGTH > 
          ( SELECT 
                  MIN(LENGTH)
          FROM    film ;
   
   
    /*-- Example 1.5: > with COUNT()*/
   --Business Scenario: "Find actors who have appeared in more films than the average actor"
   SELECT 
            a.actor_id,
            a.first_name,
            a.last_name,
            COUNT(fa.film_id) AS film_count
   FROM     actor as a
   JOIN     film_actor as fa ON a.actor_id = fa.actor_id
   GROUP BY a.actor_id,
            a.first_name,
            a.last_name
   HAVING 
            COUNT(fa.film_id) > 
            ( SELECT 
                    AVG(film_count)
            FROM    ( SELECT 
                             actor_id,
                             COUNT(*) AS film_count
                    FROM     film_actor
                    GROUP BY actor_id ) AS actor_film_counts );
                                                                                        
   
   
   
   
   /*-- 2. Using < (Less Than) with Aggregate Functions*/
   
    /*-- Example 2.1: < with AVG()*/
   -- Business Scenario: "Find all budget-friendly films priced below the average rental rate"
   SELECT 
          film_id, 
          title, 
          rental_rate, 
          rating
   FROM   film
   WHERE  rental_rate < 
          ( SELECT 
                  AVG(rental_rate)
          FROM    film );
   
   
    /*-- Example 2.2: < with MAX()*/
   --Business Scenario: "Find all films shorter than the longest film"
   SELECT 
            film_id,
            title,
            LENGTH,
            (SELECT 
                    MAX(LENGTH) 
            FROM    film) AS longest_film_duration
   FROM     film
   WHERE    LENGTH < 
            ( SELECT 
                    MAX(LENGTH)
            FROM    film )
   ORDER BY LENGTH DESC;
  
  
    /*-- Example 2.3: < with MIN()*/
   -- Business Scenario: "Identify films with rental duration longer than the minimum rental duration (if any exist)
   SELECT 
          film_id, 
          title, 
          rental_duration
   FROM   film
   WHERE  rental_duration >
          ( SELECT 
                  MIN(rental_duration)
          FROM    film );
  
   
    /*-- Example 2.4: < with COUNT()*/
   -- Business Scenario: "Find categories with fewer films than the average number of films per category
   SELECT 
             c.category_id,
             c.name,
             COUNT(fc.film_id) AS film_count
   FROM      category c
   LEFT JOIN film_category fc ON c.category_id = fc.category_id
   GROUP BY  c.category_id,
             c.name
   HAVING 
             COUNT(fc.film_id) < 
             ( SELECT 
                     AVG(films_per_category)
             FROM    ( SELECT 
                              category_id,
                              COUNT(*) AS films_per_category
                     FROM     film_category
                     GROUP BY category_id ) AS category_counts );
                                                                                                
   
   
   
   
   /*-- 3. Using = (Equals) with Aggregate Functions*/
   
   /*-- Example 3.1: = with MAX()*/
   --Business Scenario: "Find the most expensive film(s) in the inventory"
   SELECT 
          film_id, 
          title, 
          rental_rate
   FROM   film
   WHERE  rental_rate = 
          ( SELECT 
                  MAX(rental_rate)
          FROM    film );

  
   
    /*-- Example 3.2: = with MIN()*/
   -- Business Scenario: "Find the cheapest film(s) available for rental"
   SELECT 
          film_id, 
          title, 
          rental_rate, 
          rating
   FROM   film
   WHERE  rental_rate = 
          ( SELECT 
                  MIN(rental_rate)
          FROM    film );

   
    /*-- Example 3.3: = with AVG()*/
   -- Business Scenario: "Find customers whose total spending exactly matches the average customer spending
   SELECT 
            c.customer_id,
            c.first_name,
            c.last_name,
            SUM(p.amount) AS total_spent,
            (SELECT 
                    AVG(customer_total)
            FROM    (SELECT 
                             customer_id, 
                             SUM(amount) AS customer_total
                    FROM     payment
                    GROUP BY customer_id) AS totals) AS avg_spending
   FROM     customer c
   JOIN     payment p ON c.customer_id = p.customer_id
   GROUP BY c.customer_id, 
            c.first_name, 
            c.last_name
   HAVING 
            SUM(p.amount) = 
            ( SELECT 
                    AVG(customer_total)
            FROM    ( SELECT 
                             customer_id, 
                             SUM(amount) AS customer_total
                    FROM     payment
                    GROUP BY customer_id ) AS customer_totals );

 
    /*-- Example 3.4: = with COUNT()*/
   -- Business Scenario: "Find films that have been rented exactly as many times as the most-rented film
   SELECT 
            f.film_id, 
            f.title,
            COUNT(r.rental_id) AS rental_count
   FROM     film f
   JOIN     inventory i ON f.film_id      = i.film_id
   JOIN     rental r    ON i.inventory_id = r.inventory_id
   GROUP BY f.film_id, 
            f.title
   HAVING 
            COUNT(r.rental_id) = 
            ( SELECT 
                    MAX(rental_count)
            FROM    ( SELECT 
                             f2.film_id,
                             COUNT(r2.rental_id) AS rental_count
                    FROM     film AS f2
                    JOIN     inventory i2 ON f2.film_id      = i2.film_id
                    JOIN     rental r2    ON i2.inventory_id = r2.inventory_id
                    GROUP BY f2.film_id ) AS film_rentals );

   
   
   
   
    /*-- 4. Using >= (Greater Than or Equal To) with Aggregate Functions*/
   --Business Scenario: "Find films with replacement cost at or above the average"
   SELECT 
            film_id, 
            title, 
            replacement_cost,
            (SELECT 
                    AVG(replacement_cost) 
            FROM    film) AS avg_cost
   FROM     film
   WHERE    replacement_cost >= 
            ( SELECT 
                    AVG(replacement_cost)
            FROM    film )
   ORDER BY replacement_cost;

   
      /*-- Example 4.1: >= with AVG()*/
   -- Business Scenario: "Find actors who have appeared in as many or more films than the most prolific actor"
   SELECT 
            a.actor_id,
            a.first_name,
            a.last_name,
            COUNT(fa.film_id) AS film_count
   FROM     actor a
   JOIN     film_actor fa ON a.actor_id = fa.actor_id
   GROUP BY a.actor_id,
            a.first_name,
            a.last_name
   HAVING 
            COUNT(fa.film_id) >= 
            ( SELECT 
                    MAX(film_count)
            FROM    ( SELECT 
                             actor_id, 
                             COUNT(*) AS film_count
                    FROM     film_actor
                    GROUP BY actor_id ) AS actor_counts );

   
   
   /*-- Example 4.2: >= with MAX()*/
   -- Business Scenario: "Find actors who have appeared in as many or more films than the most prolific actor"
    SELECT
            a.actor_id,
            a.first_name,
            a.last_name,
            COUNT(fa.film_id) AS film_count
   FROM     actor AS a
   JOIN     sakila.film_actor AS fa ON a.actor_id = fa.actor_id
   GROUP BY a.actor_id,
            a.first_name,
            a.last_name
   HAVING 
            COUNT(fa.film_id) >= 
            ( SELECT 
                    MAX(film_count)
            FROM   ( SELECT 
                             actor_id, 
                             COUNT(*) AS film_count
                    FROM     sakila.film_actor
                    GROUP BY actor_id) AS actor_count)
   
   
   /*-- Example 4.3: >= with MIN()*/
   
  -- Business Scenario: "Find all films with length at or above the minimum length (basically all films)"
  
     SELECT
          film_id,
          title,
          LENGTH
   FROM   sakila.film
   WHERE  LENGTH>=
          ( SELECT
                  MIN(LENGTH)
          FROM    film)
   
   
   
   
   
   
   
   
   /*-- Example 4.4: >= with SUM()*/
   /*-- 5. Using <= (Less Than or Equal To) with Aggregate Functions*/
   /*-- Example 5.1: <= with AVG()*/
   /*-- Example 5.2: <= with MAX()*/
   /*-- Example 5.3: <= with MIN()*/
   /*-- Example 5.4: <= with COUNT()*/
   /*-- 6. Using <> or != (Not Equal To) with Aggregate Functions*/
   /*-- Example 6.1: <> with AVG()*/
   /*--Example 6.2: <> with MAX()*/
   /*-- Example 6.3: <> with MIN()*/
   /*-- Example 6.4: != with COUNT()*/
   /*-- 7. Complex Example: Combining Multiple Aggregate Comparisons*/
   /*--Example 7.1:  "Find films that are above average in price BUT below average in length - premium 
   -- short films"*/
   /*--Example 7.2: "Find the most expensive film in the shortest category"*/
   /*--**3.2  COMPLETE GUIDE: MULTIPLE-ROW OPERATORS (IN, ANY, ALL)/***/
   /*--Business Scenario: "Find all customers who have rented films from the 'Action' category"*/
   SELECT 
          customer_id, 
          first_name, 
          last_name, 
          email
   FROM   customer
   WHERE  address_id 
          IN 
          ( SELECT 
                  DISTINCT r.customer_id
          FROM    rental r
          JOIN    inventory i      ON r.inventory_id = i.inventory_id
          JOIN    film_category fc ON i.film_id      = fc.film_id
          JOIN    category c       ON fc.category_id = c.category_id
          WHERE   c.name                             = 'Action');
   /*-- Business Scenario: "Find all actors who have appeared in films rented by customer_id 5"*/
   SELECT 
            a.actor_id,
            a.first_name,
            a.last_name,
            COUNT(DISTINCT fa.film_id) AS films_with_customer5
   FROM     actor a
   JOIN     film_actor fa ON a.actor_id = fa.actor_id
   WHERE    fa.film_id 
            IN 
            ( SELECT 
                    DISTINCT i.film_id
            FROM    rental r
            JOIN    inventory i ON r.inventory_id = i.inventory_id
            WHERE   r.customer_id                 = 5 )
   GROUP BY a.actor_id,
            a.first_name,
            a.last_name
   ORDER BY films_with_customer5 DESC;
   /*-- Business Scenario: "Find all films that have NEVER been rented"*/
   SELECT 
            f.film_id, 
            f.title, 
            f.rental_rate, 
            f.length
   FROM     film f
   WHERE    f.film_id NOT 
            IN 
            ( SELECT 
                    DISTINCT i.film_id
            FROM    inventory i
            JOIN    rental r ON i.inventory_id = r.inventory_id )
   ORDER BY f.rental_rate DESC;
   /*-- Business Scenario: "Find all staff members who work at stores that have inventory of 'Horror' 
   -- films"*/
   SELECT 
          s.staff_id, 
          s.first_name, 
          s.last_name, 
          s.email
   FROM   staff s
   WHERE  s.store_id 
          IN 
          ( SELECT 
                  DISTINCT i.store_id
          FROM    inventory i
          JOIN    film_category fc ON i.film_id      = fc.film_id
          JOIN    category c       ON fc.category_id = c.category_id
          WHERE   c.name                             = 'Horror' );
   /*-- Business Scenario: "Find customers who have rented films that cost exactly one of the standard 
   -- price points (0.99, 2.99, 4.99)"*/
   SELECT
            DISTINCT c.customer_id,
            c.first_name,
            c.last_name,
            COUNT(DISTINCT r.rental_id) AS total_rentals
   FROM     customer c
   JOIN     rental r    ON c.customer_id  = r.customer_id
   JOIN     inventory i ON r.inventory_id = i.inventory_id
   JOIN     film f      ON i.film_id      = f.film_id
   WHERE    f.rental_rate IN (0.99,
                              2.99,
                              4.99)
   GROUP BY c.customer_id,
            c.first_name,
            c.last_name
   ORDER BY total_rentals DESC;
   /*--*/
   /*-- 3.2  Complete Guide: Multiple-Row Operators (IN, ANY, ALL)*/
   /*-- Business Scenario: "Find films more expensive than ANY film in the 'Family' category"*/
   SELECT
          f.film_id,
          f.title,
          f.rental_rate,
          ( SELECT
                  MIN(f2.rental_rate)
          FROM    film AS f2
          JOIN    film_category AS fc2 ON f2.film_id     = fc2.film_id
          JOIN    category AS c2       ON c2.category_id = fc2.category_id
          WHERE   c2.name                                = "Family" ) AS cheapest_family_film
   FROM   film AS f
   WHERE  f.rental_rate > ANY
          ( SELECT
                  f2.rental_rate
          FROM    film AS f2
          JOIN    film_category AS fc ON f2.film_id    = fc.film_id
          JOIN    category AS c       ON c.category_id = fc.category_id
          WHERE   c.name                               = "Family");
   /*--DERIVED TABLE*/
   /*-- Example 1*/
   SELECT
              productCode,
              ROUND(SUM(quantityOrdered * priceEach)) AS sales
   FROM       orderdetails
   INNER JOIN orders 
   USING 
              orderNumber
   WHERE      YEAR(shippedDate) = 2003
   GROUP BY   productCode
   ORDER BY   sales DESC
   LIMIT 
              5;
   /*-- Example 2:*/
   SELECT
              productName, 
              sales
   FROM       (SELECT
                         productCode,
                         ROUND(SUM(quantityOrdered * priceEach)) AS sales
              FROM       orderdetails
              INNER JOIN orders 
              USING 
                         orderNumber
              WHERE      YEAR(shippedDate) = 2003
              GROUP BY   productCode
              ORDER BY   sales DESC
              LIMIT 
                         5) AS top5products2003
   INNER JOIN products 
   USING 
              (productCode);
   /*-- Example 3*/
   SELECT 
          customerName,
          FORMAT(creditlimit, 2) AS formatted_creditlimit,
          CASE WHEN creditlimit                             < 100000 
                 THEN 'spending_below_100' WHEN creditlimit < 200000 
                 THEN 'spending_above_100'
                 ELSE 'check'
          END AS spending_group
   FROM   customers;
   /*-- Example 4*/
   SELECT
              customerNumber,
              ROUND(SUM(quantityOrdered * priceEach)) sales,
              ( 
              CASE WHEN SUM(quantityOrdered * priceEach) < 10000 
                         THEN 'Silver' WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 AND 100000 
                         THEN 'Gold' WHEN SUM(quantityOrdered * priceEach) > 100000 
                         THEN 'Platinum'
              END) customerGroup
   FROM       orderdetails
   INNER JOIN orders 
   USING 
              orderNumber
   WHERE      YEAR(shippedDate) = 2003
   GROUP BY   customerNumber;
   /*--Example 5*/
   SELECT
            customerGroup,
            COUNT(cg.customerGroup) AS groupCount
   FROM     (SELECT
                       customerNumber,
                       ROUND(SUM(quantityOrdered * priceEach)) sales,
                       ( 
                       CASE WHEN SUM(quantityOrdered * priceEach) < 10000 
                                  THEN 'Silver' WHEN SUM(quantityOrdered * priceEach) BETWEEN 10000 
                                             AND 100000 
                                  THEN 'Gold' WHEN SUM(quantityOrdered * priceEach) > 100000 
                                  THEN 'Platinum'
                       END) customerGroup
            FROM       orderdetails
            INNER JOIN orders 
            USING 
                       orderNumber
            WHERE      YEAR(shippedDate) = 2003
            GROUP BY   customerNumber) cg
   GROUP BY cg.customerGroup;




