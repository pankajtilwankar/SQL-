

use Northwind
select * from Northwind.dbo.customers
select * from customers
select city from customers
select city, contactname from customers
select city,region,country from customers

select country from customers
select distinct country from customers
select country,city from customers
select distinct country,city from customers

select * from customers
where country = 'mexico'
select * from customers
where customerid='alfki'
select * from customers
where city='london'

select * from Products
select * from products
where productname='chai'
select* from products
where unitprice=18
select* from products
where unitprice > 55
select * from products
where unitprice>=55
select * from products
where unitprice < 55
select * from products
where unitprice <= 55
 select * from products
 where unitprice <> 18
 select * from products
 where unitprice between 50 and 60


 select * from customers
 where city= 'paris'
 select * from customers
 where city in ('paris','london','berlin')
 select * from customers
 where country in ( 'usa','uk')
 select * from customers
 where CustomerID in ( 'bolid','alfki','arout')

 select distinct city from customers
 select * from customers
 where country='germany' and city='berlin'
 select* from customers
 where country='uk'and city='london'

 select * from customers
 where city='berlin' or city= 'Aachen'
 select * from customers
 where country='germany' or country='sapin'

 select * from customers
 where not country='germany'
 select * from customers
 where not country in ('germany','spain','usa','uk')

 select * from customers
 where not country='germany' and  not country='usa'
 select * from customers
 where not country in ('germany', 'usa')
 select * from customers
 where country='germany'and not ( city='berlin' or city='Aachen')
 select * from customers
 where country='usa' and not (region= or region= Wa)

 select * from customers
 where not country in ('spain','uk','usa')

 select * from customers
 where country='spain' and not city in ('madrid','sevilla')

 select * from customers
 where country= 'sapin' and not city= 'barslona'

 select * from customers
 order by country
 select * from customers
 order by country desc
 select* from products
 order by unitprice desc
 select country,city from customers
 order by country,city
 select country,city from customers
 order by country asc,city desc

 ## null vaules( 15th oct)
 this is null method

 selcet * from customers

 select * from customers
 where region is null

 select * from customers
 where fax is null

 select * from customers
 where region is null and fax is null

 this is not null operator
 select companyname, contactname,region
 from customers
 where region is not null

 select contactname,region,fax
 from customers
 where region is not null and fax is null

 -- ## sql update statement
 update table

 select * from customers

 select * into customers2 from customers

 select * from customers2

 update customers2

 update customers2
 updating single records

 update customers2
 set CompanyName ='irfan'
 where CustomerID ='alfki'

 select * from customers2

 update multiple records

 update customers2
 set companyname='analytics',city='mumbai',country='india'
 where contactname='irfan'

 select * from customers2

 update waring
 update customers2
 set contactname='irfan'

 ## delete statement

 delete one row

 select * from customers2

 delete from customers2
 where customerid='alfki'
 select * from customers2

 --delete one column

 alter table customers2
 drop colunm 'region'

 select * from customers2

 ---delete all records/row

 delete from customers2

 select * from customers2

 ----delete entrie table

 drop table customers2

 select* from customers2

 ### top, limit or rownum clause

 select * from customers

 select city from customers

 select top 3 * from customers

 --- top recent exmple
 select top 50 city from customers
 where country= 'germany'


 --## min() and max()
 ---min()
 select * from products

 select min(unitprice) from products

 select min(unitprice) as lowestprice from products

 ---max()
 select max(unitprice)as highestprice from products

 --##count(),avg() and sum functions

 ---count()
 select * from products

 select count (unitprice) as total from products

 ---sum()
 select sum (unitprice) as sums_unit_price from products

 ---avg()
 select avg(unitprice) as avg_unit_price from products

-- ## like operator (16 oct)
select * from customers

select * from customers
where contactname like 'a%'


select * from customers
where contactname like '%a'

select * from customers
where contactname like '%or%'

customersname that have "r" in the second position:

select * from customers
where contactname like'_r%'

customersname that starts with "a" and are at least 3 characters
select * from customers
where contactname like 'a__%'

-- customers with a contactname that starts with "a" and end with "o"
select * from customers
where contactname like 'a%o'


--- customers that does not start with "a":
select * from customers
where contactname not like 'a%'

select * from customers
where city like 'ber%'

select * from customers
where city like "es%' ---- between

select * from customers
where city like '_ondon'

select * from customers
where city like 'l_n_on'

------ ## in operator
select * from customers
where country in ('germany','france','uk')


select * from customers
where country not in('germany','france','uk')

select * from customers
where country in (select distinct country from suppliers)

select * from customers
where country in( select distinct country from suppliers)

select * from customers
where city in ( select distinct city from suppliers)


-----## between operator
select * from products
where unitprice between 50 and 60

select * from products
where unitprice between 40 and 50 

----## not between
select * from products
where unitprice not between 10 and 20

select* from products
where unitprice not between 40 and 50

---# between with in
select* from products
where unitprice between 10 and 20 
and not supplierid in(1,2,3)

select * from products
where unitprice between 10 and 20 
and not quantityperunit ='12-550ml bottles'


---between dates
select * from orders
where orderdate between '1996-07-01'and '1996-07-10'

select * from orders
where not orderdate between '1996-07-01'and '1996-07-10'

---## alias for columns
select customerid as id,contactname as customer
from customers

select customerID as id, contactname as[contact person]
from customers

select customerid as id, contactname as contact_person
from customers
select customerid as id,contactname as customer,country
into new_customer
from customers

select * from new_customers

----## union & union all operator ( IMP)

select city from customers ---91
union all  --add data row & keep duplicate
select city from suppliers --29
order by city

select city from customers
union all
select city from suppliers
order by city

select country from customers
union all
select country from suppliers
order by country



select city from customers --91
union -- add data row wise & remove duplicate
select city from suppliers -- 29
ordar by city


select city from customers
union
select city from suppliers
order by city


---union all
---use union all to also select duplicate values !
--- union all with where

select city, country from suppliers
where country = 'germany'
order by city

select city, country from customers
where country='germany'
union --- add row wise & remove duplicate
select city, country from suppliers
where country='germany'
order by city


--- advanceed union
select * into

----### group by statment
select* from customers

select country,count(customerid) as number_of_customer
from customers
group by country

select country, city,count(customerid) as number_of_customers
from customers
group by country,city
order by number_of_ customer dese

------####having clause

select country,count (customersid) as number_of_customer
from customers
group by country
having count(customerid)> 5

select country,count (customersid) as number_of_customer
from customers
group by country
having count(customerid)> 5
order by number_of_customer desc

select city,count(customerid) as numbercustomers
from customers
group by city
order by numberofcustomers desc

select top 3 city,count (customerid) as numberofcustomers
from customers
group by city
order by numberofcustomers desc

select city,count( customerid) as listfrom_uk
from customers
where country='uk'
group by city
order by listfrom_uk desc

select * from orders

select shipvia,count(customerid) as number_customer
from order
where shipcity in ('rio de jenerio','sao paulo')
 and shipcountry='brazil'
group by shipvia

select shipcity,shipvia,count(customerid) as number_of_customer,
sum(freight) as shipping_amount
from orders
where shipcountry='






----create a new column in table
--- alter function

select * from products

alter table products
add anount int --# data type is mandantory

select * from products

update products



select contacttilte,count(city) as no_of_ customer
from customers
group by contacttilte
order by no_of_customers desc



----

















































 






