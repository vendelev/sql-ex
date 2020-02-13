/*
Найдите производителей самых дешевых цветных принтеров. Вывести: maker, price
http://sql-ex.ru/exercises/index.php?act=learn&LN=18
 */

Select distinct pr.maker, sub.price
from (
Select min(price) as price from Printer where color = 'Y'
) sub
join Printer pt on sub.price = pt.price and pt.color = 'y'
join Product pr on pr.model = pt.model
