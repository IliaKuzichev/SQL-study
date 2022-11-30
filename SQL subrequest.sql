--Задача №1. Выведите страны и кол-во клиентов, проживающих в этих странах. 
--Оставьте только страны с количеством клиентов более одного.
--Затем, используя вложенный запрос, посчитайте количество оставшихся стран.

select count(*)
from
	(select Country, count(*) as count_clients
	from Customers
	group by Country
	having count(*) > 1) as table1


--Задача №2. Выведите ID клиентов и кол-во заказов, совершенных клиентами. Оставьте только ID клиентов с количеством заказов более 10.
--Затем, используя вложенный запрос, посчитайте количество оставшихся клиентов.

select count(*) as count_Customers
from (select CustomerID, count(*) as count_orders
from Orders
group by CustomerID
having count(*) > 10) as table1