-- 1. Добавить внешние ключи
ALTER TABLE room
    ADD CONSTRAINT room_hotel_id_hotel_fk
        FOREIGN KEY (id_hotel) REFERENCES hotel (id_hotel);

ALTER TABLE room
    ADD CONSTRAINT room_room_category_id_room_category_fk
        FOREIGN KEY (id_room_category) REFERENCES room_category (id_room_category);

ALTER TABLE booking
    ADD CONSTRAINT booking_client_id_client_fk
        FOREIGN KEY (id_client) REFERENCES client (id_client);

ALTER TABLE room_in_booking
    ADD CONSTRAINT room_in_booking_room_id_room_fk
        FOREIGN KEY (id_room) REFERENCES room (id_room);

ALTER TABLE room_in_booking
    ADD CONSTRAINT room_in_booking_booking_id_booking_fk
        FOREIGN KEY (id_booking) REFERENCES booking (id_booking);

SELECT *
FROM hotel
WHERE name = 'Космос';

SELECT *
FROM room_in_booking rib
WHERE '2019-04-01' BETWEEN checkin_date AND checkout_date
  AND rib.id_room IN
      (SELECT t.id_room
       FROM (SELECT id_hotel, r.id_room
             FROM room r
             WHERE id_room_category IN
                   (SELECT id_room_category
                    FROM room_category
                    WHERE name = 'Люкс')) t
       WHERE t.id_hotel IN
             (SELECT h.id_hotel
              FROM hotel h
              WHERE h.name = 'Космос'));

SELECT id_client
FROM booking b
WHERE b.id_booking IN
      (SELECT rib.id_booking
       FROM room_in_booking rib
       WHERE '2019-04-01' BETWEEN checkin_date AND checkout_date
         AND rib.id_room IN
             (SELECT t.id_room
              FROM (SELECT id_hotel, r.id_room
                    FROM room r
                    WHERE id_room_category IN
                          (SELECT id_room_category
                           FROM room_category
                           WHERE name = 'Люкс')) t
              WHERE t.id_hotel IN
                    (SELECT h.id_hotel
                     FROM hotel h
                     WHERE h.name = 'Космос'))
      );

SELECT *
FROM room r
WHERE id_room_category IN (SELECT id_room_category FROM room_category WHERE name = 'Люкс');

SELECT *
FROM (SELECT *
      FROM room r
      WHERE id_room_category IN (SELECT id_room_category FROM room_category WHERE name = 'Люкс')) t
WHERE t.id_hotel IN (SELECT h.id_hotel FROM hotel h WHERE h.name = 'Космос');

-- 2. Выдать информацию о клиентах гостиницы “Космос”, проживающих в номерах категории “ Люкс” на 1 апреля 2019г
SELECT *
FROM client c
WHERE c.id_client IN
      (SELECT id_client
       FROM booking b
       WHERE b.id_booking IN
             (SELECT rib.id_booking
              FROM room_in_booking rib
              WHERE '2019-04-01' BETWEEN checkin_date AND checkout_date
                AND rib.id_room IN
                    (SELECT t.id_room
                     FROM (SELECT id_hotel, r.id_room
                           FROM room r
                           WHERE id_room_category IN
                                 (SELECT id_room_category
                                  FROM room_category
                                  WHERE name = 'Люкс')) t
                     WHERE t.id_hotel IN
                           (SELECT h.id_hotel
                            FROM hotel h
                            WHERE h.name = 'Космос'))));

-- 3. Дать список свободных номеров всех гостиниц на 22 апреля
SELECT *
FROM room r
WHERE r.id_room IN
      (SELECT rib.id_room
       FROM room_in_booking rib
       WHERE checkin_date < '2019-04-22' or checkout_date > '2019-04-22'
          -- checkin_date >= '2019-04-22' and checkout_date <= '2019-04-22')
ORDER BY id_room;

-- 4. Дать количество проживающих в гостинице “Космос” на 23 марта по каждой категории номеров
SELECT rc.name, COUNT(*) count
FROM room_category rc
         LEFT JOIN room r on rc.id_room_category = r.id_room_category
         LEFT JOIN room_in_booking rib on r.id_room = rib.id_room
