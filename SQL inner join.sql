--������ � 1. ���������� ����������� �������, ����������� ����������� Andrew Fuller.

select count(*) as count_orders
from Orders as t1 inner join Employees as t3 on t1.EmployeeID = t3.EmployeeID
where t3.FirstName = 'Andrew' and t3.LastName = 'Fuller'

-- 96

--������ � 2. ���������� �������� ������� (���������) �� �������, ��������� � 1997 ����. ����� ��������� �� ������ �����.  

select sum(t2.UnitPrice * t2.Quantity * (1 - t2.Discount)) as sum_price
from Orders as t1 inner join [Order Details] as t2 on t1.OrderID = t2.OrderID
where t1.OrderDate like '%1997%'

-- 617085


--������ � 3. �������� �������� ��������� � ����������� ���������, �������� � ���������.
--����������� �������� ��������� � ����������� ��������� � ����������.

select t2.CategoryName, count(t2.CategoryName) as count_CategoryName
from Products as t1 inner join Categories as t2 on t1.CategoryID = t2.CategoryID
group by t2.CategoryName
order by count_CategoryName


--������ � 4. �������� ��� � ������� ����������, ������� �������\������ ����� �������, �������� ����� Francisco Chang.

select t3.FirstName, t3.LastName
from Orders as t1 inner join Customers as t2 on t1.CustomerID = t2.CustomerID
				  inner join Employees as t3 on t1.EmployeeID = t3.EmployeeID
where t2.ContactName = 'Francisco Chang'