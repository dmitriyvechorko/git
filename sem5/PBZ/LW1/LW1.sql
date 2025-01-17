create table provider
(
    provider_code varchar(255) primary key,
    name          varchar(255),
    status        int,
    city          varchar(255)
);

create table cost(
    id int,
    date timestamp NOT NULL,
    settlement_name VARCHAR(255),
    cost_per_min DECIMAL NOT NULL,
    preferential_cost DECIMAL
);

create table detail
(
    detail_code varchar(255) primary key,
    name        varchar(255),
    color       varchar(255),
    size        int,
    city        varchar(255)
);

create table project
(
    project_code varchar(255) primary key,
    name         varchar(255),
    city         varchar(255)
);

create table number_of_details
(
    provider_code varchar(255) references provider (provider_code),
    detail_code   varchar(255) references detail (detail_code),
    project_code  varchar(255) references project (project_code),
    number        int
);

insert into provider (provider_code, name, status, city)
VALUES ('P1', 'Petrov', 20, 'Moscow'),
       ('P2', 'Sinicin', 10, 'Tallin'),
       ('P3', 'Federov', 30, 'Tallin'),
       ('P4', 'Chaianov', 20, 'Minsk'),
       ('P5', 'Krykov', 30, 'Kiev');

insert into detail (detail_code, name, color, size, city)
VALUES ('D1', 'Bolt', 'Red', 12, 'Moscow'),
       ('D2', 'Gaika', 'Green', 17, 'Minsk'),
       ('D3', 'Disk', 'Black', 17, 'Vilnus'),
       ('D4', 'Disk', 'Black', 14, 'Moscow'),
       ('D5', 'Korpus', 'Red', 12, 'Minsk'),
       ('D6', 'Krishki', 'Red', 19, 'Moscow');

insert into project (project_code, name, city)
VALUES ('PR1', 'IPR1', 'Minsk'),
       ('PR2', 'IPR2', 'Tallin'),
       ('PR3', 'IPR3', 'Pskov'),
       ('PR4', 'IPR4', 'Pskov'),
       ('PR5', 'IPR4', 'Moscow'),
       ('PR6', 'IPR6', 'Saratov'),
       ('PR7', 'IPR7', 'Moscow');

insert into number_of_details (provider_code, detail_code, project_code, number)
VALUES ('P1', 'D1', 'PR1', 200),
       ('P1', 'D1', 'PR2', 700),
       ('P2', 'D3', 'PR1', 400),
       ('P2', 'D2', 'PR2', 200),
       ('P2', 'D3', 'PR3', 200),
       ('P2', 'D3', 'PR4', 500),
       ('P2', 'D3', 'PR5', 600),
       ('P2', 'D3', 'PR6', 400),
       ('P2', 'D3', 'PR7', 800),
       ('P2', 'D5', 'PR2', 100),
       ('P3', 'D3', 'PR1', 200),
       ('P3', 'D4', 'PR2', 500),
       ('P4', 'D6', 'PR3', 300),
       ('P4', 'D6', 'PR7', 300),
       ('P5', 'D2', 'PR2', 200),
       ('P5', 'D2', 'PR4', 100),
       ('P5', 'D5', 'PR5', 500),
       ('P5', 'D5', 'PR7', 100),
       ('P5', 'D6', 'PR2', 200),
       ('P5', 'D1', 'PR2', 100),
       ('P5', 'D3', 'PR4', 200),
       ('P5', 'D4', 'PR4', 800),
       ('P5', 'D5', 'PR4', 400),
       ('P5', 'D6', 'PR4', 500);

-- 29 Получить номера проектов, полностью обеспечиваемых поставщиком П1.

SELECT nod.project_code
FROM number_of_details nod
GROUP BY project_code
HAVING COUNT(DISTINCT provider_code) = 1 AND MAX (provider_code) = 'P4';


-- 14 Получить все такие пары номеров деталей, которые обе поставляются одновременно одним поставщиком.

SELECT DISTINCT nod1.detail_code, nod2.detail_code
FROM number_of_details nod1
JOIN number_of_details nod2
ON nod1.provider_code = nod2.provider_code
WHERE nod1.detail_code < nod2.detail_code
GROUP BY nod1.detail_code, nod2.detail_code;


-- 22 Получить номера проектов, использующих по крайней мере одну деталь, имеющуюся у поставщика П1.

SELECT DISTINCT project_code
FROM number_of_details
WHERE detail_code IN (
    SELECT detail_code
    FROM number_of_details
    WHERE provider_code = 'P1'
    );


-- 11 Получить все пары названий городов, для которых поставщик из первого города обеспечивает проект во втором городе.

SELECT DISTINCT p.city AS provider_city, pr.city AS project_city
FROM number_of_details nod
         JOIN provider p ON nod.provider_code = p.provider_code
         JOIN project pr ON nod.project_code = pr.project_code
WHERE p.city <> pr.city;


-- 2 Получить полную информацию обо всех проектах в Лондоне.

SELECT *
FROM project p
WHERE p.city = 'London';

-- 4 Получить все отправки, где количество находится в диапазоне от 300 до 750 включительно.

SELECT *
FROM number_of_details
WHERE number BETWEEN 300 AND 750;


-- 8 Получить все такие тройки "номера поставщиков-номера деталей-номера проектов", для которых никакие из двух
-- выводимых поставщиков, деталей и проектов не размещены в одном городе.

SELECT nod.provider_code, nod.detail_code, nod.project_code
FROM number_of_details nod
         JOIN provider p ON nod.provider_code = p.provider_code
         JOIN detail d ON nod.detail_code = d.detail_code
         JOIN project pr ON nod.project_code = pr.project_code
WHERE p.city <> d.city
  AND p.city <> pr.city
  AND d.city <> pr.city;


-- 33 Получить все города, в которых расположен по крайней мере один поставщик, одна деталь или один проект.

SELECT DISTINCT city
FROM provider
UNION
SELECT DISTINCT city
FROM detail
UNION
SELECT DISTINCT city
FROM project;


-- 13 Получить номера проектов, обеспечиваемых по крайней мере одним поставщиком не из того же города.

SELECT DISTINCT nd.project_code
FROM number_of_details nd
         JOIN provider p ON nd.provider_code = p.provider_code
         JOIN project pr ON nd.project_code = pr.project_code
WHERE p.city <> pr.city;


-- 27 Получить номера поставщиков, поставляющих деталь Д1 для некоторого проекта в количестве, большем среднего
-- количества деталей Д1 в поставках для этого проекта.

SELECT DISTINCT nd.provider_code
FROM number_of_details nd
WHERE nd.detail_code = 'D1'
  AND nd.number > (SELECT AVG(sub_nd.number)
                   FROM number_of_details sub_nd
                   WHERE sub_nd.detail_code = 'D1'
                     AND sub_nd.project_code = nd.project_code);
