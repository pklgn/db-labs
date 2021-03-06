-- 1. Добавить внешние ключи.
ALTER TABLE `order`
    ADD CONSTRAINT FK_order_id_pharmacy
        FOREIGN KEY (id_pharmacy) REFERENCES pharmacy (id_pharmacy)
            ON UPDATE CASCADE;

ALTER TABLE `order`
    ADD CONSTRAINT FK_order_id_dealer
        FOREIGN KEY (id_dealer) REFERENCES dealer (id_dealer)
            ON UPDATE CASCADE;

ALTER TABLE `order`
    ADD CONSTRAINT FK_order_id_production
        FOREIGN KEY (id_production) REFERENCES production (id_production)
            ON UPDATE CASCADE;

ALTER TABLE production
    ADD CONSTRAINT FK_production_id_company
        FOREIGN KEY (id_company) REFERENCES company (id_company)
            ON UPDATE CASCADE;

ALTER TABLE production
    ADD CONSTRAINT FK_production_id_medicine
        FOREIGN KEY (id_medicine) REFERENCES medicine (id_medicine)
            ON UPDATE CASCADE;

ALTER TABLE dealer
    ADD CONSTRAINT FK_dealer_id_company
        FOREIGN KEY (id_company) REFERENCES company (id_company)
            ON UPDATE CASCADE;

-- 2. Выдать информацию по всем заказам лекарства “Кордерон” компании “Аргус” с указанием названий аптек, дат, объема заказов
SELECT ph.name, o.date, o.quantity
FROM `order` o
         JOIN production p ON o.id_production = p.id_production
         JOIN company c ON c.id_company = p.id_company AND c.name = 'Аргус'
         JOIN medicine m ON p.id_medicine = m.id_medicine AND m.name = 'Кордеон'
         JOIN pharmacy ph on o.id_pharmacy = ph.id_pharmacy
ORDER BY o.quantity;

-- 3. Дать список лекарств компании “Фарма”, на которые не были сделаны заказы до 25 января
SELECT m.name
FROM production p
    JOIN company c on p.id_company = c.id_company AND c.name = 'Фарма'
    JOIN `order` o on p.id_production = o.id_production AND o.date < '2019-01-25'
    RIGHT JOIN medicine m on m.id_medicine = p.id_medicine
WHERE o.id_order IS NULL;

-- 4. Дать минимальный и максимальный баллы лекарств каждой фирмы, которая оформила не менее 120 заказов
SELECT p.id_company, MIN(p.rating) AS min_rating, MAX(p.rating) AS max_rating, COUNT(*) AS count
FROM `order` o
         JOIN production p on o.id_production = p.id_production
GROUP BY p.id_company
HAVING count > 120;

-- 5. Дать списки сделавших заказы аптек по всем дилерам компании “AstraZeneca”. Если у дилера нет заказов, в названии аптеки проставить NULL
SELECT p.name, d.name
FROM `order` o
         JOIN pharmacy p on o.id_pharmacy = p.id_pharmacy
         RIGHT JOIN dealer d on d.id_dealer = o.id_dealer
         JOIN company c on c.id_company = d.id_company AND c.name = 'AstraZeneca';

-- 6. Уменьшить на 20% стоимость всех лекарств, если она превышает 3000, а длительность лечения не более 7 дней
UPDATE production p
    JOIN medicine m ON p.id_medicine = m.id_medicine
SET p.price = 0.8 * p.price
WHERE p.price > 3000
  AND m.cure_duration <= 7;

-- 7. Добавить необходимые индексы
-- Используется в запросе 6
CREATE INDEX IX_production_price
    ON production (price);

-- Используется в запросе 6
CREATE INDEX IX_medicine_cure_duration
    ON medicine (cure_duration);

-- Используется в запросе 2, 3
CREATE INDEX IX_medicine_name
    ON medicine (name);

-- Используется в запросе 2, 3
CREATE INDEX IX_order_date
    ON `order` (date);

-- Используется в запросах 2, 3, 5
CREATE INDEX IX_company_name
    ON company (name);