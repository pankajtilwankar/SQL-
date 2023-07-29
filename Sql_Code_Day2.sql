--## null values
--this is null METHOD

select * from Customers

select * from Customers
where Region is NULL

select * from Customers
where Fax is null

select * from Customers
where Region is null and Fax is null
 
--this is not null operator
SELECT CompanyName, ContactName, Region
FROM Customers
WHERE Region IS NOT NULL

SELECT ContactName,Region,Fax
FROM Customers
WHERE Region IS not NULL and Fax is  null

--## sql update statement

--update table
select * from Customers

select * into Customers2 from Customers

select * from Customers2

UPDATE Customers2
SET ContactName='Irfan'
WHERE CustomerID='ALFKI'

select * from Customers2

--update mutiple records

UPDATE Customers2
SET CompanyName = 'ANALYTICS', City= 'Mumbai', Country='India'
WHERE ContactName='Irfan'

select * from Customers2

--update warning
UPDATE Customers2
SET ContactName='Irfan'

select * from Customers2

---## delete statement

-- delete one row 
select * from Customers2

DELETE FROM Customers2 
WHERE CustomerID = 'ALFKI'

select * from Customers2

--- delete one column

alter table customers2
drop column Region

select * from customers2 

--delete all records

DELETE FROM Customers2

select * from Customers2 

--- delete entire table 
drop table Customers2

select * from Customers2 

--## top,limit or rownum clause

SELECT * FROM Customers

SELECT TOP 7 * FROM Customers

---top recent example
SELECT TOP 50 City  FROM Customers

--add a where clause
SELECT TOP 3 * FROM Customers
WHERE Country='Germany'

--## min() and max()

---min() 
select * from Products

SELECT MIN(UnitPrice) FROM Products 

SELECT MIN(UnitPrice) AS SmallestPrice
FROM Products

--max()
SELECT MAX(UnitPrice) AS HighestPrice
FROM Products

--## count(),avg() and sum functions

---count()
select * from Products

SELECT COUNT(UnitPrice) as Total_Count
FROM Products

--avg()
SELECT AVG(UnitPrice) as Avg_Unit_Price
FROM Products

--sum()
SELECT SUM(UnitPrice) AS Sums_Unit_Price 
FROM Products

--## like operator
SELECT * FROM Customers

SELECT * FROM Customers
WHERE ContactName LIKE 'a%' --start with a

SELECT * FROM Customers
WHERE ContactName LIKE '%a' --end with a

SELECT * FROM Customers
WHERE ContactName LIKE '%or%' -- anywhere in ContactName

--CustomerName that have "r" in the second position:
SELECT * FROM Customers
WHERE ContactName LIKE '_r%'

--CustomerName that starts with "a" and are at least 3 characters in length:
SELECT * FROM Customers
WHERE ContactName LIKE 'a__%'

--customers with a ContactName that starts with "a" and ends with "o"
SELECT * FROM Customers
WHERE ContactName LIKE 'a%o'

--CustomerName that does NOT start with "a":
SELECT * FROM Customers
WHERE ContactName NOT LIKE 'a%'

SELECT * FROM Customers
WHERE City LIKE 'ber%'

SELECT * FROM Customers
WHERE City LIKE '%es%'

SELECT * FROM Customers
WHERE City LIKE '_ondon'

SELECT * FROM Customers
WHERE City LIKE 'L_n_on'

-----## IN OPERATOR
SELECT * FROM Customers
WHERE Country IN ('Germany', 'France', 'UK')

SELECT * FROM Customers
WHERE Country NOT IN ('Germany', 'France', 'UK')

SELECT * FROM Customers
WHERE Country IN (SELECT DISTINCT Country FROM Suppliers)

---## BETWEEN OPERATOR

SELECT * FROM Products
WHERE UnitPrice BETWEEN 50 AND 60

--NOT BETWEEN 
SELECT * FROM Products
WHERE UnitPrice NOT BETWEEN 10 AND 20

---BETWEEN WITH IN 
SELECT * FROM Products
WHERE UnitPrice BETWEEN 10 AND 20
AND NOT CategoryID IN  (1,2,3)
order by UnitPrice

--BETWEEN DATES
SELECT * FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31'

---ALIAS FOR COLUMNS
SELECT CustomerID AS ID, ContactName AS Customer 
FROM Customers

SELECT CustomerID AS ID, ContactName AS Contact_Person
FROM Customers

SELECT CustomerID AS ID, ContactName AS [Contact Person] 
FROM Customers

SELECT CUSTOMERID AS id,ContactName as Customer_PERSON,Country
into new_Customers
from Customers

select * from new_Customers

