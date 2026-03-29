-- -- Database: HR_db
-- 1. Write a MySQL query to find the addresses (location_id, street_address, city, state_province, 
-- country_name) of all the departments.
Hint : USE NATURAL JOIN.
SELECT 
    LOCATION_ID, 
    STREET_ADDRESS, 
    CITY, 
    STATE_PROVINCE, 
    COUNTRY_NAME
FROM 
    HR_db.locations
JOIN 
    HR_db.countries 
USING 
    (COUNTRY_ID)
-- 2. Write a MySQL query to find the name (first_name, last name), department ID and name of all 
-- the employees.
SELECT 
    FIRST_NAME, 
    LAST_NAME
FROM 
    HR_db.employees
JOIN 
    HR_db.departments 
USING 
    (DEPARTMENT_ID)
-- 3. Write a MySQL query to find the name (first_name, last_name), job, department ID and name of 
-- the employees who works in London.
SELECT 
    FIRST_NAME, 
    LAST_NAME, 
    JOB_ID, 
    departments.DEPARTMENT_ID
FROM 
    HR_db.employees
JOIN 
    HR_db.departments 
USING 
    (DEPARTMENT_ID)
JOIN 
    HR_db.locations
WHERE 
    CITY = 'London'