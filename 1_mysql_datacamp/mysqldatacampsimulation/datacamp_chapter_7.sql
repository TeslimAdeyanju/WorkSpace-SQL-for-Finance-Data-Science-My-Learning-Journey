select generate_series(1,100,2);

---
select generate_series('2018-02-01', '2019-02-01', '1 month'::interval);


select generate_series('2018-02-01', '2019-02-01', '1 month'::interval) - '1 day'::interval

SELECT generate_series('2018-01-01',

'2018-01-15', '2 days'::interval);




SELECT generate_series('2018-01-01',

'2018-01-02', '5 hours'::interval);

---

SELECT 
    date_sent, 
    date_trunc('hour', date_sent ) AS info, 
    COUNT(*),
    GROUPING(date_sent) AS is_grouped
FROM 
    consumer_complaint
GROUP BY 
    info, 
    date_sent WITH ROLLUP
ORDER BY 
    info;
--
WITH 
    hour_series AS 
    (   
    
    
    SELECT
    generate_series('2018-04-23 09:00:00', '2018-04-23 14:00:00', '1 hour'::interval) AS hours
    
    
    )
    
    
--

SELECT 
    DAY
FROM 
    (   SELECT 
            generate_series(MIN(date_received), MAX(date_received), '1 day')::date AS DAY
        FROM 
            consumer_complaint ) AS all_dates
WHERE 
    DAY NOT IN 
    (   SELECT 
            date_received::date 
        FROM 
            consumer_complaint)


---














    
 