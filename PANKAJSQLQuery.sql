

SELECT * FROM Bank_Account_Details
SELECT * FROM BANK_ACCOUNT_TRANSACTION
SELECT * FROM Bank_customer
SELECT * FROM customer
SELECT * FROM Orders
SELECT * FROM Salesman



1. Write a SQL query which will sort out the customer and their grade 
who made an order. Every customer must have a grade and be served 
by at least one seller, who belongs to a region.


SELECT Customer.cust_name,customer.grade, orders.ord_no
FROM 
Customer INNER JOIN Orders
ON 
Customer.custemor_id = Orders.customer_id
WHERE Grade IS NOT NULL



2. Write a query for extracting the data from the order table for the 
salesman who earned the maximum commission.

SELECT * FROM Orders
SELECT * FROM Salesman

SELECT * from orders
where salesman_id in
(select salesman_id from Salesman
where commision =( select max (commision) from Salesman))


3. From orders retrieve only ord_no, purch_amt, ord_date, ord_date, 
salesman_id where salesman’s city is Nagpur(Note salesman_id of 
orders table must be other than the list within the IN operator.)


SELECT * FROM Orders
SELECT * FROM Salesman

SELECT ord_no,purch_amt,ord_date from orders salesman_id
where salesman_id in(SELECT salesman_id from salesman where city='nagpur')


4. Write a query to create a report with the order date in such a way 
that the latest order date will come last along with the total purchase 
amount and the total commission for that date is (15 % for all 
sellers)


SELECT * FROM orders

SELECT ord_date,sum(purch_amt),sum(purch_amt)*0.15 from orders
group by ord_date
order by ord_date;



5. Retrieve ord_no, purch_amt, ord_date, ord_date, salesman_id from 
Orders table and display only those sellers whose purch_amt is 
greater than average purch_amt.


SELECT ord_no,purch_amt,ord_date,salesman_id from orders
where purch_amt >( SELECT avg(purch_amt) as average_purch_amt from orders)



6. Write a query to determine the Nth (Say N=5) highest purch_amt from
Orders table.

SELECT* FROM orders

SELECT top 1 purch_amt from(SELECT top 5 purch_amt from orders
order by purch_amt desc) as temp
order by purch_amt 


9. Print customer_id, account_number, balance_amount, conPrint 
account_number, balance_amount, transaction_amount from 
Bank_Account_Details and bank_account_transaction for all the 
transactions occurred during march, 2020 and april, 2020.

SELECT* FROM Bank_Account_Details
SELECT* FROM BANK_ACCOUNT_TRANSACTION


SELECT Bank_Account_Details.Account_Number,
Bank_Account_Details.Balance_amount,
BANK_ACCOUNT_TRANSACTION.Transaction_amount,
BANK_ACCOUNT_TRANSACTION.Transaction_Date
from Bank_Account_Details FULL OUTER JOIN BANK_ACCOUNT_TRANSACTION
ON 
Bank_Account_Details.Account_Number=BANK_ACCOUNT_TRANSACTION.Account_Number
WHERE Transaction_Date BETWEEN '2020-03-01' AND '2020-04-30'


10. Print all of the customer id, account number, balance_amount,
transaction_amount from bank_cutomer, bank_account_details and 
bank_account_transactions tables where excluding all of their 
transactions in march, 2020 month 


SELECT* FROM Bank_Account_Details
SELECT* FROM BANK_ACCOUNT_TRANSACTION
SELECT * FROM Bank_customer

SELECT Bank_Account_Details.Customer_id,
Bank_Account_Details.Account_Number,
Bank_Account_Details.Balance_amount,
BANK_ACCOUNT_TRANSACTION.Transaction_amount,
BANK_ACCOUNT_TRANSACTION.Transaction_Date
from Bank_Account_Details left join BANK_ACCOUNT_TRANSACTION
on
Bank_Account_Details.Account_Number=BANK_ACCOUNT_TRANSACTION.Account_Number
WHERE not TRANSACTION_DATE BETWEEN '2020-03-01' AND '2020-03-31'


8.Print customer_id, account_number and balance_amount, condition
that if balance_amount is nil then assign transaction_amount for
account_type = "Credit Card"
SELECT Bank_Account_Details.Customer_id,
Bank_Account_Details.Account_Number,
CASE
WHEN balance_amount=0 THEN transaction_amount
ELSE balance_amount
END AS balance_amount
FROM
Bank_Account_Details INNER JOIN BANK_ACCOUNT_TRANSACTION
ON
Bank_Account_Details.Account_Number=BANK_ACCOUNT_TRANSACTION.Account_Number
WHERE Account_type='credit card'

7. What are Entities and Relationships?
---
-- Entities : An entity is a real-world object.
--For example - university database can have entities such as Student, Lecturer, Course, Project, etc. 
-- The attributes describe the entities. The student entity can have attributes such as id and name.
-- The course entity can have attributes such as course_code and course_name. 
-- The Lecturer can have attributes such as id, name and speciality.


-- Relationships : A relationship signifies an association among the entities. 
-- There are three types of relationships that can exist between the entities. They are the binary, recursive and the ternary relationship.
-- A relationship represents the association between entities.

