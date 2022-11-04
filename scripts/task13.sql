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