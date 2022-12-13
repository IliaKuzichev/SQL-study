--Задача №1. Посчитайте общую выручку по всем заказам, сделанным в 1996 году.
-- С помощью функции Round() округлите ответ до целого числа.

select ROUND(sum(t2.UnitPrice * t2.Quantity * (1 - t2.Discount)),0)
from Orders as t1 inner join [dbo].[Order Details] as t2 on t1.OrderID = t2.OrderID
where OrderDate like '%1996%'


--Задача №2. Посчитайте какое количество заказов было сделано в 1997 году по кварталам.
-- Сколько заказов было сделанов в четвертом квартале?

select  datepart(quarter, OrderDate) as Quarter_of_1997, count(*) as count_order_in_quarter
from Orders
where OrderDate like '%1997%'
group by datepart(quarter, OrderDate)


--Задача №3. Какое максимальное количество дней прошло с момента заказа (OrderDate) до момента доставки (ShippedDate) среди всех заказов?

select distinct datediff(day, ShippedDate, OrderDate) 
from Orders
where datediff(day, ShippedDate, OrderDate) is not null
order by datediff(day, ShippedDate, OrderDate)


--Заадча №4. Какое количество названий стран клиентов состоят более чем из 10 символов?

select distinct Country
 from Customers
 where LEN(Country) > 10