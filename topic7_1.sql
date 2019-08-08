/*
Создайте двух пользователей которые имеют доступ к базе данных shop. 
Первому пользователю shop_read должны быть доступны только запросы на чтение данных, 
второму пользователю shop — любые операции в пределах базы данных shop.
*/

CREATE USER us_1;
CREATE USER us_2;

GRANT SELECT ON shop.* TO us_1;
GRANT ALL ON shop.* TO us_2;


-- DROP USER us_1;
-- DROP USER us_2;

