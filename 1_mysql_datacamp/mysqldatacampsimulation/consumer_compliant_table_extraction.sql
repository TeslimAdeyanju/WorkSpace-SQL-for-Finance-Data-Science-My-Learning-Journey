
-- confirm the level of the unique columns 
select *
from consumer_complaint;

-- confirm the count with the unique 
select count(*)
from ( select distinct * from consumer_complaint) as list;

--create a sub table from the main table 
create Table customers as 
select product_name,
       company,
       state_name
from consumer_complaint;

--calling the newly created sub table, and count the number of rows: 65499
select count(*) 
from customers

--remove duplicate from the customers 
create table work_scope as 
select distinct *
from customers

--check the content of the work scope after remove of duplactes: 14034
select count (*)
from work_scope


--
select * 
from work_scope



