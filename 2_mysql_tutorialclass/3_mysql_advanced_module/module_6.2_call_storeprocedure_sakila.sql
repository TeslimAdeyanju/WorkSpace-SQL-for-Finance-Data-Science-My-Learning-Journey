
-- Database: Classicmodels


/* 1.0 Introduction to Store Procedure  */

-- call the get customer details
call getcustomers();

call GetSimpleCustomers()



/* 2.0 MySQL Stored Procedures: IN Parameters */

-- first example
call GetCustomersByCountry('USA')

call GetCustomersByCountry('UK')

call GetCustomersByCountry('Spain')

-- Second example 
call getproduct('1903 Ford Model A')



/* 3.0 MySQL Stored Procedures: Out Parameters */


-- Example 1
CALL GetTotalOrders(@total_orders);

SELECT @total_orders;


-- Example 2
CALL GetOrderSummary(@order_count, @total_revenue);
SELECT @order_count, @total_revenue;



















