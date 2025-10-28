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

Select count(*) as total from #table1;
--3
Select *
Into #Table2
From #Table1
Select * From #Table2;
--4
Alter table #Table1
Add newPrice money null

update t
Set newPrice = d.unitprice * 0.97
From #Table1 t
join Sales.OrderDetails d
On t.orderid = d.orderid

select top 10 * From #Table1;
--5

--6