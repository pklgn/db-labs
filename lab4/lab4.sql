#3.1 INSERT
#3.1.a
INSERT INTO person
VALUES (DEFAULT, 'Leanne', 'Graham', '2001-01-25', '17707368031', '40817810099910004312');

INSERT INTO person
VALUES (DEFAULT, 'Ervin', 'Howell', '1999-05-23', '0106926593', '40817810099810002875');

INSERT INTO person
VALUES (DEFAULT, 'Clementine', 'Bauch', '1987-04-27', '14631234447', '40817810099810002877');

INSERT INTO person
VALUES (DEFAULT, 'Patricia', 'Lebsack', '1998-05-17', '4931709623', '40817810086710000284');

INSERT INTO person (first_name, last_name, date_birth, phone, bank_account)
VALUES ('Chelsey', 'Dietrich', '2000-05-20', '2549541289', '40721810086710000805');

INSERT INTO person (first_name, last_name, date_birth, phone, bank_account)
VALUES ('Dennis', 'Schulist', '1976-06-29', '14779358478', '40574810086710000001');

INSERT INTO person (first_name, last_name, date_birth, phone, bank_account)
VALUES ('Kurtis', 'Dietrich', '2000-05-20', '2100676132', '40721205086710000946');

INSERT INTO person (first_name, last_name, date_birth, phone, bank_account)
VALUES ('Nicholas', 'Runolfsdottir', '1955-09-25', '5864936943', '10794205086710000465');

INSERT INTO person (first_name, last_name, date_birth, phone, bank_account)
VALUES ('Glenna', 'Reichert', '1954-08-01', '7759766794', '60732205086710078603');

INSERT INTO utility_rate (name, description, price, date_start, date_end)
VALUES ('heating', NULL, 1325.12, '2022-02-01', '2022-03-01');

INSERT INTO apartment_building
VALUES (DEFAULT, 'brick', 'Department of Urban Planning Regulation of Moscow', 'Moscow, 53 Arbat Street', '1825-06-07',
        132456873.12);

INSERT INTO flat
VALUES (DEFAULT, 3, 238, 1, 43256890.43, 'luxury', 6, 0, 1);

INSERT INTO service
VALUES (DEFAULT, 1, 1, 1);

INSERT INTO apartment_building
VALUES (DEFAULT, 'panel', 'Management company #1 of Yoshkar-Ola', 'Yoshkar-Ola, 2 Kirova Street', '1989-05-01',
        95248602.32);

INSERT INTO flat
VALUES (DEFAULT, 120, 48, 2, 2435000.21, 'standard', 2, 3, 1);

INSERT INTO person_has_flat
VALUES (DEFAULT, 6, 2, 1, '2010-01-04');

INSERT INTO service
VALUES (DEFAULT, 2, 1, 1.25);

INSERT INTO utility_rate
VALUES (DEFAULT, 'gas supply', NULL, 12.6, '2022-02-01', '2022-03-01');

INSERT INTO utility_rate
VALUES (DEFAULT, 'water supply', 'includes cold water, drainage', 22.49, '2022-02-01', '2022-03-01'),
       (DEFAULT, 'cable tv', NULL, 300.00, '2022-01-01', '2022-02-01'),
       (DEFAULT, 'electricity', NULL, 4.02, '2022-01-01', '2022-02-01'),
       (DEFAULT, 'solid waste management', NULL, 501.89, '2022-01-01', '2022-02-01'),
       (DEFAULT, 'housing maintenance', NULL, 15.3, '2022-01-01', '2022-02-01'),
       (DEFAULT, 'cable tv', NULL, 350.00, '2022-02-01', '2022-03-01'),
       (DEFAULT, 'electricity', NULL, 5.02, '2022-02-01', '2022-03-01'),
       (DEFAULT, 'solid waste management', NULL, 603.89, '2022-02-01', '2022-03-01'),
       (DEFAULT, 'housing maintenance', NULL, 17.3, '2022-02-01', '2022-03-01');

INSERT INTO flat
VALUES (DEFAULT, 1, 112, 1, 11523687, 'luxury', 4, 1, 3),
       (DEFAULT, 2, 91, 1, 9621780, 'luxury', 2, 2, 2),
       (DEFAULT, 3, 100, 2, 11320000.43, 'standard', 3, 4, 2),
       (DEFAULT, 4, 76, 2, 1100060.43, 'standard', 1, 1, 1),
       (DEFAULT, 5, 150, 2, 11156890.12, 'standard', 5, 4, 2),
       (DEFAULT, 6, 100, 2, 1320000.98, 'standard', 3, 4, 1),
       (DEFAULT, 7, 146, 2, 11113890.43, 'standard', 2, 3, 1),
       (DEFAULT, 8, 92, 2, 4256890.43, 'standard', 2, 4, 1),
       (DEFAULT, 9, 78, 2, 4256000.43, 'standard', 2, 3, 2);

