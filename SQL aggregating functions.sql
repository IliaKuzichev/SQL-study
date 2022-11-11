--Задача №1. Напишите SQL запрос: Выведите минимальную, максимальную и среднюю стоимость продуктов,
--которые входят в категорию (столбец CategoryID) №3.
--Какова максимальная стоимость продуктов в этой категории? Ответ округлите до целого числа.
--Назовите итоговые столбцы новыми именами: min_price, max_price, avg_price

select min(UnitPrice) as min_price, max(UnitPrice) as max_price, avg(UnitPrice) as avg_price
from Products
where CategoryID = '3'

--max_price 81

--Задача №2. Напишите SQL запрос: Посчитайте колличество уникальных професский клиентов, проживающих в Великобритании (UK).
select count (distinct ContactTitle) as count_unique_ContactTitle
from Customers
where Country = 'UK'

--Задача №3. Напишите SQL запрос: Посчитайте суммарную стоимость всех продуктов из категории 4 и 5.

select sum(UnitPrice) as sum_UnitPrice
from Products
where CategoryID = 4 or CategoryID = 5