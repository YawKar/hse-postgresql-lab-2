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