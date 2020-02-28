/*
Найдите пары моделей PC, имеющих одинаковые скорость и RAM. В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), Порядок вывода: модель с большим номером, модель с меньшим номером, скорость и RAM.
http://sql-ex.ru/exercises/index.php?act=learn&LN=16
 */

select distinct p1.model, p2.model, p1.speed, p1.ram
from PC p1
join PC p2 on p1.speed = p2.speed and p1.ram = p2.ram and p1.model <> p2.model and p1.model > p2.model
