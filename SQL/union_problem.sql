-- table1 ---> (C,A,B)
-- table2 ---> (5,3,4,1,2)
-- o/p    ---> (1,A,2,B,3,C,4,5)

CREATE TABLE table1 (col_1 VARCHAR(255));
CREATE TABLE table2 (col_1 INTEGER);

INSERT INTO table1 VALUES ('C');
INSERT INTO table1 VALUES ('A');
INSERT INTO table1 VALUES ('B');

INSERT INTO table2 VALUES (5);
INSERT INTO table2 VALUES (3);
INSERT INTO table2 VALUES (4);
INSERT INTO table2 VALUES (1);
INSERT INTO table2 VALUES (2);

SELECT * FROM table1;
SELECT * FROM table2;

SELECT col_1 FROM (SELECT *, ROW_NUMBER() OVER (ORDER BY col_1) AS rnk from table2 UNION
SELECT *, ROW_NUMBER() OVER (ORDER BY col_1) AS rnk from table1) ORDER BY rnk;