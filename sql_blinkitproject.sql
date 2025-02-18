create database blinkitproject;
use blinkitproject;

-- 1.Retrieve all customer details from a delhi city.
SELECT * FROM customers WHERE City = 'Delhi';

-- 2.Find the total number of orders placed.
SELECT COUNT(OrderID) AS TotalOrders FROM orders;

-- 3.List all orders placed within the last month.
SELECT * 
FROM orders 
WHERE OrderDateTime >= DATE_sub(now(), interval 1 month);

-- 4.Find the average order value.
SELECT AVG(TotalAmount) AS AvgOrderValue FROM orders;

-- 5.Retrieve the highest value order.
SELECT * 
FROM orders 
WHERE TotalAmount = (SELECT MAX(TotalAmount) FROM orders);

-- 6.Find the top 5 most sold products.
SELECT ProductName, SUM(Quantity) AS TotalQuantitySold 
FROM orderdetails 
GROUP BY ProductName 
ORDER BY TotalQuantitySold DESC 
LIMIT 5;

-- 7.Retrieve the product with the highest revenue.
SELECT ProductName, SUM(Quantity * PricePerUnit) AS TotalRevenue 
FROM orderdetails 
GROUP BY ProductName 
ORDER BY TotalRevenue DESC 
LIMIT 1;

-- 8.Find the customer who has spent the most money.
SELECT c.CustomerID, c.Name, SUM(o.TotalAmount) AS TotalSpent 
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC
LIMIT 1;

-- 9.Retrieve customers who have placed more than 5 orders.
SELECT c.CustomerID, c.Name, COUNT(o.OrderID) AS TotalOrders 
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(o.OrderID) > 5;

-- 10.List the top 5 customers based on the number of orders placed.
SELECT c.CustomerID, c.Name, COUNT(o.OrderID) AS TotalOrders 
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalOrders DESC
LIMIT 5;

-- 11.Find the total revenue generated by each city.
SELECT City, SUM(o.TotalAmount) AS TotalRevenue 
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY City;

-- 12.Identify the city with the highest number of orders.
SELECT City, COUNT(o.OrderID) AS TotalOrders 
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY City
ORDER BY TotalOrders DESC
LIMIT 1;

-- 13.Find the busiest day for orders.
SELECT DATE(OrderDateTime) AS OrderDate, COUNT(OrderID) AS TotalOrders 
FROM orders 
GROUP BY OrderDate 
ORDER BY TotalOrders DESC 
LIMIT 1;

-- 14.Retrieve orders placed during weekends.
SELECT * 
FROM orders 
WHERE DAYOFWEEK(OrderDateTime) IN (1, 7);

-- 15.Find the month with the highest sales.
SELECT DATE_FORMAT(OrderDateTime, '%Y-%m') AS Month, SUM(TotalAmount) AS TotalSales 
FROM orders 
GROUP BY Month 
ORDER BY TotalSales DESC 
LIMIT 1;

-- 16.Find customers who have only ordered once.
SELECT c.CustomerID, c.Name 
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
HAVING COUNT(o.OrderID) = 1;

-- 17.List all orders placed after 6 PM.
SELECT * 
FROM orders 
WHERE HOUR(OrderDateTime) >= 18;

-- 18.Determine the total revenue generated by each product.
SELECT ProductName, SUM(Quantity * PricePerUnit) AS TotalRevenue 
FROM orderdetails 
GROUP BY ProductName;

-- 19.Find the total number of customers from each city.
SELECT City, COUNT(*) AS TotalCustomers 
FROM customers 
GROUP BY City;

-- 20.Identify customers who have purchased more than 10 different products.
SELECT o.CustomerID, c.Name, COUNT(DISTINCT od.ProductName) AS UniqueProductsBought 
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
JOIN orderdetails od ON o.OrderID = od.OrderID
GROUP BY o.CustomerID, c.Name
HAVING UniqueProductsBought > 10;