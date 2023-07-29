----- Creating Database & Table --------------
create database Test2	

drop database Test2

use Test2

create Table Demo   --Table / Dataset 
(First_Name Varchar(255), --Alphabet
Gender nvarchar(255), --Alphabet & Number 
Age Int,  --- Without Decimal number = 26 / 27
Salary Float, --- With Decimal number = 26.5 / 27.10
DOB date) -- Date 

Select * From Demo

insert into Demo values  ('Irfan','M','27','2000.0','1992-06-26')
insert into Demo values  ('Nikita','F','31','1500.5','1996-01-06')
insert into Demo values  ('Deeksha','F','28','2000.4','1997-02-20')
insert into Demo values  ('Hardik','M','37','6500.8','1992-03-26')
insert into Demo values  ('Komal','F','21','8500.34','1996-04-06')
insert into Demo values  ('Imran','M','24','4500.5','1997-07-20')
insert into Demo values  ('Rohini','F','22','10000.456','1997-01-20')
insert into Demo values  ('chetna','22','1997-01-20')

Select * From Demo

drop table Demo

use Northwind

---  important of ;go -----------
SELECT * FROM Orders
WHERE Orderi=10248;  --- wrong & process stop
go

SELECT * FROM Customers  --- correct
WHERE Country='UK';
go


---- Sub Query --------------
-- it required 2 table for analysis
-- first table output will be input of second table 

select * from Orders
where Customerid in (select distinct CustomerID 
					 from Customers
					 where Country='Uk')
order by Customerid

--q1
-- Orderid wise total Bill amount for poland country 

select * from [Order Details]					 
where OrderID = 10374

select OrderID,SUM(UnitPrice*Quantity) as Total_cost , 
       COUNT(OrderID) as No_Product_Purchase
into Poland_Data
from [Order Details]
where OrderID in (select distinct OrderID 
					 from Orders
					 where ShipCountry='Poland')
group by OrderID

select * From Poland_Data

select * from Orders

alter table Orders
add Delivery_Day Float

UPDATE Orders
SET Delivery_Day = DATEDIFF(d,orderDate,ShippedDate)

select *  from Orders
select * from Poland_Data

alter table Poland_Data
add Shipping_Cost float,Product_Cost float , Delivery_days float

select * From Poland_Data

select * from Orders

UPDATE Poland_Data  -- Table / Dataset
SET Shipping_Cost = Orders.Freight, --- Column in Poland_data
Delivery_days = Orders.Delivery_day --- Column in Poland_data
from 
Orders inner join Poland_Data
on

Poland_Data.OrderID = Orders.OrderID

select * From Poland_Data

select OrderID,Freight,Delivery_day from Orders
where OrderID=10374

select * From Poland_Data

UPDATE Poland_Data
SET Product_Cost = Total_cost - Shipping_Cost 
WHERE OrderID IN (SELECT OrderID FROM Poland_Data
				WHERE Total_cost > 300 );

select * From Poland_Data

UPDATE Poland_Data
SET Product_Cost = Total_cost  
where Product_Cost  is null

select * From Poland_Data

delete from Poland_Data
where OrderID in (select OrderID 
					 from Orders
					 where Freight <= 10)

select * from Poland_Data

drop table Poland_Data 

SELECT * FROM [Order Details]

SELECT OrderID, Quantity,
CASE --IF
    WHEN Quantity > 30 THEN 'High'
    WHEN Quantity = 30 THEN 'Equal'
    ELSE 'Low'
END AS QuantityText
into backup1  ----saving data
FROM [Order Details] -- Main File data

select * from backup1

----- Change data type ----
alter table Superstore
alter column Quantity int not null

alter table Superstore
alter column Discount Float not null

alter table Superstore
alter column Profit float not null

---## ANY AND ALL OPERATORS
---ANY
select * from  [Order Details]
where UnitPrice>250

-- ANY = or 
SELECT *
FROM Products
WHERE ProductID = ANY (SELECT Distinct ProductID 
FROM [Order Details] WHERE UnitPrice>250)

SELECT *
FROM Products
WHERE ProductID = ANY (SELECT Distinct ProductID 
FROM [Order Details] WHERE Quantity > 110)

--ALL = AND
SELECT *
FROM Products
WHERE ProductID = ALL (SELECT Distinct ProductID 
FROM [Order Details] WHERE Quantity > 110)
