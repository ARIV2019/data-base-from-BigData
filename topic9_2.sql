/*
Создайте SQL-запрос, который помещает в таблицу users миллион записей.
*/

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Покупатели';

delimiter //
drop procedure if exists users_mln//
create procedure users_mln()
begin
	declare i int default 1000000;
	while i > 0 DO
		insert INTO users (name, birthday_at) VALUES
		(null, null);
		set i = i - 1;
	end while;
end//

call users_mln();
select * from users;
