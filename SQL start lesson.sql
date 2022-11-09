-- ������ �1 �������� SQL ������: ������� ������� (���������) ����� ����� 100?
select *
from Products
where Unitprice > '100'

-- ������ �2 �������� SQL ������: ������� �������� � ����� ���� ������ �� �������?

select *
from Customers
where Country = 'Spain'

-- ������ �3 �������� SQL ������: �������� ������, ������������ �� ����� "W", � ������� ��������� �������.
-- ����� ������ ����� ������?

select City
from Customers
where City like 'W%'

-- ������ �4 �������� SQL ������: � �������� �������� ����� �������� (������� Phone) �������� '5555' (������ ������� ������).
--�� ����� � ������ ������, � �������� ��� � �����.
select *
from Customers
where Phone like '%5555%'

-- ������ �5 �������� SQL ������: �������� ���������� � ��������, ������� ��������� � ������ ���
-- � �������� � ��������� "Marketing Assistant".
-- ��� ����� ����� ��������?

select ContactName
from Customers
where Country = 'USA' and ContactTitle = 'Marketing Assistant'

-- ������ �6 �������� SQL ������: �������� ������ �� ���������, ������� ����� ����� 100 ��� �������� �������� 'Chai'.
-- ������� ��� ������: �������� ��������, ���� ��������
-- ����� ����������� ��������� ����� ������?

select ProductName, UnitPrice
from Products
where UnitPrice > '100' or ProductName = 'Chai'
