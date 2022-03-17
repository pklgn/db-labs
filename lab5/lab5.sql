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

SELECT *
FROM room r
WHERE r.id_room NOT IN
      (SELECT rib.id_room
       FROM room_in_booking rib
       WHERE '2019-04-22' BETWEEN checkin_date AND checkout_date)
ORDER BY id_hotel;

