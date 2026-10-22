-- =========================================
-- E-Commerce Sales Analysis
-- Level 1: Basic Analysis and Data Quality
-- =========================================

-- Question 1: What is the total number of orders?

SELECT
COUNT(*) AS Number_of_Orders FROM orders ;

-- Question 2: What is the total quantity of products sold?

SELECT
SUM(Quantity)AS Total_Quantity FROM orders ;

-- Question 3: What is the total revenue generated?

SELECT
ROUND(
    SUM(
    (products.unitprice * orders.quantity) * (1-orders.discount)
),2)AS Total_Revenue

FROM orders
JOIN products on orders.productid = products.productid
JOIN payments on orders.orderid = payments.orderid

WHERE orders.status = 'Completed'
    AND payments.paymentstatus = 'Paid';

-- Question 4: What is the average order value (AOV)?

SELECT
ROUND(
    SUM(
    (products.unitprice * orders.quantity) * (1-orders.discount))
    / COUNT(DISTINCT(orders.orderid)),2) AS AVE_Order_Value

FROM orders
JOIN products on orders.productid = products.productid
JOIN payments on orders.orderid = payments.orderid

WHERE orders.status = 'Completed'
    AND payments.paymentstatus = 'Paid';

-- Question 5: What percentage of orders are completed, cancelled, or returned?

SELECT
status,
COUNT(DISTINCT((orders.orderid))) /
(SELECT
COUNT(orderid) FROM orders ) *100 AS Percentage_of_orders
FROM
orders
GROUP BY status
ORDER BY Percentage_of_orders DESC;

-- QUestion 6: Are there duplicate records, missing values, invalid prices, or unusual discounts?

        -- Check for Missing Records
SELECT
    orderid,
    productid,
    COUNT(*) AS Number_of_Records
FROM
orders
GROUP BY
    orderid,
    productid
HAVING COUNT(*) > 1;

        -- Check for missing values
SELECT
    SUM(CASE WHEN orderid IS NULL THEN 1 ELSE 0 END) AS missing_orderid,
    SUM(CASE WHEN customerid IS NULL THEN 1 ELSE 0 END) AS missing_customerid,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS missing_quantity,
    SUM(CASE WHEN orderdate IS NULL THEN 1 ELSE 0 END) AS missing_orderdate,
    SUM(CASE WHEN discount IS NULL THEN 1 ELSE 0 END) AS missing_discount,
    SUM(CASE WHEN paymentmethod IS NULL THEN 1 ELSE 0 END) AS missing_paymentmethod
FROM orders;
    
        -- Check for invalid prices
SELECT *
FROM products
WHERE UnitPrice IS NULL
    OR UnitPrice <= 0;

        -- Check for unusual discounts and invalid quanitites
SELECT *
FROM orders
WHERE
    Discount < 0
    OR Discount >1
    OR Quantity <=0;
