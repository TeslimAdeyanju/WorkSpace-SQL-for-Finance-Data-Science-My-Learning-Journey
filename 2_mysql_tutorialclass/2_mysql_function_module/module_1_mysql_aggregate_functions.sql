
--MySQL JSON_OBJECTAGG() Function

select city,
       JSON_OBJECTAGG(Country, state) as location
from offices
group by city;

--MySQL JSON_ARRAYAGG() Function
select 
      CONCAT_WS(' ', firstName, lastName) as salesemployee,
      JSON_ARRAYAGG(customerNUmber) as customerNumbers
from customers as c 
inner join employees as e on c.salesRepEmployeeNumber = e.employeeNumber  
group by salesRepEmployeeNumber 
order by salesemployee;

--MySQL JSON_ARRAYAGG() Function

WITH detail as (
Select 
p.productname, o.ordernumber, d.customernumber, c.customername
from 
orderdetails as o
right join products as p on o.productcode = p.productcode
inner join orders as d on o.ordernumber = d.ordernumber
inner join customers as c on d.customernumber= c.customernumber

)

select customername, 
       JSON_ARRAYAGG(productname)
from detail
group by customername










