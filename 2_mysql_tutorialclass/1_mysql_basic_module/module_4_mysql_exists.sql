-- Databe: classicmodel 

select orderNumber, priceEach, quantityOrdered
from orderdetails
where EXISTS( select 1 from orders where orders.orderNumber = orderdetails.orderNumber)