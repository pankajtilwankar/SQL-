----###group by statement
select * from Customers

select country,count(customerID) as number_of_customer
from Customers
group by country

select country,city,count (customerID) as number_of_customer
from Customers
group by country,city
order by number_of_customer desc

--------####having clause

select country,count (customerID) as number_of_customer
from Customers
group by country
having count(customerID) > 5

select country,count (customerID) as number_of_customer
from Customers
group by country
having count(customerID) > 5
order by number_of_customer desc

select top 3 city,count(customerid) as numberofcustomers
from Customers
group by city
order by numberofcustomers desc

select City,count(customerid) as listfrom_uk
from Customers
where country='uk'
group by City
order by listfrom_uk desc

select * from Orders

select ShipVia,count(CustomerID) as number_Customer
from Orders
where ShipCity in ('rio de jenerio','sao paulo') 
      and ShipCountry='brazil'
group by ShipVia

select ShipCity,shipvia,count(CustomerID) as number_Customer,
sum(freight) as Shipping_amount
from orders
where shipcountry='brazil'
and  shipcity in('rio de janerio','sao paulo')
group by ShipCity,shipvia
having count(CustomerID) > 5
order by number_Customer desc,Shipping_amount desc

select ContactTitle,Region,COUNT(customerid) as abc
from Customers
where country='Brazil'
group by ContactTitle,Region
order by abc desc

select * from Employees
select * from Orders

select Employees.LastName,count(Orders.orderid) as number_orders
from orders
inner join employees
on Orders.EmployeeID=Employees.EmployeeID
where lastname in ('peacock','Callahan')
group by LastName
having count(Orders.orderid)>100