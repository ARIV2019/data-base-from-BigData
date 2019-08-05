/*Подсчитайте средний возраст пользователей 
в таблице users
Используем Представление - это запрос на выборку, которому присваивается уникальное имя и который можно сохранять в базе данных, для последующего использования.
Синтаксис создания представления следующий:CREATE VIEW имя_представления AS запрос;
*/

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
 ) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

DROP VIEW IF EXISTS r1_age;
CREATE VIEW r1_age AS
select TIMESTAMPDIFF(YEAR, birthday_at, NOW()) AS age 
from users;
select AVG(age) as 'средний возвраст' from r1_age;
