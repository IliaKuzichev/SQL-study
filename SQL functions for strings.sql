--������ �1. ���������� ����� ������� �� ���� �������, ��������� � 1996 ����.
-- � ������� ������� Round() ��������� ����� �� ������ �����.

select ROUND(sum(t2.UnitPrice * t2.Quantity * (1 - t2.Discount)),0)
from Orders as t1 inner join [dbo].[Order Details] as t2 on t1.OrderID = t2.OrderID
where OrderDate like '%1996%'


--������ �2. ���������� ����� ���������� ������� ���� ������� � 1997 ���� �� ���������.
-- ������� ������� ���� �������� � ��������� ��������?

select  datepart(quarter, OrderDate) as Quarter_of_1997, count(*) as count_order_in_quarter
from Orders
where OrderDate like '%1997%'
group by datepart(quarter, OrderDate)


--������ �3. ����� ������������ ���������� ���� ������ � ������� ������ (OrderDate) �� ������� �������� (ShippedDate) ����� ���� �������?

select distinct datediff(day, ShippedDate, OrderDate) 
from Orders
where datediff(day, ShippedDate, OrderDate) is not null
order by datediff(day, ShippedDate, OrderDate)


--������ �4. ����� ���������� �������� ����� �������� ������� ����� ��� �� 10 ��������?

select distinct Country
 from Customers
 where LEN(Country) > 10