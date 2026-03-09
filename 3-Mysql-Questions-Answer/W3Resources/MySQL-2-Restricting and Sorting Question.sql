-- Database: HR_db

-- 1. Write a query to display the name (first_name, last_name) and salary for all employees whose
-- salary is not in the range $10,000 through $15,000.
SELECT
    first_name,
    last_name,
    salary
FROM employees
WHERE
    salary NOT BETWEEN 10000 AND 15000;


-- 2. Write a query to display the name (first_name, last_name) and department ID of all employees
-- in departments 30 or 100 in ascending order.
SELECT
    FIRST_NAME,
    LAST_NAME,
    DEPARTMENT_ID
FROM employees
WHERE
    DEPARTMENT_ID IN (30,
                      100)
ORDER BY
    DEPARTMENT_ID ASC;

-- 3. Write a query to display the name (first_name, last_name) and salary for all employees whose 
-- salary is not in the range $10,000 through $15,000 and are in department 30 or 100.
SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    DEPARTMENT_ID
FROM employees
WHERE
    DEPARTMENT_ID IN (30,
                      100)
    AND SALARY NOT BETWEEN 10000 AND 15000
ORDER BY
    DEPARTMENT_ID ASC;


-- 4. Write a query to display the name (first_name, last_name) and hire date for all employees who 
-- were hired in 1987.
SELECT
    FIRST_NAME,
    LAST_NAME,
    HIRE_DATE,
    YEAR(HIRE_DATE) AS 'Hire Year'
FROM employees
WHERE 
    YEAR(HIRE_DATE) LIKE "%1987%";

-- 5. Write a query to display the first_name of all employees who have both "b" and "c" in their 
-- first name.
SELECT
    FIRST_NAME,
    LAST_NAME
FROM employees
WHERE 
    FIRST_NAME LIKE '%b%' 
    AND FIRST_NAME LIKE '%c%'; 

-- 6. Write a query to display the last name, job, and salary for all employees whose job is 
-- that of a Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, 
-- or $15,000.

SELECT
    LAST_NAME,
    JOB_ID,
    SALARY
FROM employees
WHERE JOB_ID in ('IT_PROG', 'SH_CLERK')
and salary not in (4500, 10000, 15000);


-- 7. Write a query to display the last name of employees whose names have exactly 6 characters.
SELECT LAST_NAME, length(last_name) as name_count
from employees
where LAST_NAME like "______";


-- 8. Write a query to display the last name of employees having 'e' as the third character.

SELECT LAST_NAME
from employees
where LAST_NAME like "%__e%"

-- 9. Write a query to display the jobs/designations available in the employees table.

SELECT JOB_ID
from employees
group by JOB_ID

-- -- Selecting distinct values from the job_id column
SELECT DISTINCT job_id
-- Selecting data from the employees table
FROM employees;

-- 10. Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees.

SELECT
    FIRST_NAME,
    LAST_NAME,
    SALARY,
    ROUND(0.15 * SALARY, 2) as PF
FROM employees;


-- 11. Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'.

SELECT *
FROM employees
where LAST_NAME in ('BLAKE', 'SCOTT', 'KING','FORD')

 
    
    