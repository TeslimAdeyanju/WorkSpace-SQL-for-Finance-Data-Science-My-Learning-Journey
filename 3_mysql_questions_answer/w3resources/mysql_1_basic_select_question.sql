
/*       */


-- Write a query to display the names (first_name, last_name) using alias name "First Name", "Last Name"

SELECT FIRST_NAME, last_name
from employees;

-- 2. Write a query to get unique department ID from employee table.
select DISTINCT DEPARTMENT_ID
from employees;

-- 3. Write a query to get all employee details from the employee table order by first name, descending.
select *
from employees
ORDER by FIRST_NAME DESC;


-- 4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary).
SELECT 
     FIRST_NAME, 
     last_name, 
     round(salary,0),
     round(salary * .15, 0) as '15%_salary'
from employees;

-- 5. Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary.
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, round(SALARY, 0) as salary
FROM EMPLOYEES
ORDER by salary ASC;


-- 6. Write a query to get the total salaries payable to employees.
select sum(SALARY)
from(
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
from employees) as a;


-- 7. Write a query to get the maximum and minimum salary from employees table.
Select max(salary), min(salary)
from employees;

-- 8. Write a query to get the average salary and number of employees in the employees table.
select round(AVG(salary),2) as average_salary, count(*) as count
from employees;


-- 9. Write a query to get the number of employees working with the company.
SELECT DISTINCT count(EMPLOYEE_ID)
from employees;



-- 10. Write a query to get the number of jobs available in the employees table.
select count(distinct JOB_Id)
from employees;



-- 11. Write a query get all first name from employees table in upper case.

SELECT UPPER(first_name)
from employees;

-- 12. Write a query to get the first 3 characters of first name from employees table.
SELECT LEFT(FIRST_NAME, 3) as name
FROM employees


-- 13. Write a query to calculate 171*214+625.

select format(171 * 214 + 625, 2) as result;


--14. Write a query to get the names (for example Ellen Abel, Sundar Ande etc.) of all the employees from employees table.
select CONCAT(FIRST_NAME, " ",LAST_NAME) as 'Employee Name'
from employees


-- 15. Write a query to get first name from employees table after removing white spaces from both side.
select trim(first_name)
from employees;


-- 16. Write a query to get the length of the employee names (first_name, last_name) from employees table.
select CONCAT(first_name, " ", last_name) as full_name,
LENGTH (first_name) + length(last_name) as count
from employees;


-- 17. Write a query to check if the first_name fields of the employees table contains numbers.
select *
from employees
where FIRST_NAME REGEXP '[0-9]';


-- 18. Write a query to select first 10 records from a table.
SELECT *
from employees
limit 10


-- 19. Write a query to get monthly salary (round 2 decimal places) of each and every employee
select FIRST_NAME, round(SALARY/12, 2) monthly_salary
from employees










