    /*-- Database: Sakila*/
    /*-- Set Operator*/
    /*-- UNION Operator*/
    /*-- Example 1: Retrieve all unique first and last names across customers and staff*/
   SELECT
          first_name, 
           /*-- Column 1: first name*/
          last_name 
           /*-- Column 2: last name*/
   FROM   customer 
    /*-- First data source: customers*/
   UNION 
    
    
    
    /*-- Combine results, removing duplicates*/
   SELECT
          first_name, 
           /*-- Must match: Column 1*/
          last_name 
           /*-- Must match: Column 2*/
   FROM   staff;
    
    
    
    /*-- Example 2:  Adding a Label Column to Distinguish Source Master people directory with source label*/
   SELECT
          first_name,
          last_name,
          email,
          'Customer' AS person_type 
           /*-- Literal string to label the source*/
   FROM   customer
   
   UNION ALL 
    
   
   
    /*-- Using UNION ALL because customer and staff emails will not overlap*/
   SELECT
            first_name,
            last_name,
            email,
            'Staff' AS person_type 
             /*-- Different label for the staff rows*/
   FROM     staff
   ORDER BY person_type;
    
    
    
    /*-- Exqmple 3: Sorted Full Directory with CONCAT and ORDER BY*/
    /*-- Full sorted contact directory using CONCAT for full name*/
   SELECT
          CONCAT(first_name, ' ', last_name) AS full_name, 
           /*-- Combine into one column*/
          email,
          'Customer' AS person_type
   FROM   customer
   
   UNION ALL
   
   SELECT
            CONCAT(first_name, ' ', last_name) AS full_name,
            email,
            'Staff' AS person_type
   FROM     staff
   ORDER BY full_name ASC;
    
    
    
    /*-- Sort the ENTIRE combined result alphabetically*/
    /*-- Multi-Store Revenue and Activity Analysis*/
    /*-- Segment 1: High-spend customers from Store 1*/
   SELECT
            c.customer_id,
            CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
            c.store_id,
            SUM(p.amount) AS total_spent, 
             /*-- Total payment amount*/
            COUNT(r.rental_id) AS total_rentals, 
             /*-- Number of rentals*/
            'High Spender' AS segment 
             /*-- Label for this group*/
   FROM     customer c
   JOIN     payment p ON c.customer_id = p.customer_id 
             /*-- Link to payments*/
   JOIN     rental r ON c.customer_id = r.customer_id 
             /*-- Link to rentals*/
   WHERE    c.store_id = 1 
             /*-- Only Store 1 customers*/
   GROUP BY c.customer_id,
            c.first_name,
            c.last_name,
            c.store_id
   HAVING
            SUM(p.amount) > 100 
    /*-- Filter: only those who spent over £100*/
   UNION ALL
   
    
    
    
    /*-- Segment 2: High-frequency renters from Store 2*/
   SELECT
            c.customer_id,
            CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
            c.store_id,
            SUM(p.amount) AS total_spent,
            COUNT(r.rental_id) AS total_rentals,
            'Frequent Renter' AS segment
   FROM     customer c
   JOIN     payment p ON c.customer_id = p.customer_id
   JOIN     rental r  ON c.customer_id = r.customer_id
   WHERE    c.store_id                 = 2
   GROUP BY c.customer_id,
            c.first_name,
            c.last_name,
            c.store_id
   HAVING
            COUNT(r.rental_id) > 20 
             /*-- Filter: only those with more than 20 rentals*/
   ORDER BY segment,
            total_spent DESC;
    
    
    
    /*-- Sort by segment, then by highest spend*/
    /*-- Example 3 — Film Catalogue Audit: Pricing Tier Review*/
    /*-- Tier 1: Premium films (PG-13 or R, priced above $3.00)*/
   SELECT
          film_id,
          title,
          rating,
          rental_rate,
          LENGTH,
          'Premium Tier' AS pricing_segment 
   FROM   film
   WHERE  rental_rate > 3.00
          AND rating IN ('PG-13',
                         'R') 
   UNION ALL
   SELECT
            film_id,
            title,
            rating,
            rental_rate,
            LENGTH,
            'Budget Tier - Review' AS pricing_segment
   FROM     film
   WHERE    rental_rate = 0.99 
   ORDER BY pricing_segment,
            rental_rate DESC,
            title ASC;





-- Example 4 — Rental Status Dashboard: Returned vs Overdue
   WITH 
        record AS 
        ( SELECT
                r.rental_id,
                CONCAT(c.first_name, ' ',c.last_name) AS customer_name,
                r.rental_date,
                r.return_date,
                DATEDIFF(r.return_date, r.rental_date) AS days_kept,
                'Returned' AS rental_status
        FROM    rental AS r
        JOIN    sakila.customer AS c ON c.customer_id = c.customer_id
        WHERE   r.return_date               IS NOT NULL
        
        UNION ALL
        
        SELECT
                 r.rental_id,
                 CONCAT(c.first_name, ' ',c.last_name) AS customer_name,
                 r.rental_date,
                 r.return_date,
                 DATEDIFF(CURRENT_DATE(), r.rental_date) AS days_kept,
                 'Overdue' AS rental_status
        FROM     rental AS r
        JOIN     sakila.customer AS c ON c.customer_id = c.customer_id
        WHERE    r.return_date               IS NOT NULL
        ORDER BY rental_status, 
                 days_kept DESC 
        )
   SELECT 
            COUNT(rental_status), 
            rental_status
   FROM     record
   GROUP BY rental_status
   
   
   
   
   
   

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    
    
    
    
    
    
    
    
