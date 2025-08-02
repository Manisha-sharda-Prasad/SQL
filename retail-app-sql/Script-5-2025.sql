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
select count(o.orderid), c.customername
from orders o
join customers c on o.customerid = c.customerid
group by c.customername;


--12.Show total revenue (sum of Price * Quantity) generated per product.
select  p.productname,  sum(p.price * od.quantity) as "Total Revenue"
from products p
join orderdetails od on od.productid = p.productid
group by p.productname ;


--13.Find the average price of products supplied by each supplier.
select p.productname, s.suppliername, avg(p.price)
from products p
join suppliers s on  p.supplierid = s.supplierid
group by p.productname , s.suppliername;

--14.Show the total number of products in each category.
select c.categoryname , count(p.productname ) as Total
from products p
join categories c on p.categoryid = c.categoryid
group by c.categoryname;

--15.Find the maximum and minimum product price.❌
select p.productname, min(p.price) , max(p.price)
from products p
group by p.productname;

-- 15.Find the maximum and minimum product price. (in whole table) ☑️
select min(p.price) , max(p.price)
from products p