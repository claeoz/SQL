--1
Select top 0 *
Into #Table1
From Sales.Orders
Select * From #Table1;

--
Select Top 10 * From #Table1
select Top 1 * from Sales.OrderDetails;
--
--2
Insert Into #Table1
Select 
	o.custid, 
	o.empid, 
	o.orderdate, 
	o.requireddate, 
	o.shippeddate, 
	o.shipperid, 
	o.freight,
	o.shipname, 
	o.shipaddress, 
	o.shipcity, 
	o.shipregion, 
	o.shippostalcode, 
	o.shipcountry
From Sales.Orders o
Join Sales.OrderDetails d on o.orderid = d.orderid
Where d.discount = 0

Select Top 10 * From #Table1
--3

--4

--5

--6