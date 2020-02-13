/*
Для каждого производителя, выпускающего ПК-блокноты c объёмом жесткого диска не менее 10 Гбайт, найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
http://sql-ex.ru/exercises/index.php?act=learn&LN=6
 */

select distinct pr.maker, lt.speed
from Product pr join Laptop lt on pr.model = lt.model
where lt.hd >=10
