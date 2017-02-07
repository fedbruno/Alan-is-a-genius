/*
Federica Bruno
February 7, 2017
Alan Labouseur
308 Database Management
Lab 3: Getting Started with SQL Queries 
*/ 


SELECT OrdNumber, totalUSD
FROM Orders;

SELECT name, city
FROM Agents
WHERE name = 'Smith';

SELECT pid, name, priceUSD
FROM Products
WHERE quantity > 200100;

SELECT name, city
FROM Customers
Where city = 'Duluth';

SELECT name 
FROM Agents as a
WHERE a.city != 'New York' 
AND a.city != 'Duluth';

SELECT * 
FROM Products as p
WHERE p.city != 'Dallas' 
OR p.city != 'Duluth'
AND p.priceUSD > 1;

SELECT *
FROM Orders 
WHERE month = 'Jan'
OR month = 'Feb';

SELECT *
FROM Orders 
WHERE month = 'Feb' 
AND totalUSD >= 600;

SELECT *
FROM Orders
WHERE cid = 'C005';