INSERT INTO service
VALUES (DEFAULT, 2, 1, 100.25),
       (DEFAULT, 1, 1, 1.50),
       (DEFAULT, 3, 4, 1.00),
       (DEFAULT, 4, 6, 1.50),
       (DEFAULT, 7, 10, 1.00),
       (DEFAULT, 9, 11, 1.75);

INSERT INTO person_has_flat
VALUES (DEFAULT, 3, 1, 1, '2005-04-05'),
       (DEFAULT, 8, 2, 1, '2007-12-23'),
       (DEFAULT, 6, 8, 1, '2008-11-17'),
       (DEFAULT, 9, 6, 1, '2003-09-19'),
       (DEFAULT, 6, 4, 1, '1999-03-09'),
       (DEFAULT, 8, 5, 1, '1998-06-07'),
       (DEFAULT, 3, 7, 1, '2001-02-27'),
       (DEFAULT, 9, 11, 1, '2003-05-30'),
       (DEFAULT, 2, 11, 1, '2008-06-21'),
       (DEFAULT, 4, 7, 1, '2010-05-20'),
       (DEFAULT, 5, 5, 1, '2011-06-21'),
       (DEFAULT, 7, 4, 1, '2011-07-29'),
       (DEFAULT, 9, 3, 1, '2012-06-30'),
       (DEFAULT, 1, 3, 1, '2014-09-30'),
       (DEFAULT, 6, 3, 1, '2018-10-31');

INSERT INTO service
VALUES (DEFAULT, 1, 2, 3.00),
       (DEFAULT, 1, 3, 2.40),
       (DEFAULT, 1, 4, 1.40),
       (DEFAULT, 1, 5, 1.20),
       (DEFAULT, 1, 6, 2.40),
       (DEFAULT, 1, 7, 1.80),
       (DEFAULT, 1, 8, 3.73),
       (DEFAULT, 1, 9, 1.32),
       (DEFAULT, 1, 10, 1.11),
       (DEFAULT, 1, 11, 1.23),
       (DEFAULT, 2, 2, 3.04),
       (DEFAULT, 2, 3, 2.44),
       (DEFAULT, 2, 4, 1.44),
       (DEFAULT, 2, 5, 1.24),
       (DEFAULT, 2, 6, 2.44),
       (DEFAULT, 2, 7, 1.84),
       (DEFAULT, 2, 8, 3.74),
       (DEFAULT, 2, 9, 1.34),
       (DEFAULT, 2, 10, 1.41),
       (DEFAULT, 2, 11, 1.43),
       (DEFAULT, 3, 2, 3.00),
       (DEFAULT, 3, 3, 2.40),
       (DEFAULT, 3, 4, 1.40),
       (DEFAULT, 3, 5, 1.20),
       (DEFAULT, 3, 6, 2.40),
       (DEFAULT, 3, 7, 1.80),
       (DEFAULT, 3, 8, 3.73),
       (DEFAULT, 3, 9, 1.32),
       (DEFAULT, 3, 10, 1.11),
       (DEFAULT, 3, 11, 1.23),
       (DEFAULT, 4, 2, 3.00),
       (DEFAULT, 4, 3, 2.40),
       (DEFAULT, 4, 4, 1.40),
       (DEFAULT, 4, 5, 1.20),
       (DEFAULT, 4, 6, 2.40),
       (DEFAULT, 4, 7, 1.80),
       (DEFAULT, 4, 8, 3.73),
       (DEFAULT, 4, 9, 1.32),
       (DEFAULT, 4, 10, 1.11),
       (DEFAULT, 4, 11, 1.23),
       (DEFAULT, 5, 2, 3.50),
       (DEFAULT, 5, 3, 2.50),
       (DEFAULT, 5, 4, 1.50),
       (DEFAULT, 5, 5, 1.50),
       (DEFAULT, 5, 6, 2.50),
       (DEFAULT, 5, 7, 1.50),
       (DEFAULT, 5, 8, 3.53),
       (DEFAULT, 5, 9, 1.52),
       (DEFAULT, 5, 10, 1.51),
       (DEFAULT, 5, 11, 1.53),
       (DEFAULT, 6, 2, 3.50),
       (DEFAULT, 6, 3, 2.50),
       (DEFAULT, 6, 4, 1.50),
       (DEFAULT, 6, 5, 1.50),
       (DEFAULT, 6, 6, 2.50),
       (DEFAULT, 6, 7, 1.50),
       (DEFAULT, 6, 8, 3.53),
       (DEFAULT, 6, 9, 1.52),
       (DEFAULT, 6, 10, 1.51),
       (DEFAULT, 6, 11, 1.53),
       (DEFAULT, 7, 2, 3.50),
       (DEFAULT, 7, 3, 2.50),
       (DEFAULT, 7, 4, 1.50),
       (DEFAULT, 7, 5, 1.50),
       (DEFAULT, 7, 6, 2.50),
       (DEFAULT, 7, 7, 1.50),
       (DEFAULT, 7, 8, 3.53),
       (DEFAULT, 7, 9, 1.52),
       (DEFAULT, 7, 10, 1.51),
       (DEFAULT, 7, 11, 1.53),
       (DEFAULT, 8, 2, 3.87),
       (DEFAULT, 8, 3, 2.87),
       (DEFAULT, 8, 4, 1.87),
       (DEFAULT, 8, 5, 1.87),
       (DEFAULT, 8, 6, 2.87),
       (DEFAULT, 8, 7, 1.87),
       (DEFAULT, 8, 8, 3.87),
       (DEFAULT, 8, 9, 1.87),
       (DEFAULT, 8, 10, 1.87),
       (DEFAULT, 8, 11, 1.87),
       (DEFAULT, 9, 2, 3.70),
       (DEFAULT, 9, 3, 2.70),
       (DEFAULT, 9, 4, 1.70),
       (DEFAULT, 9, 5, 1.70),
       (DEFAULT, 9, 6, 2.70),
       (DEFAULT, 9, 7, 1.70),
       (DEFAULT, 9, 8, 3.73),
       (DEFAULT, 9, 9, 1.72),
       (DEFAULT, 9, 10, 1.71),
       (DEFAULT, 9, 11, 1.73),
       (DEFAULT, 10, 2, 3.00),
       (DEFAULT, 10, 3, 2.00),
       (DEFAULT, 10, 4, 1.00),
       (DEFAULT, 10, 5, 1.00),
       (DEFAULT, 10, 6, 2.00),
       (DEFAULT, 10, 7, 1.00),
       (DEFAULT, 10, 8, 3.03),
       (DEFAULT, 10, 9, 1.02),
       (DEFAULT, 10, 10, 1.01),
       (DEFAULT, 10, 11, 1.03),
       (DEFAULT, 11, 2, 3.60),
       (DEFAULT, 11, 3, 2.60),
       (DEFAULT, 11, 4, 1.60),
       (DEFAULT, 11, 5, 1.60),
       (DEFAULT, 11, 6, 2.60),
       (DEFAULT, 11, 7, 1.60),
       (DEFAULT, 11, 8, 3.63),
       (DEFAULT, 11, 9, 1.62),
       (DEFAULT, 11, 10, 1.61),
       (DEFAULT, 11, 11, 1.63);

