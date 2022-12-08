--������ �1. �������� ����� �����������, ������ � �������. 
--� ������� ��������� CASE � ������� ������ ��������� ������ �������� NULL �� �������� 'Not defiend'.
--� �������� ����������� ������ �� ���������?

select count(*) as count_notDefiend
from 
	(
	select FirstName, Country, case when Region is null then 'Not defiend' else Region end as Region
	from Employees
	) as table1
where Region = 'Not defiend'


--������ �2. �������� �����, ������� ����������� � ��������� (TitleOfCourstesy).
--�����, � ������� ��������� CASE, �������� ������� Gender.
--���� ��������� Ms. ��� Mrs., �� Gender - Woman. ���� ��������� Mr. ��� Dr., �� Gender - Men.
--����� � ������� ���������� ������� ���������� ���-�� ������ � ������. ������� ����������� �������� ����?

select Gender, count(*) as count_Gender
from
	(
	select FirstName, LastName, TitleOfCourtesy, case when TitleOfCourtesy in ('Ms.', 'Mrs.') then 'Woman'
													  when TitleOfCourtesy in ('Mr.', 'Dr.') then 'Men' end as Gender
	from Employees
	) as table1
group by Gender

--������ �3. �������� ������������ ��������� � �� ����.
--�����, � ������� ��������� CASE, �������� ������� � ���������� �� ����.
--���� ���� �� 0 �� 9.99, �� ��� ������� '0-9.99'. ���� ���� �� 10 �� 29.99, �� ��� ������� '10-29.99'.
--���� ���� �� 30 �� 49.99, �� ��� ������� '30-49.99'. ���� ���� �� 50, �� ��� ������� '50+'.
--�����, � ������� ��������� �������, ���������� ���-�� ������� � ������� ������� ��������. ������� ������� � �������� '50+'?

select PriceSegment, count(*) as PriceSegment_50plus
from
	(
	select ProductName, UnitPrice, case when UnitPrice < 10 then '0-9.99'
										when UnitPrice between 10 and 29.99 then '10-29.99'
										when UnitPrice between 30 and 49.99 then '30-49.99'
										when UnitPrice >= 50 then '50+' end as PriceSegment
	from Products
	) as table1
group by PriceSegment