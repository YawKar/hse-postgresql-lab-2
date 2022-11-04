<!-- TOC -->
# Контент
* [Решение](#Решение)
  * [Задание 1](#Задание-1)
  * [Задание 2](#Задание-2)
  * [Задание 3](#Задание-3)
  * [Задание 4](#Задание-4)
  * [Задание 5](#Задание-5)
  * [Задание 6](#Задание-6)
  * [Задание 7](#Задание-7)
  * [Задание 8](#Задание-8)
  * [Задание 9](#Задание-9)
  * [Задание 10](#Задание-10)
  * [Задание 11](#Задание-11)
  * [Задание 12](#Задание-12)
  * [Задание 13](#Задание-13)
  * [Задание 14](#Задание-14)
  * [Задание 15](#Задание-15)
<!-- TOC -->

# Решение
## Задание 1
[К таблице контента](#Контент)
#### SQL:
```postgresql
CREATE TABLE Наниматель (
Идентификатор        BIGINT          PRIMARY KEY,
Название             VARCHAR(60)     NOT NULL,
Место_расположения   VARCHAR(60)     NOT NULL,
Льгота_процент       DECIMAL(4, 2)   NOT NULL    CHECK(Льгота_процент BETWEEN 0 AND 100)
);
CREATE TABLE Бюро_найма (
Идентификатор        BIGINT          PRIMARY KEY,
Номер                VARCHAR(60)     NOT NULL,
Адрес_конторы        VARCHAR(60)     NOT NULL,
Плата_процент        DECIMAL(4, 2)   NOT NULL    CHECK(Плата_процент BETWEEN 0 AND 100)
);
CREATE TABLE Профессии (
Идентификатор        BIGINT          PRIMARY KEY,
Название             VARCHAR(60)     NOT NULL,
Стоимость_найма_руб  INT             NOT NULL    CHECK(Стоимость_найма_руб > 0),
Количество           INT             NOT NULL    CHECK(Количество >= 0),
Прежнее_место_работы VARCHAR(60)
);
CREATE TABLE Трудовой_договор (
Номер_договора       BIGINT          PRIMARY KEY,
Дата                 DATE            NOT NULL,
Наниматель           BIGINT          NOT NULL     REFERENCES Наниматель (Идентификатор),
Бюро_найма           BIGINT          NOT NULL     REFERENCES Бюро_найма (Идентификатор),
Профессия            BIGINT          NOT NULL     REFERENCES Профессии (Идентификатор),
Количество_вакансий  INT             NOT NULL     CHECK(Количество_вакансий >= 0),
Оплата               INT             NOT NULL     CHECK(Оплата > 0)
);
```
#### Вывод:
Задание без вывода

## Задание 2
[К таблице контента](#Контент)
#### SQL:
```postgresql
INSERT INTO "Наниматель" ("Идентификатор", "Название", "Место_расположения", "Льгота_процент")
VALUES (1, 'Рога и копыта',            'Приморск',   0),
       (2, 'ГАЗ',                      'Н.Новгород', 20),
       (3, 'Станкостроительный завод', 'Одесса',     2),
       (4, 'КИНАП',                    'Одесса',     2),
       (5, 'КРАЗ',                     'Кременчуг',  2),
       (6, 'п\я 12687-у',              'Саранск',    10);
INSERT INTO "Бюро_найма" ("Идентификатор", "Номер", "Адрес_конторы", "Плата_процент")
VALUES (1, 'N5',  'Н.Новгород', 4),
       (2, 'N4',  'Москва',     3),
       (3, 'N12', 'Киев',       11),
       (4, 'N6',  'Н.Новгород', 3),
       (5, 'N8',  'Одесса',     9);
INSERT INTO "Профессии" ("Идентификатор", "Название", "Стоимость_найма_руб", "Количество", "Прежнее_место_работы")
VALUES (1, 'Кровельщик',   10000, 7,  'Саранск'),
       (2, 'Слесарь',      15000, 6,  'Кременчуг'),
       (3, 'Счетовод',     25000, 10, 'Москва'),
       (4, 'Фрезеровщик',  20000, 7,  'Одесса'),
       (5, 'Программист',  40000, 8,  'Киев'),
       (6, 'Автоводитель', 25000, 3,  'Приморск'),
       (7, 'Шлифовальщик', 17000, 5,  'Одесса');
INSERT INTO "Трудовой_договор" ("Номер_договора", "Дата", "Наниматель", "Бюро_найма", "Профессия", "Количество_вакансий", "Оплата")
VALUES (127, '2020-01-01', 3, 4, 6, 1, 25000),
       (128, '2020-02-01', 6, 2, 1, 2, 20000),
       (129, '2020-03-01', 1, 3, 4, 1, 20000),
       (130, '2020-04-01', 2, 1, 7, 2, 34000),
       (131, '2020-04-01', 4, 4, 6, 1, 25000),
       (132, '2020-04-01', 6, 4, 1, 1, 10000),
       (133, '2020-05-01', 5, 2, 5, 3, 120000),
       (134, '2020-05-01', 3, 3, 2, 3, 45000),
       (135, '2020-05-01', 3, 4, 1, 1, 10000),
       (136, '2020-06-01', 4, 1, 3, 4, 100000),
       (137, '2020-06-01', 1, 2, 2, 3, 45000),
       (138, '2020-06-01', 1, 3, 7, 1, 17000),
       (139, '2020-06-01', 5, 4, 1, 2, 20000),
       (140, '2020-06-01', 3, 5, 2, 1, 15000),
       (141, '2020-06-01', 3, 5, 2, 1, 15000),
       (142, '2020-07-01', 4, 2, 6, 1, 25000),
       (143, '2020-08-01', 2, 2, 7, 2, 34000);
```
#### Вывод:
Задание без вывода

## Задание 3
[К таблице контента](#Контент)
#### SQL:
```postgresql
SELECT * FROM "Наниматель";
SELECT * FROM "Бюро_найма";
SELECT * FROM "Профессии";
SELECT * FROM "Трудовой_договор";
```
#### Вывод:
| Идентификатор | Название                 | Место\_расположения | Льгота\_процент |
|:--------------|:-------------------------|:--------------------|:----------------|
| 1             | Рога и копыта            | Приморск            | 0.00            |
| 2             | ГАЗ                      | Н.Новгород          | 20.00           |
| 3             | Станкостроительный завод | Одесса              | 2.00            |
| 4             | КИНАП                    | Одесса              | 2.00            |
| 5             | КРАЗ                     | Кременчуг           | 2.00            |
| 6             | п\\я 12687-у             | Саранск             | 10.00           |

| Идентификатор | Номер | Адрес\_конторы | Плата\_процент |
|:--------------|:------|:---------------|:---------------|
| 1             | N5    | Н.Новгород     | 4.00           |
| 2             | N4    | Москва         | 3.00           |
| 3             | N12   | Киев           | 11.00          |
| 4             | N6    | Н.Новгород     | 3.00           |
| 5             | N8    | Одесса         | 9.00           |

| Идентификатор | Название     | Стоимость\_найма\_руб | Количество | Прежнее\_место\_работы |
|:--------------|:-------------|:----------------------|:-----------|:-----------------------|
| 1             | Кровельщик   | 10000                 | 7          | Саранск                |
| 2             | Слесарь      | 15000                 | 6          | Кременчуг              |
| 3             | Счетовод     | 25000                 | 10         | Москва                 |
| 4             | Фрезеровщик  | 20000                 | 7          | Одесса                 |
| 5             | Программист  | 40000                 | 8          | Киев                   |
| 6             | Автоводитель | 25000                 | 3          | Приморск               |
| 7             | Шлифовальщик | 17000                 | 5          | Одесса                 |

| Номер\_договора | Дата       | Наниматель | Бюро\_найма | Профессия | Количество\_вакансий | Оплата |
|:----------------|:-----------|:-----------|:------------|:----------|:---------------------|:-------|
| 127             | 2020-01-01 | 3          | 4           | 6         | 1                    | 25000  |
| 128             | 2020-02-01 | 6          | 2           | 1         | 2                    | 20000  |
| 129             | 2020-03-01 | 1          | 3           | 4         | 1                    | 20000  |
| 130             | 2020-04-01 | 2          | 1           | 7         | 2                    | 34000  |
| 131             | 2020-04-01 | 4          | 4           | 6         | 1                    | 25000  |
| 132             | 2020-04-01 | 6          | 4           | 1         | 1                    | 10000  |
| 133             | 2020-05-01 | 5          | 2           | 5         | 3                    | 120000 |
| 134             | 2020-05-01 | 3          | 3           | 2         | 3                    | 45000  |
| 135             | 2020-05-01 | 3          | 4           | 1         | 1                    | 10000  |
| 136             | 2020-06-01 | 4          | 1           | 3         | 4                    | 100000 |
| 137             | 2020-06-01 | 1          | 2           | 2         | 3                    | 45000  |
| 138             | 2020-06-01 | 1          | 3           | 7         | 1                    | 17000  |
| 139             | 2020-06-01 | 5          | 4           | 1         | 2                    | 20000  |
| 140             | 2020-06-01 | 3          | 5           | 2         | 1                    | 15000  |
| 141             | 2020-06-01 | 3          | 5           | 2         | 1                    | 15000  |
| 142             | 2020-07-01 | 4          | 2           | 6         | 1                    | 25000  |
| 143             | 2020-08-01 | 2          | 2           | 7         | 2                    | 34000  |


## Задание 4
[К таблице контента](#Контент)
#### SQL:
```postgresql
-- a.)
SELECT "Название", "Место_расположения"
FROM "Наниматель";

-- b.)
SELECT "Номер"
FROM "Бюро_найма";

-- c.)
SELECT "Название", SUM("Количество")
FROM "Профессии"
GROUP BY "Название";
```
#### Вывод:
a.)

| Название                 | Место\_расположения |
|:-------------------------|:--------------------|
| Рога и копыта            | Приморск            |
| ГАЗ                      | Н.Новгород          |
| Станкостроительный завод | Одесса              |
| КИНАП                    | Одесса              |
| КРАЗ                     | Кременчуг           |
| п\\я 12687-у             | Саранск             |

b.)

| Номер |
|:------|
| N5    |
| N4    |
| N12   |
| N6    |
| N8    |

c.)

| Название     | sum |
|:-------------|:----|
| Шлифовальщик | 5   |
| Слесарь      | 6   |
| Кровельщик   | 7   |
| Программист  | 8   |
| Автоводитель | 3   |
| Фрезеровщик  | 7   |
| Счетовод     | 10  |

## Задание 5
[К таблице контента](#Контент)
#### SQL:
```postgresql
-- a.)
SELECT "Название", "Место_расположения"
FROM "Наниматель"
WHERE "Льгота_процент" < 8;

-- b.)
SELECT *
FROM "Профессии"
WHERE "Стоимость_найма_руб" > 10000
  AND "Прежнее_место_работы" <> 'Москва';

-- c.)
SELECT "Название", "Место_расположения"
FROM "Наниматель"
WHERE "Название" LIKE '%завод%'
  AND "Льгота_процент" > 0
ORDER BY "Название", "Льгота_процент" DESC;
```
#### Вывод:
a.)

| Название                 | Место\_расположения |
|:-------------------------|:--------------------|
| Рога и копыта            | Приморск            |
| Станкостроительный завод | Одесса              |
| КИНАП                    | Одесса              |
| КРАЗ                     | Кременчуг           |

b.)

| Идентификатор | Название     | Стоимость\_найма\_руб | Количество | Прежнее\_место\_работы |
|:--------------|:-------------|:----------------------|:-----------|:-----------------------|
| 2             | Слесарь      | 15000                 | 6          | Кременчуг              |
| 4             | Фрезеровщик  | 20000                 | 7          | Одесса                 |
| 5             | Программист  | 40000                 | 8          | Киев                   |
| 6             | Автоводитель | 25000                 | 3          | Приморск               |
| 7             | Шлифовальщик | 17000                 | 5          | Одесса                 |

c.)

| Название                 | Место\_расположения |
|:-------------------------|:--------------------|
| Станкостроительный завод | Одесса              |

## Задание 6
[К таблице контента](#Контент)
#### SQL:
```postgresql
-- a.)
SELECT "Название" AS Название_нанимателя,
       "Дата"     AS Дата_договора,
       "Номер"    AS Номер_бюро_найма
FROM "Наниматель"
         JOIN "Трудовой_договор" Тд ON "Наниматель"."Идентификатор" = Тд."Наниматель"
         JOIN "Бюро_найма" Бн ON Бн."Идентификатор" = Тд."Бюро_найма";

-- b.)
SELECT "Дата"                AS Дата_договора,
       "Номер"               AS Номер_бюро_найма,
       "Название"            AS Название_нанимателя,
       "Количество_вакансий" AS Количество_заказанных_вакансий
FROM "Трудовой_договор" Тд
         JOIN "Бюро_найма" Бн on Бн."Идентификатор" = Тд."Бюро_найма"
         JOIN "Наниматель" Н on Н."Идентификатор" = Тд."Наниматель";
```
#### Вывод:
a.)

| Название\_нанимателя     | Дата\_договора | Номер\_бюро\_найма |
|:-------------------------|:---------------|:-------------------|
| Станкостроительный завод | 2020-01-01     | N6                 |
| п\\я 12687-у             | 2020-02-01     | N4                 |
| Рога и копыта            | 2020-03-01     | N12                |
| ГАЗ                      | 2020-04-01     | N5                 |
| КИНАП                    | 2020-04-01     | N6                 |
| п\\я 12687-у             | 2020-04-01     | N6                 |
| КРАЗ                     | 2020-05-01     | N4                 |
| Станкостроительный завод | 2020-05-01     | N12                |
| Станкостроительный завод | 2020-05-01     | N6                 |
| КИНАП                    | 2020-06-01     | N5                 |
| Рога и копыта            | 2020-06-01     | N4                 |
| Рога и копыта            | 2020-06-01     | N12                |
| КРАЗ                     | 2020-06-01     | N6                 |
| Станкостроительный завод | 2020-06-01     | N8                 |
| Станкостроительный завод | 2020-06-01     | N8                 |
| КИНАП                    | 2020-07-01     | N4                 |
| ГАЗ                      | 2020-08-01     | N4                 |

b.)

| Дата\_договора | Номер\_бюро\_найма | Название\_нанимателя     | Количество\_заказанных\_вакансий |
|:---------------|:-------------------|:-------------------------|:---------------------------------|
| 2020-01-01     | N6                 | Станкостроительный завод | 1                                |
| 2020-02-01     | N4                 | п\\я 12687-у             | 2                                |
| 2020-03-01     | N12                | Рога и копыта            | 1                                |
| 2020-04-01     | N5                 | ГАЗ                      | 2                                |
| 2020-04-01     | N6                 | КИНАП                    | 1                                |
| 2020-04-01     | N6                 | п\\я 12687-у             | 1                                |
| 2020-05-01     | N4                 | КРАЗ                     | 3                                |
| 2020-05-01     | N12                | Станкостроительный завод | 3                                |
| 2020-05-01     | N6                 | Станкостроительный завод | 1                                |
| 2020-06-01     | N5                 | КИНАП                    | 4                                |
| 2020-06-01     | N4                 | Рога и копыта            | 3                                |
| 2020-06-01     | N12                | Рога и копыта            | 1                                |
| 2020-06-01     | N6                 | КРАЗ                     | 2                                |
| 2020-06-01     | N8                 | Станкостроительный завод | 1                                |
| 2020-06-01     | N8                 | Станкостроительный завод | 1                                |
| 2020-07-01     | N4                 | КИНАП                    | 1                                |
| 2020-08-01     | N4                 | ГАЗ                      | 2                                |

## Задание 7
[К таблице контента](#Контент)
#### SQL:
```postgresql
-- a.)
SELECT "Дата" AS Дата_договора,
       "Номер_договора",
       Н."Название" AS Название_предприятия
FROM "Трудовой_договор"
         JOIN "Наниматель" Н ON Н."Идентификатор" = "Трудовой_договор"."Наниматель"
         JOIN "Профессии" П ON П."Идентификатор" = "Трудовой_договор"."Профессия"
WHERE П."Название" = 'Автоводитель'
   OR "Оплата" * "Трудовой_договор"."Количество_вакансий" >= 14000;

-- b.)
SELECT DISTINCT "Номер" AS Номер_бюро,
                "Адрес_конторы" AS Адрес
FROM "Бюро_найма"
         JOIN "Трудовой_договор" Тд ON "Бюро_найма"."Идентификатор" = Тд."Бюро_найма"
         JOIN "Наниматель" Н ON Н."Идентификатор" = Тд."Наниматель"
WHERE "Льгота_процент" < 7
  AND "Дата" >= DATE '2020-03-01';

-- c.)
SELECT DISTINCT "Название" AS Предприятие
FROM "Наниматель"
         JOIN "Трудовой_договор" Тд ON "Наниматель"."Идентификатор" = Тд."Наниматель"
         JOIN "Бюро_найма" Бн ON Бн."Идентификатор" = Тд."Бюро_найма"
WHERE "Место_расположения" <> 'Москва'
  AND "Плата_процент" > 3;

-- d.)
SELECT П."Название" AS Специальность,
       "Оплата" AS Стоимость
FROM "Наниматель"
         JOIN "Трудовой_договор" Тд on "Наниматель"."Идентификатор" = Тд."Наниматель"
         JOIN "Бюро_найма" Бн on Бн."Идентификатор" = Тд."Бюро_найма"
         JOIN "Профессии" П on П."Идентификатор" = Тд."Профессия"
WHERE "Прежнее_место_работы" = "Место_расположения"
ORDER BY Стоимость;
```
#### Вывод:
a.)

| Дата\_договора | Номер\_договора | Название\_предприятия    |
|:---------------|:----------------|:-------------------------|
| 2020-01-01     | 127             | Станкостроительный завод |
| 2020-02-01     | 128             | п\\я 12687-у             |
| 2020-03-01     | 129             | Рога и копыта            |
| 2020-04-01     | 130             | ГАЗ                      |
| 2020-04-01     | 131             | КИНАП                    |
| 2020-05-01     | 133             | КРАЗ                     |
| 2020-05-01     | 134             | Станкостроительный завод |
| 2020-06-01     | 136             | КИНАП                    |
| 2020-06-01     | 137             | Рога и копыта            |
| 2020-06-01     | 138             | Рога и копыта            |
| 2020-06-01     | 139             | КРАЗ                     |
| 2020-06-01     | 140             | Станкостроительный завод |
| 2020-06-01     | 141             | Станкостроительный завод |
| 2020-07-01     | 142             | КИНАП                    |
| 2020-08-01     | 143             | ГАЗ                      |

b.)

| Номер\_бюро | Адрес      |
|:------------|:-----------|
| N12         | Киев       |
| N5          | Н.Новгород |
| N8          | Одесса     |
| N4          | Москва     |
| N6          | Н.Новгород |

c.)

| Предприятие              |
|:-------------------------|
| Рога и копыта            |
| КИНАП                    |
| Станкостроительный завод |
| ГАЗ                      |

d.)

| Специальность | Стоимость |
|:--------------|:----------|
| Кровельщик    | 10000     |
| Кровельщик    | 20000     |

## Задание 8
[К таблице контента](#Контент)
#### SQL:
```postgresql
UPDATE "Трудовой_договор"
SET "Оплата" = "Оплата" * (1.0 - (
    SELECT "Льгота_процент" / 100.0
    FROM "Наниматель"
    WHERE "Трудовой_договор"."Наниматель" = "Наниматель"."Идентификатор"
))
RETURNING "Оплата";
```
#### Вывод:
| Оплата |
|:-------|
| 24500  |
| 18000  |
| 20000  |
| 27200  |
| 24500  |
| 9000   |
| 117600 |
| 44100  |
| 9800   |
| 98000  |
| 45000  |
| 17000  |
| 19600  |
| 14700  |
| 14700  |
| 24500  |
| 27200  |

## Задание 9
[К таблице контента](#Контент)
#### SQL:
```postgresql
ALTER TABLE "Трудовой_договор"
    ADD COLUMN Плата_бюро INT CHECK(Плата_бюро >= 0);

UPDATE "Трудовой_договор"
SET Плата_бюро = "Оплата" * (
    SELECT "Плата_процент" / 100.0
    FROM "Бюро_найма"
    WHERE "Трудовой_договор"."Бюро_найма" = "Бюро_найма"."Идентификатор"
)
RETURNING "Трудовой_договор".Плата_бюро;
```
#### Вывод:
| Плата\_бюро |
|:------------|
| 735         |
| 540         |
| 2200        |
| 1088        |
| 735         |
| 270         |
| 3528        |
| 4851        |
| 294         |
| 3920        |
| 1350        |
| 1870        |
| 588         |
| 1323        |
| 1323        |
| 735         |
| 816         |

## Задание 10
[К таблице контента](#Контент)
#### SQL:
```postgresql
-- a.)
SELECT DISTINCT "Номер" AS Номер_бюро
FROM "Бюро_найма"
         JOIN "Трудовой_договор" Тд on "Бюро_найма"."Идентификатор" = Тд."Бюро_найма"
WHERE "Наниматель" IN (
    SELECT "Идентификатор"
    FROM "Наниматель"
    WHERE "Место_расположения" = 'Н.Новгород'
);

-- b.)
SELECT DISTINCT "Название" AS Профессия
FROM "Профессии"
WHERE "Идентификатор" NOT IN (
    SELECT DISTINCT "Профессии"."Идентификатор"
    FROM "Профессии"
             JOIN "Трудовой_договор" Тд on "Профессии"."Идентификатор" = Тд."Профессия"
             JOIN "Наниматель" Н on Н."Идентификатор" = Тд."Наниматель"
    WHERE "Льгота_процент" < 10
);

-- c.)
-- -- 7.a.)
SELECT "Дата" AS Дата_договора,
       "Номер_договора",
       Н."Название" AS Название_предприятия
FROM "Трудовой_договор"
         JOIN "Наниматель" Н ON Н."Идентификатор" = "Трудовой_договор"."Наниматель"
WHERE "Номер_договора" IN (
    SELECT "Номер_договора"
    FROM "Трудовой_договор"
             JOIN "Профессии" П on П."Идентификатор" = "Трудовой_договор"."Профессия"
             JOIN "Наниматель" Н2 on Н2."Идентификатор" = "Трудовой_договор"."Наниматель"
    WHERE П."Название" = 'Автоводитель'
       OR "Оплата" * "Трудовой_договор"."Количество_вакансий" >= 14000
);
-- -- 7.b.)
SELECT "Номер" AS Номер_бюро,
       "Адрес_конторы" AS Адрес
FROM "Бюро_найма"
WHERE "Идентификатор" IN (
    SELECT "Бюро_найма"."Идентификатор"
    FROM "Бюро_найма"
             JOIN "Трудовой_договор" Тд on "Бюро_найма"."Идентификатор" = Тд."Бюро_найма"
             JOIN "Наниматель" Н on Н."Идентификатор" = Тд."Наниматель"
    WHERE "Льгота_процент" < 7
      AND "Дата" >= DATE '2020-03-01'
);
```
#### Вывод:
a.)

| Номер\_бюро |
|:------------|
| N4          |
| N5          |

b.)

| Профессия |
|:----------|

c.)
7.a) переделанное

| Дата\_договора | Номер\_договора | Название\_предприятия    |
|:---------------|:----------------|:-------------------------|
| 2020-01-01     | 127             | Станкостроительный завод |
| 2020-02-01     | 128             | п\\я 12687-у             |
| 2020-03-01     | 129             | Рога и копыта            |
| 2020-04-01     | 130             | ГАЗ                      |
| 2020-04-01     | 131             | КИНАП                    |
| 2020-05-01     | 133             | КРАЗ                     |
| 2020-05-01     | 134             | Станкостроительный завод |
| 2020-06-01     | 136             | КИНАП                    |
| 2020-06-01     | 137             | Рога и копыта            |
| 2020-06-01     | 138             | Рога и копыта            |
| 2020-06-01     | 139             | КРАЗ                     |
| 2020-06-01     | 140             | Станкостроительный завод |
| 2020-06-01     | 141             | Станкостроительный завод |
| 2020-07-01     | 142             | КИНАП                    |
| 2020-08-01     | 143             | ГАЗ                      |

7.b.) переделанное

| Номер\_бюро | Адрес      |
|:------------|:-----------|
| N5          | Н.Новгород |
| N4          | Москва     |
| N12         | Киев       |
| N6          | Н.Новгород |
| N8          | Одесса     |

## Задание 11
[К таблице контента](#Контент)
#### SQL:
```postgresql
-- a.)
SELECT DISTINCT "Название" AS Профессия
FROM "Профессии"
         JOIN "Трудовой_договор" Тд on "Профессии"."Идентификатор" = Тд."Профессия"
WHERE "Количество_вакансий" >= ALL (
    SELECT "Количество_вакансий"
    FROM "Трудовой_договор"
);

-- b.)
SELECT DISTINCT "Название"
FROM "Наниматель"
         JOIN "Трудовой_договор" Тд on "Наниматель"."Идентификатор" = Тд."Наниматель"
         JOIN "Бюро_найма" Бн on Бн."Идентификатор" = Тд."Бюро_найма"
WHERE "Место_расположения" <> Бн."Адрес_конторы"
  AND "Оплата" >= ALL (
    SELECT "Оплата"
    FROM "Трудовой_договор"
             JOIN "Бюро_найма" Бн2 on Бн2."Идентификатор" = "Трудовой_договор"."Бюро_найма"
             JOIN "Наниматель" Н on Н."Идентификатор" = "Трудовой_договор"."Наниматель"
    WHERE Н."Место_расположения" <> Бн2."Адрес_конторы"
);

-- c.) --7.c)
SELECT DISTINCT "Название" AS Предприятие
FROM "Наниматель"
WHERE "Идентификатор" = ANY (
    SELECT Н."Идентификатор"
    FROM "Наниматель" Н
             JOIN "Трудовой_договор" Тд on Н."Идентификатор" = Тд."Наниматель"
             JOIN "Бюро_найма" Бн on Бн."Идентификатор" = Тд."Бюро_найма"
    WHERE Н."Место_расположения" <> 'Москва'
      AND "Плата_процент" > 3
);

-- d.)
SELECT DISTINCT "Профессии"."Название" AS Профессия
FROM "Профессии"
         JOIN "Трудовой_договор" Т on "Профессии"."Идентификатор" = Т."Профессия"
         JOIN "Наниматель" Н on Н."Идентификатор" = Т."Наниматель"
WHERE "Стоимость_найма_руб" >= ALL (
    SELECT П."Стоимость_найма_руб"
    FROM "Профессии" П
             JOIN "Трудовой_договор" Тд on П."Идентификатор" = Тд."Профессия"
             JOIN "Наниматель" Н on Н."Идентификатор" = Тд."Наниматель"
    WHERE "Место_расположения" = 'Н.Новгород'
)
  AND "Место_расположения" = 'Н.Новгород';
```
#### Вывод:
a.)

| Профессия |
|:----------|
| Счетовод  |

b.)

| Название |
|:---------|
| КРАЗ     |

c.)

| Предприятие              |
|:-------------------------|
| ГАЗ                      |
| КИНАП                    |
| Рога и копыта            |
| Станкостроительный завод |

d.)

| Профессия    |
|:-------------|
| Шлифовальщик |

## Задание 12
[К таблице контента](#Контент)
#### SQL:
```postgresql
SELECT "Место_расположения"
FROM "Наниматель"
UNION
SELECT "Адрес_конторы"
FROM "Бюро_найма";
```
#### Вывод:
| Место\_расположения |
|:--------------------|
| Киев                |
| Москва              |
| Саранск             |
| Н.Новгород          |
| Приморск            |
| Одесса              |
| Кременчуг           |

## Задание 13
[К таблице контента](#Контент)
#### SQL:
```postgresql
-- a.)
SELECT EXISTS(
               SELECT "Профессии"."Название"
               FROM "Профессии"
                        JOIN "Трудовой_договор" Тд on "Профессии"."Идентификатор" = Тд."Профессия"
                        JOIN "Наниматель" Н on Н."Идентификатор" = Тд."Наниматель"
               WHERE "Место_расположения" <> 'Приморск'
               GROUP BY "Профессии"."Название"
               HAVING COUNT(DISTINCT "Место_расположения") + 1 = (SELECT COUNT(DISTINCT Н2."Место_расположения")
                                                                  FROM "Наниматель" Н2)
           );
-- Выводит false, чтобы исправить
-- быстрее всего добавить для Кровельщика договор в Н.Новгород
INSERT INTO "Трудовой_договор" ("Номер_договора", "Дата", "Наниматель", "Бюро_найма", "Профессия",
                                "Количество_вакансий", "Оплата", "Плата_бюро")
VALUES (999, NOW()::DATE, 2, 1, 1, 1, 1, 0);
-- теперь true

-- b.)
SELECT EXISTS(
               SELECT "Номер" AS Номер_бюро
               FROM "Бюро_найма"
                        JOIN "Трудовой_договор" Тд on "Бюро_найма"."Идентификатор" = Тд."Бюро_найма"
                        JOIN "Профессии" П on П."Идентификатор" = Тд."Профессия"
               WHERE "Стоимость_найма_руб" > 15000
               GROUP BY Номер_бюро
               HAVING COUNT(DISTINCT "Профессия") = (SELECT COUNT(П2."Идентификатор")
                                                     FROM "Профессии" П2
                                                     WHERE П2."Стоимость_найма_руб" > 15000)
           );
-- Выводит false, чтобы исправить
-- быстрее всего добавить договор для N4 бюро на Фрезеровщик,Счетовод,Слесарь,Кровельщик
INSERT INTO "Трудовой_договор" ("Номер_договора", "Дата", "Наниматель", "Бюро_найма", "Профессия",
                                "Количество_вакансий", "Оплата", "Плата_бюро")
VALUES (1000, NOW()::DATE, 2, 2, 1, 1, 15001, 0),
       (1001, NOW()::DATE, 2, 2, 2, 1, 15001, 0),
       (1002, NOW()::DATE, 2, 2, 3, 1, 15001, 0),
       (1003, NOW()::DATE, 2, 2, 4, 1, 15001, 0);
-- теперь true

```
#### Вывод:
a.)

| exists |
|:-------|
| false  |

b.)

| exists |
|:-------|
| false  |

## Задание 14
[К таблице контента](#Контент)
#### SQL:
```postgresql
-- a.)
SELECT AVG("Плата_бюро")
FROM "Бюро_найма"
         join "Трудовой_договор" Тд on "Бюро_найма"."Идентификатор" = Тд."Бюро_найма"
WHERE "Идентификатор" IN (SELECT Б."Идентификатор"
                          FROM "Бюро_найма" Б
                                   join "Трудовой_договор" Т on "Бюро_найма"."Идентификатор" = Т."Бюро_найма"
                                   join "Наниматель" Н on Н."Идентификатор" = Т."Наниматель"
                          GROUP BY Б."Идентификатор"
                          HAVING COUNT("Место_расположения" = 'Одесса') =
                                 (SELECT COUNT(*) FROM "Наниматель" Н2 WHERE Н2."Место_расположения" = 'Одесса'));

-- b.)
SELECT SUM("Оплата")
FROM "Трудовой_договор";

-- c.)
SELECT COUNT(DISTINCT "Профессии"."Название")
FROM "Профессии"
         join "Трудовой_договор" Тд on "Профессии"."Идентификатор" = Тд."Профессия"
         join "Наниматель" Н on Н."Идентификатор" = Тд."Наниматель"
WHERE "Место_расположения" = 'Н.Новгород'
  AND "Дата" < DATE '2020-01-01';

-- d.)
SELECT AVG(count)
FROM (SELECT SUM("Количество_вакансий") AS count
      FROM "Трудовой_договор"
               JOIN "Профессии" П on П."Идентификатор" = "Трудовой_договор"."Профессия"
      WHERE "Стоимость_найма_руб" > 20000
      GROUP BY "Профессия") AS countings;
```
#### Вывод:

a.)

| avg    |
|:-------|
| 1913.5 |

b.)

| sum    |
|:-------|
| 555400 |

c.)

| count |
|:------|
| 0     |

d.)

| avg                |
|:-------------------|
| 3.3333333333333333 |

## Задание 15
[К таблице контента](#Контент)
#### SQL:
```postgresql
-- a.)
SELECT "Название" AS Предприятие,
       "Номер"    AS Бюро_найма,
       SUM("Оплата")
FROM "Наниматель"
         JOIN "Трудовой_договор" Тд on "Наниматель"."Идентификатор" = Тд."Наниматель"
         JOIN "Бюро_найма" Бн on Бн."Идентификатор" = Тд."Бюро_найма"
GROUP BY "Название", "Номер";

-- b.)
SELECT "Номер"                 AS Бюро_найма,
       COUNT("Номер_договора") AS Количество_договоров
FROM "Бюро_найма"
         JOIN "Трудовой_договор" Тд on "Бюро_найма"."Идентификатор" = Тд."Бюро_найма"
GROUP BY "Номер"
HAVING COUNT("Номер_договора") > 2;

-- c.)
SELECT "Место_расположения", COUNT(*) AS Количество_предприятий
FROM "Наниматель"
GROUP BY "Место_расположения"
HAVING COUNT(*) > 0;

-- d.)
SELECT EXTRACT(MONTH FROM "Дата") AS Номер_месяца,
       "Номер"                    AS Бюро_найма,
       SUM("Оплата")              AS Суммарная_оплата
FROM "Трудовой_договор"
         JOIN "Бюро_найма" Бн on Бн."Идентификатор" = "Трудовой_договор"."Бюро_найма"
GROUP BY EXTRACT(MONTH FROM "Дата"), "Номер"
HAVING SUM("Оплата") > 200000
ORDER BY EXTRACT(MONTH FROM "Дата");
```
#### Вывод:
a.)

| Предприятие              | Бюро\_найма | sum    |
|:-------------------------|:------------|:-------|
| Рога и копыта            | N12         | 37000  |
| КРАЗ                     | N6          | 19600  |
| КРАЗ                     | N4          | 117600 |
| Станкостроительный завод | N8          | 29400  |
| ГАЗ                      | N5          | 27200  |
| Рога и копыта            | N4          | 45000  |
| ГАЗ                      | N4          | 27200  |
| Станкостроительный завод | N6          | 34300  |
| п\\я 12687-у             | N4          | 18000  |
| КИНАП                    | N4          | 24500  |
| п\\я 12687-у             | N6          | 9000   |
| КИНАП                    | N5          | 98000  |
| КИНАП                    | N6          | 24500  |
| Станкостроительный завод | N12         | 44100  |

b.)

| Бюро\_найма | Количество\_договоров |
|:------------|:----------------------|
| N12         | 3                     |
| N6          | 5                     |
| N4          | 5                     |

c.)

| Место\_расположения | Количество\_предприятий |
|:--------------------|:------------------------|
| Н.Новгород          | 1                       |
| Приморск            | 1                       |
| Саранск             | 1                       |
| Одесса              | 2                       |
| Кременчуг           | 1                       |

d.)

| Номер\_месяца | Бюро\_найма | Суммарная\_оплата |
|:--------------|:------------|:------------------|
