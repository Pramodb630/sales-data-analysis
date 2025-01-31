-- 1. Total Sales Revenue
SELECT SUM(TransactionAmount) AS Total_Revenue
FROM sales_data;

-- 2. Average Transaction Amount
SELECT AVG(TransactionAmount) AS Avg_Transaction_Value
FROM sales_data;

-- 3. Top 5 Cities by Revenue
SELECT City, SUM(TransactionAmount) AS Total_Sales
FROM sales_data
GROUP BY City
ORDER BY Total_Sales DESC
LIMIT 5;

-- 4. Monthly Sales Trend
SELECT DATE_FORMAT(TransactionDate, '%Y-%m') AS Month, SUM(TransactionAmount) AS Monthly_Sales
FROM sales_data
GROUP BY Month
ORDER BY Month;

-- 5. Top 5 Most Sold Products
SELECT ProductName, SUM(Quantity) AS Total_Quantity_Sold
FROM sales_data
GROUP BY ProductName
ORDER BY Total_Quantity_Sold DESC
LIMIT 5;

-- 6. Customer Segmentation by Age
SELECT CASE
    WHEN CustomerAge BETWEEN 18 AND 25 THEN '18-25'
    WHEN CustomerAge BETWEEN 26 AND 35 THEN '26-35'
    WHEN CustomerAge BETWEEN 36 AND 50 THEN '36-50'
    ELSE '51+'
END AS Age_Group, COUNT(*) AS Customer_Count
FROM sales_data
WHERE CustomerAge IS NOT NULL
GROUP BY Age_Group;

-- 7. Preferred Payment Methods
SELECT PaymentMethod, COUNT(*) AS Usage_Count
FROM sales_data
WHERE PaymentMethod IS NOT NULL
GROUP BY PaymentMethod
ORDER BY Usage_Count DESC;

-- 8. Delivery Time Analysis
SELECT ROUND(AVG(DeliveryTimeDays), 2) AS Avg_Delivery_Days
FROM sales_data;

-- 9. Return Rate per Product
SELECT ProductName, 
       COUNT(*) AS Total_Sales,
       SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) AS Total_Returns,
       ROUND((SUM(CASE WHEN Returned = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(*), 2) AS Return_Percentage
FROM sales_data
GROUP BY ProductName
ORDER BY Return_Percentage DESC
LIMIT 5; 
