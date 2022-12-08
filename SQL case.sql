--Задача №1. Выведите имена сотрудников, страны и регионы. 
--С помощью выражения CASE в столбце регион заполните пустые значения NULL на значения 'Not defiend'.
--У скольких сотрудников регион не определен?

select count(*) as count_notDefiend
from 
	(
	select FirstName, Country, case when Region is null then 'Not defiend' else Region end as Region
	from Employees
	) as table1
where Region = 'Not defiend'


--Задача №2. Выведите имена, фамилии сотрудников и обращения (TitleOfCourstesy).
--Далее, с помощью выражения CASE, добавьте столбец Gender.
--Если обращение Ms. или Mrs., то Gender - Woman. Если обращение Mr. или Dr., то Gender - Men.
--Затем с помощью вложенного запроса посчитайте вол-во мужчин и женщин. Сколько сотрудников Женского пола?

select Gender, count(*) as count_Gender
from
	(
	select FirstName, LastName, TitleOfCourtesy, case when TitleOfCourtesy in ('Ms.', 'Mrs.') then 'Woman'
													  when TitleOfCourtesy in ('Mr.', 'Dr.') then 'Men' end as Gender
	from Employees
	) as table1
group by Gender

--Задача №3. Выведите наименования продуктов и их цену.
--Далее, с помощью выражения CASE, добавьте столбец с сегментами по цене.
--Если цена от 0 до 9.99, то это сегмент '0-9.99'. Если цена от 10 до 29.99, то это сегмент '10-29.99'.
--Если цена от 30 до 49.99, то это сегмент '30-49.99'. Если цена от 50, то это сегмент '50+'.
--Затем, с помощью вложеного запроса, посчитайте кол-во товаров в разрезе каждого сегмента. Сколько товаров в сегменте '50+'?

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