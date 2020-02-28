/*
В наборе записей из таблицы PC, отсортированном по столбцу code (по возрастанию) найти среднее значение цены для каждой шестерки подряд идущих ПК.
Вывод: значение code, которое является первым в наборе из шести строк, среднее значение цены в наборе.
 */

select num, avg(price) from (
select count(1) as num, p2.* from PC p1
join PC p2 on p1.code <= p2.code
group by p2.code
limit 1, 6
) as rowm


select
  p1.code
  , avg(p2.price)
from (
  select (@row_number:=@row_number + 1) as nm, code, price
  from PC, (SELECT @row_number:=0) AS t
  order by code
) p1
left join (
  select (@row_number2:=@row_number2 + 1) as nm, code, price
  from PC, (SELECT @row_number2:=0) AS t
  order by code
) p2 on p2.nm between p1.nm and p1.nm + 5
where p1.nm <= (
  select max(num) - 6 from (
    select count(1) as num from PC p1 join PC p2 on p1.code <= p2.code group by p2.code
  ) mx
)
group by p1.code
order by p1.code, p2.code