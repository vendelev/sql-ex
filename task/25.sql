/*
Найдите производителей принтеров, которые производят ПК с наименьшим объемом RAM и с самым быстрым процессором среди всех ПК, имеющих наименьший объем RAM. Вывести: Maker
http://sql-ex.ru/exercises/index.php?act=learn&LN=25
 */

select distinct pr1.maker from Product pr1
join
(
  Product pr2 join PC pc1 on
  pc1.model = pr2.model and
  pc1.speed = (
    select max(speed) from (
      select speed from PC where ram = (select min(ram) mram from PC)
    ) as z4
  ) and pc1.ram = (select min(ram) mram from PC)
) on pr1.maker = pr2.maker

WHERE pr1.type = 'printer'
