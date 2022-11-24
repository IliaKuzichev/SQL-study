--Задача №1 У какого количества клиентов в должности есть слово Sales, а регион не заполнен?

select  count(ContactTitle) as answer
from Customers
where ContactTitle like '%Sales%' and Region is null

--Задача №2 Найдите смаую популярную профессию среди клиентов.

select ContactTitle, count(*) as count_prof
from Customers
group by ContactTitle
order by count_prof desc

--Задача №3 Выведите максимальную и минимальную стоимость товаров в каждой категории(CategoryID).
--В какой категории самая большая разница между самой высокой ценой товара и самой низкой?

select CategoryID, max(UnitPrice) as max_price, min(UnitPrice) as min_price, (max(UnitPrice) - min(UnitPrice)) as difference_price
from Products
group by CategoryID
order by difference_price desc

--Задача №4 Найдите заказ (OrderID) с самым большим количеством (Quantity) товаров в чеке.
--Если в заказе несколько разных товаров, то колличество нужно сложить. Какой OrderID у заказа?

select OrderID, sum(Quantity) as sum_Quantity
from [dbo].[Order Details]
group by OrderID
order by sum_Quantity desc

--Задача №5 Посчитайте суммарный размер скидки по каждому заказу (не в процентах). У скольких заказов скидка составила больше 3000?
--Примичание: В столбце Discount указана скидка в процентах. Подумайте как расчитать фактичкскую скидку.

select OrderID, sum(UnitPrice * Quantity * Discount) as sum_discount
from [dbo].[Order Details]
group by OrderID
having sum(UnitPrice * Quantity * Discount) > 3000