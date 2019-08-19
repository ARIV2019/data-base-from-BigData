/*
Создайте таблицу logs типа Archive. Пусть при каждом создании записи 
в таблицах users, catalogs и products в таблицу logs помещается время и
 дата создания записи, название таблицы,
 идентификатор первичного ключа и содержимое поля name.
*/

drop table if exists logs;
create table logs (
    created_at DATETIME,
	name varchar(255),
	id int,
	name_table varchar(255) 
	) engine=ARCHIVE;

delimiter //
drop trigger if exists logs_users//
create trigger logs_users after insert on users
for each row 
begin 
	INSERT INTO logs (created_at, name , id) select new.created_at, new.name, new.id from users;
end//

drop trigger if exists logs_catalogs//
create trigger logs_catalogs after insert on catalogs
for each row 
begin 
	INSERT INTO logs (created_at, name , id) select created_at, name, id from catalogs;
end//

drop trigger if exists logs_products//
create trigger logs_products after insert on products
for each row 
begin 
	INSERT INTO logs (created_at, name , id) select created_at, name, id from products;
end//
