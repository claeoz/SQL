
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
	o.orderid,
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
--
select top 1 * From Sales.Customers
select top 1 * From Sales.Orders
select top 1 * From Sales.OrderDetails
DROP TABLE #Table3
--
--5
Create Table #Table3
(
	CustomerID Int Primary Key,
	CustomerName Nvarchar(50) not null,
	CustomerPhone Nvarchar(20) not null,
	TotalRefund money not null
)
Insert Into #Table3 (CustomerID, CustomerName, CustomerPhone, TotalRefund)
Select
    c.custid,
    c.contactname,
    c.phone,
    Sum(d.unitprice * 0.3) as TotalRefund
From Sales.Orders o
Join Sales.OrderDetails d On o.orderid = d.orderid
Join Sales.Customers c On c.custid = o.custid
Where d.discount = 0
group by c.custid, c.contactname, c.phone

Select top 10 * from #Table3
--6
Use COczachowski_SQLDev_F25;
Go

Create Procedure Week9
	@origDiscount money,
	@newDiscount money
As
Begin
	If Not Exists (select 1 From Sales.OrderDetails d Where d.discount = @origDiscount)
	Begin
		Print 'No orders with that original discount';
		Return
	End
	Select top 0 *
	Into #Table1
	From Sales.Orders
	Select * From #Table1;

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

	Select *
	Into Table2
	From #Table1
	Select * From Table2;

	Alter table #Table1
	Add newPrice money null

	update t
	Set newPrice = d.unitprice * 0.97
	From #Table1 t
	join Sales.OrderDetails d
	On t.orderid = d.orderid

	Create Table #Table3
	(
		CustomerID Int Primary Key,
		CustomerName Nvarchar(50) not null,
		CustomerPhone Nvarchar(20) not null,
		TotalRefund money not null
	)
	Insert Into #Table3 (CustomerID, CustomerName, CustomerPhone, TotalRefund)
	Select
		c.custid,
		c.contactname,
		c.phone,
		Sum(d.unitprice * (1 - d.discount) - (d.unitprice * @newDiscount)) as TotalRefund
	From Sales.Orders o
	Join Sales.OrderDetails d On o.orderid = d.orderid
	Join Sales.Customers c On c.custid = o.custid
	Where d.discount = 0
	group by c.custid, c.contactname, c.phone
End;
Go