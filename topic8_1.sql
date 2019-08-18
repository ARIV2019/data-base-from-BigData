/*
Создайте хранимую функцию hello(), которая будет возвращать приветствие,
 в зависимости от текущего времени суток. 
 С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
 с 12:00 до 18:00 функция должна возвращать фразу "Добрый день",
 с 18:00 до 00:00 — "Добрый вечер", 
 с 00:00 до 6:00 — "Доброй ночи".
*/

delimiter //
drop function if exists hello//
create function hello()
returns text deterministic
begin
	if (hour(now()) >= 6 and hour(now()) < 12) then 
		return 'Доброе утро';
	elseif (hour(now()) >= 12 and hour(now()) < 18 ) then
		return 'Добрый день';
	elseif (hour(now()) >= 18 and hour(now()) < 24) then
		return 'Добрый вечер';
	elseif (hour(now()) >= 0 and hour(now()) < 6) then
		return 'Доброй ночи';
	end if; 
end//

select hello()//


