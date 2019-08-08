/*
(по желанию) Пусть имеется таблица рейсов flights (id, from, to)
 и таблица городов cities (label, name). Поля from, to и label содержат
 английские названия городов, поле name — русское.
 Выведите список рейсов flights с русскими названиями городов.
*/

DROP TABLE IF EXISTS flight;
CREATE TABLE flight (
  id SERIAL PRIMARY KEY,
  `from` VARCHAR(255) COMMENT 'место вылета',
  `to` VARCHAR(255) COMMENT 'место прилета'
  ) COMMENT = 'Маршруты';

INSERT INTO flight (`from`, `to`) VALUES
  ('moscow', 'omsk'),
  ('novgorod', 'kazan'),
  ('irkutsk', 'moscow'),
  ('omsk', 'irkutsk'),
  ('moscow', 'kazan');

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
  label VARCHAR(255) COMMENT 'label города',
  name VARCHAR(255) COMMENT 'название города рус'
  ) COMMENT = 'Название городов';

INSERT INTO cities (label, name) VALUES
  ('moscow', 'Москва'),
  ('irkutsk', 'Иркутск'),
  ('novgorod', 'Новгород'),
  ('kazan', 'Казань'),
  ('omsk', 'Омск');
  
  /*
(по желанию) Пусть имеется таблица рейсов flights (id, from, to)
 и таблица городов cities (label, name). Поля from, to и label содержат
 английские названия городов, поле name — русское.
 Выведите список рейсов flights с русскими названиями городов.
*/
  
  select id as 'номер рейса',
  (select name from cities where label = `from`) as 'из',
  (select name from cities where label = `to`) as 'в'
  from flight ;