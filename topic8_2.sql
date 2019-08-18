/*
В таблице products есть два текстовых поля: name с названием товара и description
с его описанием. Допустимо присутствие обоих полей или одно из них.
Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были 
заполнены. 
При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/


delimiter //
drop trigger if exists check_name_and_disc//
create trigger check_name_and_disc before insert on products
for each row 
begin
	IF ((new.name = ' ' or new.name is null ) and (new.description = ' ' or new.description is null)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Error: Значение name или description должно быть определено";
	END IF;
end//	