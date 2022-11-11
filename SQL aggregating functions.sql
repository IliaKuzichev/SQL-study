--������ �1. �������� SQL ������: �������� �����������, ������������ � ������� ��������� ���������,
--������� ������ � ��������� (������� CategoryID) �3.
--������ ������������ ��������� ��������� � ���� ���������? ����� ��������� �� ������ �����.
--�������� �������� ������� ������ �������: min_price, max_price, avg_price

select min(UnitPrice) as min_price, max(UnitPrice) as max_price, avg(UnitPrice) as avg_price
from Products
where CategoryID = '3'

--max_price 81

--������ �2. �������� SQL ������: ���������� ����������� ���������� ���������� ��������, ����������� � �������������� (UK).
select count (distinct ContactTitle) as count_unique_ContactTitle
from Customers
where Country = 'UK'

--������ �3. �������� SQL ������: ���������� ��������� ��������� ���� ��������� �� ��������� 4 � 5.

select sum(UnitPrice) as sum_UnitPrice
from Products
where CategoryID = 4 or CategoryID = 5