WHERE '2019-03-23' BETWEEN rib.checkin_date AND rib.checkout_date
  AND r.id_hotel IN
      (SELECT h.id_hotel
       FROM hotel h
       WHERE h.name = 'Космос')
GROUP BY rc.name;

-- 5. Дать список последних проживавших клиентов по всем комнатам гостиницы “Космос”, выехавшим в апреле с указанием даты выезда.
SELECT *
FROM client c
         JOIN booking b2 on c.id_client = b2.id_client
         JOIN
     (SELECT rib.id_room, rib.id_booking, MAX(checkout_date) max_checkout_date
      FROM client
               LEFT JOIN booking b on client.id_client = b.id_client
               LEFT JOIN room_in_booking rib on b.id_booking = rib.id_booking
      WHERE MONTH(rib.checkout_date) = '4'
        AND rib.id_room IN
            (SELECT id_room
             FROM room r
             WHERE r.id_hotel IN
                   (SELECT id_hotel
                    FROM hotel h
                    WHERE h.name = 'Космос'))
      GROUP BY rib.id_room
     ) t1 ON b2.id_booking = t1.id_booking;

-- 6.Продлить на 2 дня дату проживания в гостинице “Космос” всем клиентам комнат категории “Бизнес”, которые заселились 10мая.
UPDATE room_in_booking rib
SET rib.checkout_date = DATE_ADD(rib.checkout_date, INTERVAL 2 DAY)
WHERE checkin_date = '2019-05-10'
  AND id_room IN
      ((SELECT id_room
        FROM room r
        WHERE r.id_hotel IN
              (SELECT id_hotel
               FROM hotel h
               WHERE h.name = 'Космос')
          AND r.id_room_category IN
              (SELECT rc.id_room_category
               FROM room_category rc
               WHERE rc.name = 'Бизнес')));

SELECT *
FROM room_in_booking rib
WHERE checkin_date = '2019-05-10'
  AND id_room IN
      ((SELECT id_room
        FROM room r
        WHERE r.id_hotel IN
              (SELECT id_hotel
               FROM hotel h
               WHERE h.name = 'Космос')
          AND r.id_room_category IN
              (SELECT rc.id_room_category
               FROM room_category rc
               WHERE rc.name = 'Бизнес')));

UPDATE room_in_booking rib
SET rib.checkout_date = DATE_SUB(rib.checkout_date, INTERVAL 2 DAY)
WHERE checkin_date = '2019-05-10'
  AND id_room IN
      ((SELECT id_room
        FROM room r
        WHERE r.id_hotel IN
              (SELECT id_hotel
               FROM hotel h
               WHERE h.name = 'Космос')
          AND r.id_room_category IN
              (SELECT rc.id_room_category
               FROM room_category rc
               WHERE rc.name = 'Бизнес')));

-- 7. Найти все "пересекающиеся" варианты проживания.
SELECT *
FROM room_in_booking rib1
        JOIN room_in_booking rib2 on rib1.id_room = rib2.id_room and rib1.id_room_in_booking != rib2.id_room_in_booking
WHERE ((rib1.checkin_date BETWEEN rib2.checkin_date AND rib2.checkout_date)
    OR (rib1.checkout_date > rib2.checkin_date && rib1.checkout_date < rib2.checkout_date))

-- 8. Создать бронирование в транзакции
START TRANSACTION;

INSERT INTO booking (id_booking, id_client, booking_date)
VALUES (DEFAULT, 1, '2022-03-18');
INSERT INTO room_in_booking (id_room_in_booking, id_booking, id_room, checkin_date, checkout_date)
VALUES (DEFAULT, LAST_INSERT_ID(), 1, '2022-03-19', '2022-03-30');

COMMIT;

-- 9. Создать индексы
CREATE INDEX booking_id_client_index
    ON booking (id_client);

CREATE INDEX room_id_hotel_index
    ON room (id_hotel);

CREATE INDEX room_id_room_category_index
    ON room (id_room_category);

CREATE INDEX room_in_booking_id_booking_index
    ON room_in_booking (id_booking);

CREATE INDEX room_in_booking_id_room_index
    ON room_in_booking (id_room);