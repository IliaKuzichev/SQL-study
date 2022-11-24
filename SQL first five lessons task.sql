--������ �1 � ������ ���������� �������� � ��������� ���� ����� Sales, � ������ �� ��������?

select  count(ContactTitle) as answer
from Customers
where ContactTitle like '%Sales%' and Region is null

--������ �2 ������� ����� ���������� ��������� ����� ��������.

select ContactTitle, count(*) as count_prof
from Customers
group by ContactTitle
order by count_prof desc

--������ �3 �������� ������������ � ����������� ��������� ������� � ������ ���������(CategoryID).
--� ����� ��������� ����� ������� ������� ����� ����� ������� ����� ������ � ����� ������?

select CategoryID, max(UnitPrice) as max_price, min(UnitPrice) as min_price, (max(UnitPrice) - min(UnitPrice)) as difference_price
from Products
group by CategoryID
order by difference_price desc

--������ �4 ������� ����� (OrderID) � ����� ������� ����������� (Quantity) ������� � ����.
--���� � ������ ��������� ������ �������, �� ����������� ����� �������. ����� OrderID � ������?

select OrderID, sum(Quantity) as sum_Quantity
from [dbo].[Order Details]
group by OrderID
order by sum_Quantity desc

--������ �5 ���������� ��������� ������ ������ �� ������� ������ (�� � ���������). � �������� ������� ������ ��������� ������ 3000?
--����������: � ������� Discount ������� ������ � ���������. ��������� ��� ��������� ����������� ������.

select OrderID, sum(UnitPrice * Quantity * Discount) as sum_discount
from [dbo].[Order Details]
group by OrderID
having sum(UnitPrice * Quantity * Discount) > 3000