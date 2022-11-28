--Заадча № 1. Посчитайте колличество заказов, оформленных сотрудников Andrew Fuller.

select count(*) as count_orders
from Orders as t1 inner join Employees as t3 on t1.EmployeeID = t3.EmployeeID
where t3.FirstName = 'Andrew' and t3.LastName = 'Fuller'

-- 96

--Задача № 2. Посчитайте сумарную выручку (стоимость) по заказам, сделанным в 1997 году. Ответ округлите до целого числа.  

select sum(t2.UnitPrice * t2.Quantity * (1 - t2.Discount)) as sum_price
from Orders as t1 inner join [Order Details] as t2 on t1.OrderID = t2.OrderID
where t1.OrderDate like '%1997%'

-- 617085


--Задача № 3. Выведите название категорий и колличество продуктов, входящих в категории.
--Сопоставьте названия категорий и колличество продуктов в категориях.

select t2.CategoryName, count(t2.CategoryName) as count_CategoryName
from Products as t1 inner join Categories as t2 on t1.CategoryID = t2.CategoryID
group by t2.CategoryName
order by count_CategoryName


--Задача № 4. Выведите имя и фамилию сотрудника, который оформил\принял заказ клиента, которого зовут Francisco Chang.

select t3.FirstName, t3.LastName
from Orders as t1 inner join Customers as t2 on t1.CustomerID = t2.CustomerID
				  inner join Employees as t3 on t1.EmployeeID = t3.EmployeeID
where t2.ContactName = 'Francisco Chang'