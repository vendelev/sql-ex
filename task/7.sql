/*
Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) производителя B (латинская буква).
http://sql-ex.ru/exercises/index.php?act=learn&LN=7
 */

select pr.model, price from (
Select model, price from PC
union
Select model, price from Laptop
union
Select model, price from Printer
) u join Product pr on pr.model= u.model
where maker like 'B%'
