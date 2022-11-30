--������ �1. �������� ������ � ���-�� ��������, ����������� � ���� �������. 
--�������� ������ ������ � ����������� �������� ����� ������.
--�����, ��������� ��������� ������, ���������� ���������� ���������� �����.

select count(*)
from
	(select Country, count(*) as count_clients
	from Customers
	group by Country
	having count(*) > 1) as table1


--������ �2. �������� ID �������� � ���-�� �������, ����������� ���������. �������� ������ ID �������� � ����������� ������� ����� 10.
--�����, ��������� ��������� ������, ���������� ���������� ���������� ��������.

select count(*) as count_Customers
from (select CustomerID, count(*) as count_orders
from Orders
group by CustomerID
having count(*) > 10) as table1