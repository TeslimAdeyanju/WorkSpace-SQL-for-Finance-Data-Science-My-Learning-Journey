-- -- Database: HR_db
-

- 1. Write a query to list the number of jobs available in the employees table.

SELECT
    Job_id,
    COUNT(*) AS number_jobs
FROM employees
GROUP BY
    JOB_ID
ORDER BY
    JOB_ID;


--2. Write a query to get the total salaries payable to employees.
SELECT
    ROUND(SUM(SALARY),2) AS total_salary
FROM employees


-- 3. Write a query to get the minimum salary from employees table
SELECT 
    MIN(salary)
FROM employees


-- 4. Write a query to get the maximum salary of an employee working as a Programmer.
SELECT 
    MAX(salary)
FROM employees
WHERE 
    JOB_ID = "IT_Prog";


--5. Write a query to get the average salary and number of employees working the department 90.
SELECT
    ROUND(AVG(SALARY),2) AS AVERAGE_SALARY,
    COUNT(*) AS 'number of employee'
FROM employees
WHERE
    DEPARTMENT_ID = 90


-- 6. Write a query to get the highest, lowest, sum, and average salary of all employees.
SELECT
    ROUND(MAX(salary), 0) AS highest_salary,
    ROUND(MIN(salary),0) AS lowest_salary,
    ROUND(SUM(salary),0) AS total_salary,
    ROUND(AVG(salary),0) AS average_salary
FROM employees


-- 7. Write a query to get the number of employees with the same job
SELECT 
    job_id, 
    COUNT(*)
FROM employees
GROUP BY 
    JOB_ID


-- 8. Write a query to get the difference between the highest and lowest salaries.
SELECT 
    ROUND(MAX(SALARY) - MIN(SALARY), 0) AS 'Difference Salary'
FROM employees



-- 9. Write a query to find the manager ID and the salary of the lowest-paid employee for that manager.
SELECT
    MANAGER_ID,
    MIN(SALARY) AS 'MINIMUM SALARY'
FROM EMPLOYEES
WHERE
    MANAGER_ID IS NOT NULL
GROUP BY
    MANAGER_ID
ORDER BY
    MIN(SALARY) DESC


-- 10. Write a query to get the department ID and the total salary payable in each department.
SELECT 
    DEPARTMENT_ID, 
    SUM(SALARY) AS Total_Salary
FROM employees
GROUP BY 
    DEPARTMENT_ID


-- 11. Write a query to get the average salary for each job ID excluding programmer.
SELECT 
    ROUND(AVG(SALARY), 0) AS AVERAGE_SALARY
FROM employees
where JOB_ID <> 'IT_PROG'
GROUP BY JOB_ID


-- 12. Write a query to get the total salary, maximum, minimum, average salary of employees (job ID wise), for department ID 90 only.
SELECT
    ROUND(SUM(SALARY),0) AS 'Total Salary',
    ROUND(MAX(salary), 0) AS Maximum,
    ROUND(MIN(Salary),0) AS minimum,
    ROUND(AVG(SALARY), 0) AS 'Average Salary'
FROM employees
WHERE 
    employees.DEPARTMENT_ID = '90'
GROUP BY 
    employees.JOB_ID


-- 13. Write a query to get the job ID and maximum salary of the employees where maximum salary is greater than or equal to $4000.
SELECT 
    employees.JOB_ID, 
    MAX(SALARY) AS 'Maximum Salary'
FROM HR_db.employees
where salary >= 4000
GROUP BY employees.JOB_ID



-- 14. Write a query to get the average salary for all departments employing more than 10 employees.
SELECT 
    round(AVG(salary),0) AS Average_Salary, 
    COUNT(*) AS Count, 
    employees.DEPARTMENT_ID
FROM HR_db.employees
GROUP BY 
    employees.DEPARTMENT_ID
having employees.DEPARTMENT_ID > 10








    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    