INSERT INTO payment
VALUES (DEFAULT, 1, 1, 'CHP 1', '2022-02-01', '2022-03-01', '2022-03-02 15:56', 12.60),
       (DEFAULT, 2, 2, 'CHP 1', '2022-02-01', '2022-03-01', '2022-03-04 13:00', 15.75),
       (DEFAULT, 3, 4, 'Vodokanal', '2022-02-01', '2022-03-01', '2022-03-01 15:56', 53.98),
       (DEFAULT, 4, 6, 'Marienergo', '2021-11-01', '2021-12-01', '2021-12-02 12:55', 4.82),
       (DEFAULT, 5, 7, 'LLC "Landscaping"', '2021-11-01', '2021-12-01', '2021-12-03 13:44', 1204.54),
       (DEFAULT, 6, 14, 'CHP 1', '2022-02-01', '2022-03-01', '2022-03-03 09:56', 54.88),
       (DEFAULT, 7, 13, 'Gazprom mezhregiongaz Yoshkar-Ola', '2022-02-01', '2022-03-01', '2022-03-12 12:51', 38.30),
       (DEFAULT, 8, 16, 'CHP 1', '2022-10-01', '2022-11-01', '2022-11-02 00:50', 4.98),
       (DEFAULT, 9, 32,
        'Republican Fund for Capital Repairs of Common Property in apartment buildings in the territory of the Mari Republic',
        '2022-02-01', '2022-03-01', '2022-03-02 10:50', 21.28);

# 3.1.b
INSERT INTO building (address, date_commissioning, type, owner, cost)
VALUES ('Yoshkar-Ola, Chavayna boulevard 23, 424000', '2005-05-06', 'brick', 'OOO AA1', 23680311.99);

