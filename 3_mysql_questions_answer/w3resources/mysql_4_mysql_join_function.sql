    /*-- -- Database: HR_db*/
    /*-- 1. Write a MySQL query to find the addresses (location_id, street_address, city,state_province,*/
    /*-- country_name) of all the departments.*/
   Hint : USE NATURAL JOIN.
   SELECT
          LOCATION_ID,
          STREET_ADDRESS,
          CITY,
          STATE_PROVINCE,
          COUNTRY_NAME
   FROM   HR_db.locations
   JOIN   HR_db.countries
   USING
          (COUNTRY_ID)
          
          
    /*-- 2. Write a MySQL query to find the name (first_name, last name), department ID and name of
      -- all*/
    /*-- the employees.*/
   SELECT
          FIRST_NAME,
          LAST_NAME
   FROM   HR_db.employees
   JOIN   HR_db.departments
   USING
          (DEPARTMENT_ID)
          
          
    /*-- 3. Write a MySQL query to find the name (first_name, last_name), job, department ID and name -- of*/
    /*-- the employees who works in London.*/
   SELECT
          FIRST_NAME,
          LAST_NAME,
          JOB_ID,
          departments.DEPARTMENT_ID
   FROM   HR_db.employees
   JOIN   HR_db.departments
   USING
          (DEPARTMENT_ID)
   JOIN   HR_db.locations
   WHERE  CITY = 'London'
   
   
   -- 4. Write a MySQL query to find the employee id, name (last_name) along with their manager_id and name (last_name).
     SELECT 
          e.EMPLOYEE_ID, 
          e.LAST_NAME, 
          m.manager_id, 
          m.last_name
   FROM   HR_db.employees AS e
   JOIN   employees AS m using(MANAGER_ID)
   WHERE  m.MANAGER_ID IS NOT NULL
   
   
   
   -- 5. Write a MySQL query to find the name (first_name, last_name) and hire date of the employees who was hired after 'Jones'.
   select FIRST_NAME, employees.LAST_NAME
   from employees
   where employees.FIRST_NAME like '%Donald%' or employees.FIRST_NAME like '%Donald%'
   
   
   
   -- 6. Write a MySQL query to get the department name and number of employees in the department.
   
   
   select DEPARTMENT_NAME, COUNT(*) as dept_count
   from HR_db.employees
   join HR_db.departments on employees.DEPARTMENT_ID = departments.DEPARTMENT_ID
   GROUP by DEPARTMENT_NAME
   order by dept_count
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   