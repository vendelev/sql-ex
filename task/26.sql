/*
Найдите среднюю цену ПК и ПК-блокнотов, выпущенных производителем A (латинская буква). Вывести: одна общая средняя цена.
http://sql-ex.ru/exercises/index.php?act=learn&LN=26
 */

Select sum(price)/sum(cnt) as AVG_price from
(
select sum(PC.price) as price, count(PC.price) as cnt from Product pr1
join PC on PC.model = pr1.model
where pr1.maker='A'
union
select sum(lp.price) as price, count(lp.price) as cnt from Product pr2
join Laptop lp on lp.model = pr2.model
where pr2.maker='A'
) as z4