# 3.1.c
INSERT INTO building (type, owner, address, date_commissioning, cost)
SELECT type, owner, address, date_commissioning, cost
FROM apartment_building;

#3.2 DELETE
#3.2.a
TRUNCATE TABLE building;

#3.2.b
DELETE
FROM building
WHERE date_commissioning < '1900-01-01';

#3.3 UPDATE
#3.3.a
UPDATE utility_rate
SET price = price * 2;

#3.3.b
UPDATE service, flat
SET service.rate_coefficient = service.rate_coefficient * 2
WHERE service.id_utility_rate = 1
  AND flat.area > 100;

#3.3.c
UPDATE apartment_building
SET owner = 'Moscow government',
    cost  = cost * 1.5
WHERE id_apartment_building = 1;

#3.4 SELECT
#3.4.a
SELECT first_name, last_name
FROM person;

#3.4.b
SELECT *
FROM person;

#3.4.c
SELECT *
FROM person
WHERE date_birth > '1999-12-12';

#3.5 SELECT ORDER BY + LIMIT
#3.5.a
SELECT *
FROM person
ORDER BY first_name
LIMIT 3,5;

#3.5.b
SELECT first_name, last_name
FROM person
ORDER BY first_name DESC;

#3.5.c
SELECT *
FROM person
ORDER BY first_name,
         last_name
LIMIT 5;

#3.5.d
SELECT *
FROM person
ORDER BY 4 DESC;

#3.6 Работа с датами
#3.6.a
SELECT *
FROM payment
WHERE datetime_payment > '2022-03-01 00:00';

#3.6.b
SELECT *
FROM payment
WHERE datetime_payment BETWEEN '2022-03-01 00:00' AND '2022-03-03 00:00';

#3.6.c
SELECT first_name, last_name, YEAR(date_birth) AS birth_year
FROM person;

#3.7 Функции агрегации
#3.7.a
SELECT COUNT(id_person) AS person_count
FROM person;

#3.7.b
SELECT COUNT(DISTINCT id_person) AS payment_count
FROM payment;

#3.7.c
SELECT DISTINCT last_name
FROM person;

#3.7.d
SELECT MAX(cost) AS max_cost
FROM apartment_building;

#3.7.e
SELECT MIN(cost) AS min_cost
FROM apartment_building;

#3.7.f
SELECT type, COUNT(*) AS count
FROM flat
GROUP BY type;

#3.8 SELECT GROUP BY + HAVING
# находим тип квартиры и их заданное условием количество
SELECT type, COUNT(*) AS count
FROM flat
GROUP BY type
HAVING COUNT(*) > 2;

#
SELECT id_flat, COUNT(*) AS count
FROM service
GROUP BY id_flat
HAVING COUNT(*) > 1;

# находим услуги, которые были подключены более чем к 10 квартирам
SELECT id_utility_rate, COUNT(*) AS count
FROM service
GROUP BY id_utility_rate
HAVING COUNT(*) > 10;

# находим квартиры, у которых больше 2 владельцев
SELECT id_flat, COUNT(*) AS count
FROM person_has_flat
GROUP BY id_flat
HAVING COUNT(*) > 2;

#3.9 SELECT JOIN
/* 3.9.a */
SELECT *
FROM payment
         LEFT JOIN person p ON p.id_person = payment.id_person
WHERE YEAR(p.date_birth) > '1995';

/* 3.9.b */
SELECT *
FROM person
         RIGHT JOIN payment p ON person.id_person = p.id_person
WHERE YEAR(person.date_birth) > '1995';

/* 3.9.c */
SELECT *
FROM payment
         LEFT JOIN person p ON p.id_person = payment.id_person
         LEFT JOIN service s ON payment.id_service = s.id_utility_rate
WHERE payment.total > 10
  AND YEAR(p.date_birth) > '2000'
  AND s.rate_coefficient > 1;

/* 3.9.d */
SELECT *
FROM building b
         INNER JOIN apartment_building ab ON b.address = ab.address;

#3.10 Подзапросы
SELECT *
FROM person
WHERE id_person IN (SELECT id_person FROM payment);

#3.10.b
SELECT p.id_payment,
       p.payee,
       (SELECT ps.date_birth FROM person ps WHERE ps.id_person = 7) as id_person
FROM payment p
WHERE p.id_person = 7;

#3.10.c
SELECT *
FROM (SELECT * FROM payment WHERE datetime_payment BETWEEN '2022-03-01 00:00' AND '2022-03-03 00:00') AS march_payment;

#3.10.d
SELECT *
FROM person p
         JOIN (SELECT * FROM person_has_flat WHERE id_flat = 3) phf
              ON p.id_person = phf.id_person