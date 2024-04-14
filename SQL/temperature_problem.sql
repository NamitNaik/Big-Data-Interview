-- Write a query to get cities whose temperature dropped below zero degrees for 3 or more consecutive days

CREATE TABLE weather (city VARCHAR(255), temp INTEGER, day date);

INSERT INTO weather VALUES ('Germany', 2, '2024-03-20');
INSERT INTO weather VALUES ('Germany', 1, '2024-03-21');
INSERT INTO weather VALUES ('Germany', -1, '2024-03-22');
INSERT INTO weather VALUES ('Germany', -2, '2024-03-23');
INSERT INTO weather VALUES ('Germany', -3, '2024-03-24');

SELECT * FROM weather;

WITH cte1 AS (SELECT ROW_NUMBER() OVER (ORDER BY day ASC) AS id, *  FROM weather),
cte2 AS (SELECT *, id - ROW_NUMBER() OVER (ORDER BY day ASC) AS diff FROM cte1
        WHERE temp < 0),
cte3 AS (SELECT *, COUNT(diff) OVER (PARTITION BY diff) AS consecutive FROM cte2)
SELECT id, city, temp, day FROM cte3 WHERE consecutive >= 3;