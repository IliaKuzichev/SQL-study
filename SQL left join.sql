--Задача №1. Выведите список городок клиенты из которых не сделали ни одного заказа.
select t1.City
from Customers as t1 left join Orders as t2 on t1.CustomerID = t2.CustomerID
where t2.OrderID is null
