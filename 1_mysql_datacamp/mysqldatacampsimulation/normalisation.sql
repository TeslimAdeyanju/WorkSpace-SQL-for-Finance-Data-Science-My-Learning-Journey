
--check the content of the table
select * 
from transactions

--3455

select count(*)
from transactions

--create a temporary table name "tmp" that comprises of 4 columns 

CREATE TABLE 
    tmp AS
SELECT 
    customerid, 
    name, 
    surname, 
    shipping_state,
    loyalty_discount
     
FROM 
    transactions  
    
--check the content of tmp for duplicates 

select *
from tmp

--create a actual tables to remove duplicates 

create table customers as 
select distinct *
from tmp


--check the content of the customers tables (2ns normal form)
select *
from customers


--remove customer specific columns 
-- But leave the customerid 

alter table transactions
drop column name,
drop column surname,
drop column shipping_state,
drop column loyalty_discount

--check the transactions table 
select *
from transactions


--drop the tmp table
drop table tmp 

--prepare a thrid normal form 








    
       