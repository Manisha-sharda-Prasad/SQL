--select  c.customername, c.country, c.city from retailapp.customers c

--select p.productname , p.price from retailapp.products pwhere p.price > 20

select 
	c.customername , o.orderid , p.productname
from 
	retailapp.orders o , 
	retailapp.customers c , 
	retailapp.products p , 
	retailapp.orderdetails od 
where 
	c.customerid = o.customerid  					-- table join :: condition
	and p.productid  = od.productid 			-- table join :: condition
	
	and c.customername = 'Antonio Moreno Taquería' ; 	-- problem statement :: condition
	-- n table => n-1 table join condition / min


--select p.productname ,c.categoryid, c.categoryname  from retailapp.products p , retailapp.categories c where c.categoryname = 'Beverages' and p.categoryid = c.categoryid 

-- #3 Get all orders placed by a customer named “John Doe”.

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
	p.productname 



