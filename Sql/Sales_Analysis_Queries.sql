CREATE DATABASE SalesAnalysisDB;
USE SalesAnalysisDB;

 -- Total Rows
SELECT COUNT(*) AS TotalRows
FROM SalesData;

--Null Values
SELECT * FROM SalesData
WHERE Sales IS NULL
OR Profit IS NULL
OR Customer_ID IS NULL;

--Delete null values
DELETE FROM SalesData
WHERE Profit IS NULL;

--Recheck Total Rows
SELECT COUNT(*) AS TotalRows
FROM SalesData;

--Duplicate Orders
SELECT Order_ID, COUNT(*) AS CountRows
FROM SalesData
GROUP BY Order_ID
HAVING COUNT(*)>1;


--Check Date Range
SELECT MIN(Order_Date) AS StartDate,
       MAX(Order_Date) AS EndDate
FROM SalesData

--Total Sales
SELECT SUM(Sales) AS TotalSales
FROM SalesData;

--Total Profit
SELECT SUM(Profit) AS TotalProfit
FROM SalesData;

--Total Orders
SELECT COUNT(DISTINCT Order_ID) AS TotalOrders
FROM SalesData;

--Total Customers
SELECT COUNT(DISTINCT Customer_ID) AS TotalCusrtomers
FROM SalesData;

--Sales By Category
SELECT Category,
SUM(Sales) AS TotalSales
FROM SalesData
GROUP BY Category
ORDER BY TotalSales DESC;

--Profit By Category
SELECT Category,
SUM(Profit) AS TotalProfit
FROM SalesData
GROUP BY Category
ORDER BY TotalProfit DESC

--Top 10 Customers
SELECT TOP 10 Customer_Name,
SUM(Sales) AS Sales
FROM SalesData
GROUP BY Customer_Name
ORDER BY Sales DESC

--Top 10 Products
SELECT TOP 10 Product_Name,
SUM(Quantity) AS QuantitySold
FROM SalesData
GROUP BY Product_Name
ORDER BY QuantitySold DESC;

--Sales By Region
SELECT Region,
SUM(Sales) AS Sales
FROM SalesData
GROUP BY Region

--Profit BY Region
SELECT Region,
SUM(Profit) AS Profit
FROM SalesData
GROUP BY Region

--Profit by State
SELECT State,
SUM(Profit) AS Profit
FROM SalesData
GROUP BY State
ORDER BY Profit DESC;

--Sales by Segment
SELECT Segment,
SUM(Sales) AS TotalSales
FROM SalesData
GROUP BY Segment
ORDER BY TotalSales DESC

--Sales by Shio Mode
SELECT Ship_Mode,
SUM(Sales) AS TotalSales
FROM SalesData
GROUP BY Ship_Mode
ORDER BY TotalSales DESC

--Monthly Sales Trend
SELECT 
YEAR(Order_Date) AS OrderYear,
MONTH(Order_Date) AS OrderMonth,
SUM(Sales) AS TotalSales
FROM SalesData
GROUP BY Year(Order_Date),MONTH(order_Date)
ORDER BY OrderYear, OrderMonth

--Discount vs Profit Analysis
SELECT ROUND(Discount,2) AS Discount,
ROUND(SUM(profit),2) AS TotalProfit,
ROUND(SUM(Sales),2) AS TotalSales,
COUNT(*) AS TotalOrders
FROM SalesData
GROUP by ROUND(Discount,2)
ORDER BY ROUND(Discount,2);


--Category View
CREATE VIEW vw_CategorySales AS
SELECT Category,
SUM(Sales) AS TotalSales,
SUM(Profit) AS TotalProfit
FROM SalesData
GROUP BY Category;


--Region View
CREATE VIEW vw_RegionSales AS
SELECT Region,
SUM(Sales) AS TotalSales,
SUM(Profit) AS TotalProfit
FROM SalesData
GROUP BY Region;


--Customer View
CREATE VIEW vw_CustomerSales AS
SELECT Customer_Name,
SUM(Sales) AS TotalSales,
SUM(profit) AS TotalProfit
FROM SalesData
GROUP BY Customer_Name;


--Monthly Sales View
CREATE VIEW vw_MonthlySales AS
SELECT 
YEAR(Order_Date) AS OrderYear,
MONTH(Order_Date) AS OrderMonth,
SUM(Sales) AS TotalSales,
SUM(profit) AS TotalProfit
FROM SalesData
GROUP BY Year(Order_Date),MONTH(order_Date)

SELECT * FROM vw_CategorySales;
SELECT * FROM vw_MonthlySales;

