/*
В базе данных shop и sample присутствуют одни и те же таблицы, 
учебной базы данных. Переместите запись id = 1 из 
таблицы shop.users в таблицу sample.users. Используйте транзакции.
*/

START TRANSACTION;
INSERT INTO sample.users (name,birthday_at) select name, birthday_at from shop.users where id = 1;
DELETE FROM shop.users where id = 1;
COMMIT;
