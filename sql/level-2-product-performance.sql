-- ============================================
-- E-Commerce Sales Analysis
-- Level 2: Product Performance and Sales Trends
-- SQL dialect: MySQL
-- ============================================

-- Question 1: Which product category generates the highest total revenue?
SELECT
    products.category,
    ROUND(
        SUM(
            (products.unitprice * orders.quantity) * (1 - orders.discount)
    ),2) AS Revenue
    
FROM orders
JOIN products on orders.productid = products.productid
JOIN payments on orders.orderid = payments.orderid

WHERE 
    orders.status = 'Completed'
    AND payments.paymentstatus = 'Paid'
GROUP BY products.category
ORDER BY Revenue DESC;

-- Question 2: Which category sells the highest number of units?

SELECT
    products.category,
    SUM((orders.quantity)) AS Units_Sold

FROM orders
JOIN products on orders.productid = products.productid
JOIN payments on orders.orderid = payments.orderid
GROUP BY products.category
ORDER BY Units_Sold DESC;

-- Question 3: Which individual products generate the most revenue?
SELECT
    products.productid,
    products.productname,
    products.category,
    ROUND(
        SUM(
            (products.unitprice * orders.quantity) * (1 - orders.discount)
    ),2) AS Revenue
    
FROM orders
JOIN products on orders.productid = products.productid
JOIN payments on orders.orderid = payments.orderid

WHERE 
    orders.status = 'Completed'
    AND payments.paymentstatus = 'Paid'
GROUP BY 
    products.productid,
    products.productname,
    products.category
ORDER BY Revenue DESC;

-- Question 4: Which products sell many units but generate relatively little revenue?
SELECT
    products.productid,
    products.productname,
    products.category,
    SUM((orders.quantity)) AS Units_Sold,
    ROUND(
        SUM(
            (products.unitprice * orders.quantity) * (1 - orders.discount)
    ),2) AS Revenue,
    ROUND(
        SUM(
            orders.quantity
            * products.unitprice
            * (1 - orders.discount)
        ) / SUM(orders.quantity),
        2
    ) AS Revenue_Per_Unit
    
FROM orders
JOIN products on orders.productid = products.productid
JOIN payments on orders.orderid = payments.orderid

WHERE 
    orders.status = 'Completed'
    AND payments.paymentstatus = 'Paid'
GROUP BY 
    products.productid,
    products.productname,
    products.category
HAVING SUM(orders.quantity) > 0
ORDER BY 
    units_sold DESC,
    Revenue_per_unit ASC;


-- Question 5: Which products have the highest average selling price?

SELECT
    products.productid,
    products.productname,
    ROUND(
        AVG(
            products.unitprice  * (1 - orders.discount)
    ),2)AS Avg_Price

FROM orders
JOIN products on orders.productid = products.productid
JOIN payments on orders.orderid = payments.orderid

WHERE 
    orders.status = 'Completed'
    AND payments.paymentstatus = 'Paid'
GROUP BY 
    products.productid,
    products.productname
ORDER BY avg_price DESC;

-- Question 6: Which months have the highest and lowest sales?
SELECT
    MONTH(orders.orderdate) AS Sales_Month,
    ROUND(
        SUM(
            orders.quantity * products.unitprice * (1 - orders.discount)
        ), 2
    ) AS Total_Revenue
FROM orders
JOIN products
    ON orders.productid = products.productid
JOIN payments
    ON orders.orderid = payments.orderid
WHERE orders.status = 'Completed'
  AND payments.paymentstatus = 'Paid'
GROUP BY MONTH(orders.orderdate)
ORDER BY Total_Revenue DESC;

-- Question 7: Is revenue growing or declining month over month?

WITH Monthly_Sales AS (
    SELECT
        DATE_FORMAT(orders.orderdate, '%Y-%m')
            AS Sales_Month,
        SUM(
            orders.quantity * products.unitprice * (1 - orders.discount)
        ) AS Total_Revenue
    FROM orders
    JOIN products
        ON orders.productid = products.productid
    JOIN payments
        ON orders.orderid = payments.orderid
    WHERE orders.status = 'Completed'
      AND payments.paymentstatus = 'Paid'
    GROUP BY DATE_FORMAT(orders.orderdate, '%Y-%m')
),

Revenue_Comparison AS (
    SELECT
        Sales_Month,
        Total_Revenue,
        LAG(Total_Revenue) OVER (
            ORDER BY Sales_Month
        ) AS Previous_Month_Revenue
    FROM Monthly_Sales
)

SELECT
    Sales_Month,
    ROUND(Total_Revenue, 2) AS Total_Revenue,
    ROUND(Previous_Month_Revenue, 2)
        AS Previous_Month_Revenue,
    ROUND(
        Total_Revenue - Previous_Month_Revenue, 2
    ) AS Revenue_Change,
    ROUND(
        (Total_Revenue - Previous_Month_Revenue)
        / NULLIF(Previous_Month_Revenue, 0) * 100,
        2
    ) AS Growth_Percentage
FROM Revenue_Comparison
ORDER BY Sales_Month;

-- Question 8 : Which categories contribute the largest percentage of total revenue?
WITH Category_Sales AS (
    SELECT
        products.category,
        SUM(
            orders.quantity * products.unitprice * (1 - orders.discount)
        ) AS Total_Revenue

    FROM orders
    JOIN products
        ON orders.productid = products.productid
    JOIN payments
        ON orders.orderid = payments.orderid
        
    WHERE orders.status = 'Completed'
      AND payments.paymentstatus = 'Paid'
    GROUP BY products.category
)

SELECT
    category,
    ROUND(Total_Revenue, 2) AS Total_Revenue,
    ROUND(
        Total_Revenue * 100.0
        / SUM(Total_Revenue) OVER (),
        2
    ) AS Revenue_Percentage
FROM Category_Sales
ORDER BY Revenue_Percentage DESC;




































