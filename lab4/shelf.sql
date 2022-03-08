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

INSERT INTO building
VALUES (DEFAULT, 'brick', 'Department of Urban Planning Regulation of Moscow', 'Moscow, 53 Arbat Street', '1825-06-07',
        132456873.12);

INSERT INTO flat
VALUES (DEFAULT, 3, 238, 1, 43256890.43, 'luxury', 6, 0, 1);

INSERT INTO service
VALUES (DEFAULT, 1, 1, '2022-02-01', '2022-03-01', 1);

INSERT INTO building
    VALUES (DEFAULT, 'panel', 'Management company #1 of Yoshkar-Ola', 'Yoshkar-Ola, 2 Kirova Street', '1989-05-01',
        95248602.32);

INSERT INTO flat
VALUES (DEFAULT, 120, 48, 2, 2435000.21, 'standard', 2, 3, 1);

INSERT INTO person_has_flat
VALUES (DEFAULT, 6, 2, 1, '2010-01-04');

INSERT INTO service
VALUES (DEFAULT, 2, 1, '2022-02-01', '2022-03-01', 1.25);

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
VALUES (DEFAULT, 2, 1, '2022-02-01', '2022-03-01', 100.25),
       (DEFAULT, 1, 1, '2022-02-01', '2022-03-01', 1.50),
       (DEFAULT, 3, 4, '2021-09-01', '2022-10-01', 1.00),
       (DEFAULT, 4, 6, '2021-10-01', '2022-11-01', 1.50),
       (DEFAULT, 7, 10, '2022-02-01', '2022-03-01', 1.00),
       (DEFAULT, 9, 11, '2022-02-01', '2022-03-01', 1.75);

INSERT INTO person_has_flat
VALUES (DEFAULT, 6, 2, 1, '2010-01-04'),
       (DEFAULT, 6, 2, 1, '2010-01-04'),
       (DEFAULT, 6, 2, 1, '2010-01-04'),
       (DEFAULT, 6, 2, 1, '2010-01-04'),
       (DEFAULT, 6, 2, 1, '2010-01-04'),
       (DEFAULT, 6, 2, 1, '2010-01-04'),
       (DEFAULT, 6, 2, 1, '2010-01-04');
