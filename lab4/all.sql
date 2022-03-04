/* 3.1 INSERT */
/* 3.1.a */
INSERT INTO person
VALUES (DEFAULT, 'Alexander', 'Pushkin', '1799-05-26', NULL, NULL, NULL);

INSERT INTO person
VALUES (DEFAULT, 'Ivan', 'Ivanov', '1999-05-27', NULL, NULL, NULL);

INSERT INTO person
VALUES (DEFAULT, 'Petr', 'Petrov', '2001-05-01', NULL, NULL, NULL);

INSERT INTO person
VALUES (DEFAULT, 'Petr', 'Ivanov', '2000-05-01', NULL, NULL, NULL);

INSERT INTO person
VALUES (DEFAULT, 'John', 'Doe', '2000-08-06', '01234567899', NULL, NULL);

/* 3.1.b */
INSERT INTO building (address, date_commissioning, type, owner, cost)
VALUES ('Moscow, 53 Arbat Street, 119002', '1830-01-01', 'brick', 'Moscow government', 10000000);

INSERT INTO building (address, date_commissioning, type, owner, cost)
VALUES ('Yoshkar-Ola, 19, Petrova Street, 424000', '1990-02-01', 'panel', 'Management company 1', 4590000);

INSERT INTO utility_rate (name, description, price, date_start, date_end)
VALUES ('heating', NULL, 3500, '2022-01-02', '2022-01-03');

/* 3.1.c */
INSERT INTO expense (name, description, price, date_start, date_end)
SELECT name, description, price, date_start, date_end
FROM utility_rate;

/* 3.2 DELETE */
/* 3.2.a */
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE person;

/* 3.2.b */
DELETE
FROM person
WHERE date_birth = '1799-05-26';

/* 3.3 UPDATE */
/* 3.3.a */
UPDATE building
SET cost = cost * 10;

/* 3.3.b */
UPDATE building
SET cost = cost * 10
WHERE address = 'Moscow, 53 Arbat Street, 119002';

/* 3.3.c */
UPDATE building
SET cost  = cost / 10,
    owner = 'Russian Federation government'
WHERE address = 'Moscow, 53 Arbat Street, 119002';

/* 3.4.SELECT */
/* 3.4.a */
SELECT address, cost FROM building;

/* 3.4.b */
SELECT * FROM person;

/* 3.4.c */
SELECT * FROM person
WHERE date_birth = '2000-08-06';

/* 3.5. SELECT ORDER BY + TOP (LIMIT) */
SELECT * FROM person
ORDER BY first_name
LIMIT 3;

/* 3.5.b */
SELECT * FROM person
ORDER BY first_name DESC;

/* 3.5.c */
SELECT * FROM person
ORDER BY first_name, last_name
LIMIT 3;

/* 3.5.b */
SELECT first_name, last_name, date_birth FROM person
ORDER BY 1;

INSERT INTO payment
VALUES (DEFAULT, 3, 1, '2022-02-01', '2022-03-01', '2022-02-28 17:05:00', 1000);

INSERT INTO payment
VALUES (DEFAULT, 4, 1, '2022-01-01', '2022-02-01', '2022-02-28 13:55:59', 800);

INSERT INTO payment
VALUES (DEFAULT, 5, 1, '2021-12-01', '2022-01-01', '2022-02-28 17:05:00', 942);

INSERT INTO payment
VALUES (DEFAULT, 6, 1, '2022-11-01', '2022-12-01', '2022-02-28 01:05:30', 650);

INSERT INTO payment
VALUES (DEFAULT, 6, 1, '2021-11-01', '2022-12-01', '2022-02-28 12:05:30', 500);

INSERT INTO payment
VALUES (DEFAULT, 7, 1, '2021-11-01', '2021-12-01', '2022-01-31 00:05:30', 750);

INSERT INTO payment
VALUES (DEFAULT, 7, 1, '2021-11-01', '2021-12-01', '2021-01-31 00:05:30', 750);

INSERT INTO payment
VALUES (DEFAULT, 7, 1, '2020-11-01', '2020-12-01', '2020-01-31 00:05:30', 100);

/* 3.6. Работа с датами */
/* 3.6.a */
SELECT * FROM payment
WHERE datetime_payment = '2022-02-28 17:05:00';

/* 3.6.b */
SELECT * FROM payment
WHERE `period_start` BETWEEN '2021-11-01' AND '2022-01-01';

/* 3.6.c */
SELECT * FROM payment
WHERE YEAR(datetime_payment) BETWEEN '2020' AND '2021';

/* 3.7.Функции агрегации */
/* 3.7.a */
SELECT COUNT(*) FROM payment;

/* 3.7.b */
SELECT COUNT(DISTINCT date_birth) FROM person;

/* 3.7.c */
SELECT DISTINCT first_name FROM person;

/* 3.7.d */
SELECT MAX(cost) FROM building;

/* 3.7.e */
SELECT MIN(cost) FROM building;

/* 3.7.f */
SELECT first_name, COUNT(first_name) AS first_name_count FROM person
GROUP BY first_name;

/* 3.8.SELECT GROUP BY + HAVING */
/* Группируем все дома по адресу, стоимость которых больше указанной */
SELECT address, COUNT(DISTINCT address) FROM building
GROUP BY cost
HAVING cost > 9999999;

/* Группируем всех людей, рожденных после 1999 */
SELECT id_person, COUNT(date_birth), date_birth FROM person
GROUP BY date_birth
HAVING YEAR(date_birth) >= '2000';

INSERT INTO utility_rate VALUES (DEFAULT, 'water', NULL, 700, '2021-01-01', '2022-12-31');
INSERT INTO utility_rate VALUES (DEFAULT, 'gas', NULL, 500, '2021-07-01', '2022-12-31');
INSERT INTO utility_rate VALUES (DEFAULT, 'gas', NULL, 600, '2021-06-01', '2022-12-31');
INSERT INTO utility_rate VALUES (DEFAULT, 'gas', NULL, 742, '2021-05-01', '2022-12-31');
INSERT INTO utility_rate VALUES (DEFAULT, 'water', NULL, 742, '2021-05-01', '2022-12-31');

/* Находим значения цен на коммунальные услуги */
SELECT `price`, COUNT(`price`) FROM `utility_rate`
GROUP BY `price`
HAVING `price` >= '500';

/* 3.9. SELECT JOIN */
/* 3.9.a */
SELECT * FROM payment LEFT JOIN person p ON p.id_person = payment.id_person
WHERE YEAR(p.date_birth) > '2000';

/* 3.9.b */
SELECT * FROM person RIGHT JOIN payment p ON person.id_person = p.id_person
WHERE YEAR(person.date_birth) > '2000';

/* 3.9.c */
SELECT * FROM payment
LEFT JOIN person p ON p.id_person = payment.id_person
LEFT JOIN utility_rate ur ON payment.id_utility_rate = ur.id_utility_rate
WHERE payment.cost > 200 AND YEAR(p.date_birth) > '2000' AND ur.price > 400;

/* 3.9.d */
SELECT * FROM utility_rate ur
INNER JOIN expense e on ur.name = e.name;

/* Все платившие */
SELECT * FROM person WHERE id_person IN (SELECT id_person FROM payment);








