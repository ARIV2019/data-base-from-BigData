/*
Пусть в таблице users поля created_at и updated_at оказались незаполненными. 
Заполните их текущими датой и временем.
*/


DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME,
  updated_at DATETIME
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('Геннадий', '1990-10-05', NOW(), NOW()),
  ('Наталья', '1984-11-12', NOW(), NOW()),
  ('Александр', '1985-05-20', NOW(), NOW()),
  ('Сергей', '1988-02-14', NOW(), NOW()),
  ('Иван', '1998-01-12', NOW(), NOW()),
  ('Мария', '1992-08-29', NOW(), NOW());

select * from users;
