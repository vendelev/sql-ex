/*
Найдите производителя, выпускающего ПК, но не ПК-блокноты.
http://sql-ex.ru/exercises/index.php?act=learn&LN=8
 */

-- select distinct maker from Product pr1
-- join PC using (model)
-- where maker not in (
--   select maker from Product pr2
--   join Laptop using (model)
-- )

select distinct maker from Product pr1
where pr1.type = 'PC' and not exists (
  select maker from Product pr2
  where pr1.maker=pr2.maker and pr2.type='Laptop'
)