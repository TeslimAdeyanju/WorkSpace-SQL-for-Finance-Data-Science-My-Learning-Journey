













/* 3.0 MySQL Stored Procedures: Out Parameters */

--- Return the total number of orders in the system.
CREATE PROCEDURE GetTotalOrders(
    OUT p_total_orders INT
)
BEGIN
    SELECT COUNT(*)
    INTO p_total_orders
    FROM orders;
END;




--- Example with Multiple OUT Parameters
CREATE PROCEDURE
    GetOrderSummary(
                    OUT p_order_count   INT,
                    OUT p_total_revenue DECIMAL(10,2)
                    )
BEGIN
    SELECT
        COUNT(orders),
        round(AVG(revenue),2)
    INTO
        p_order_count,
        p_total_revenue
    FROM (   SELECT
                orderdetails.orderNumber AS orders,
                (priceEach * quantityOrdered) AS Revenue
            FROM orders
            JOIN orderdetails
            USING 
                (ordernumber)
            JOIN products
            USING
                (productCode)
            ORDER BY
                revenue) AS a;
 
END;





















