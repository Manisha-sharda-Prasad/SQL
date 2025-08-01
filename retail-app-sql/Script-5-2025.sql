-- Beginner-level , Join Queries:--

--1. Show all customers with their city and country.
select  c.customername, c.country, c.city
from customers c;

--2.List all products with their price greater than 20.
select p.productname , p.price
from products p
where p.price > 20;

--3. Get all orders placed by a customer named “John Doe”.
select 
	c.customername , o.orderid , p.productname
from 
	orders o ,
	customers c ,
	products p ,
	orderdetails od
where 
	c.customerid = o.customerid  					        -- table join :: condition
	and p.productid  = od.productid 			            -- table join :: condition
	and c.customername = 'Antonio Moreno Taquería' ; 	    -- problem statement :: condition
	-- n table => n-1 table join condition / min


--3. Get all orders placed by a customer named “John Doe”.
select distinct 
	c.customername,
	p.productname 
from     customers c
	join orders o 			on o.customerid  = c.customerid
	join orderdetails od 	on od.orderid 	 = o.orderid 
	join products p 		on p.productid   = od.productid 
where 
	c.customername = 'Antonio Moreno Taquería' -- condition
order by 
	p.productname;

--4.Find all products in the “Beverages” category.
select p.productname ,c.categoryid, c.categoryname
from products p , categories c
where c.categoryname = 'Beverages' and p.categoryid = c.categoryid ;


--5.Show the order details (OrderID, ProductName, Quantity) for a specific OrderID = 1.
select od.orderid, p.productname, od.quantity
from orderdetails od
join products p on od.productid = p.productid
where od.orderid = 1;

--6.Display all orders with the customer name and order date.
select   c.customername , o.orderdate
from orders o
join customers c on o.customerid = c.customerid;

--7.Show all product names along with their supplier name.

select p.productname , s.suppliername
from products p
join suppliers s on p.supplierid = s.supplierid;

--8.List all order details with OrderID, ProductName, Price, Quantity and Total (Price * Quantity).
select od.orderid, p.productname, p.price, od.quantity , (p.price * od.quantity) as Total
from orderdetails od
join products p on od.productid = p.productid;


--9.Show all products in each category (CategoryName and ProductName).
select p.productname, c.categoryname
from products p , categories c;

--10.Get all orders with Shipper Name (Orders + Shippers + Customers).

select s.shippername , o.orderid , c.contactname
from orders o
join shippers s on o.shipperid = s.shipperid
join customers c on o.customerid = c.customerid;

--Aggregation:--

--11.Count total orders placed by each customer.




--Show total revenue (sum of Price * Quantity) generated per product.

--Find the average price of products supplied by each supplier.

--Show the total number of products in each category.

--Find the maximum and minimum product price.