-- Задача №1 Напишите SQL запрос: Сколько товаров (продуктов) стоят более 100?
select *
from Products
where Unitprice > '100'

-- Задача №2 Напишите SQL запрос: Сколько клиентов в нашей базе данных из Испании?

select *
from Customers
where Country = 'Spain'

-- Задача №3 Напишите SQL запрос: Выведите города, начинающиеся на букву "W", в которых проживают клиенты.
-- Какие города вывел запрос?

select City
from Customers
where City like 'W%'

-- Задача №4 Напишите SQL запрос: У скольких клиентов номер телефона (столбец Phone) Содержит '5555' (четыре пятерки подряд).
--Не важно в начале номера, в середине или в конце.
select *
from Customers
where Phone like '%5555%'

-- Задача №5 Напишите SQL запрос: Выведите информацию о человеке, который проживает в стране США
-- и работает в должности "Marketing Assistant".
-- Как зовут этого человека?

select ContactName
from Customers
where Country = 'USA' and ContactTitle = 'Marketing Assistant'

-- Задача №6 Напишите SQL запрос: Выведите данные по продуктам, которые стоят более 100 или название продукта 'Chai'.
-- Столбцы для вывода: Название продукта, Цена продукта
-- Какое колличество продуктов вывел запрос?

select ProductName, UnitPrice
from Products
where UnitPrice > '100' or ProductName = 'Chai'
