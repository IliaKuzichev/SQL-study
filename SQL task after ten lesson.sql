--������ �1. ���������� ����������� �������, � ������� ������������� ����� Chocolade.

select count(distinct t1.OrderID) as count_oreder_with_chocolade
from [dbo].[Order Details] as t1 inner join Products as t2 on t1.ProductID = t2.ProductID
where t2.ProductName = 'Chocolade'

--������ �2. ���������� ����� �������, ������� �������� ������ ��������� Confections. ����� ��������� �� ������ �����.

select round(sum(t3.UnitPrice * t3.Quantity * (1 - t3.Discount)), 0)
from Products as t1 inner join Categories as t2 on t1.CategoryID = t2.CategoryID
					inner join [dbo].[Order Details] as t3 on t1.ProductID = t3.ProductID
where t2.CategoryName = 'Confections'


--������ �3. ���������� ������� �� ������ ���������. ����� ��������� �������� ����� ������� �������?


select t2.CategoryName, round(sum(t3.UnitPrice * t3.Quantity * (1 - t3.Discount)), 2) as sum_category
from Products as t1 inner join Categories as t2 on t1.CategoryID = t2.CategoryID
					inner join [dbo].[Order Details] as t3 on t1.ProductID = t3.ProductID
group by t2.CategoryName
order by sum_category desc

--������ �4. ������ Simon Crowther ����������, ��� ������� ����� 29 ������ 1998 ����, �� ����� ������ �������� - ����� ������� �����������.
--1) ������� ��� ���������� �� ����������, ����������� ���� �����, ����� ��������� � ���.
--2) ��� ����� ����� ����������?
--1)

select FirstName, LastName
from Employees
where EmployeeID = (select EmployeeID
					from Orders as t1 inner join Customers as t2 on t1.CustomerID = t2.CustomerID
					where t2.ContactName = 'Simon Crowther' and 
						  t1.OrderDate = '1998-04-29')

--2)
select FirstName, LastName
from Orders as t1 inner join Customers as t2 on t1.CustomerID = t2.CustomerID
				  inner join Employees as t3 on t1.EmployeeID = t3.EmployeeID
where t2.ContactName = 'Simon Crowther' and 
	  t1.OrderDate = '1998-04-29'

-- ������ �5. �������� ������ �������� (Shipcity), � ���-�� �������, ����������� � ��� ������ � 1997 ����.
--�������� ������ ������ � ���-��� ������� ������ 5.
--����� � ������� ���������� ������� ���������� ���-�� ����� �������.

select count(*) as count_ShipCity_1997
from (select ShipCity, count(*) as count_orders
	 from Orders
	 where OrderDate like '%1997%'
	 group by ShipCity
	 having count(*) > 5) as table1