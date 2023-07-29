---- joins----
---1.inner join
---2.outer join
---3.left join
---4.right join

select * from product_demo
select* from locality

select product from product_demo

select product_demo.product from product_demo

---######## inner join----#####

select product_demo.*,locality.city,locality.state
from
product_demo inner join locality
on
product_demo.customer_id= locality.customer_id

--------####outer join####-----

select product_demo.*, locality.city,locality.state
from
product_demo full outer join locality
on
product_demo.customer_id=locality.customer_id


-----#######Left join-----###

select product_demo.*,locality.city,locality.state
from
Product_demo Left join Locality
on
Product_demo.Customer_id=Locality.Customer_id;

---------###### Right join---####

select Locality.*,Product_demo.Product
from
Locality right join product_demo
on
product_demo.Customer_id=Locality.Customer_id


select * from Sales_data
select* from Returned_data

-----#### inner join----####

select Product from Sales_data

select sales_data.*,Returned_data.Returned
from
Sales_data inner join Returned_data
on
sales_data.customerid=Returned_data.CustomerID

-----full outer join----

select sales_data.*,Returned_data.Returned
from
sales_data full outer join Returned_data
on
sales_data.CustomerID=Returned_data.CustomerID

---left join== sales_data
---Right join== Returned_data

------Left join----

select sales_data.*,Returned_data.Returned
from
sales_data left join Returned_data
on
sales_data.CustomerID=Returned_data.CustomerID


--------Right join-----

select Returned_data.*,sales_data.customername,sales_data.Product
from
sales_data right join Returned_data
on
sales_data.CustomerID=Returned_data.CustomerID














