-- Write a query to display points table of IPL teams, giving ranks to each team based on decreasing order of points
-- (if two teams have same points then consider their NRR in decreasing order)

CREATE TABLE IPL (Team VARCHAR(255), M INTEGER, W INTEGER, L INTEGER, NRR FLOAT, Pts INTEGER);

INSERT INTO IPL VALUES ('DC', 5, 1, 4, -1.370, 2);
INSERT INTO IPL VALUES ('RCB', 5, 1, 4, -0.843, 2);
INSERT INTO IPL VALUES ('MI', 4, 1, 3, -0.704, 2);
INSERT INTO IPL VALUES ('PBKS', 5, 2, 3, -0.196, 4);
INSERT INTO IPL VALUES ('GT', 6, 3, 3, -0.637, 6);
INSERT INTO IPL VALUES ('SRH', 5, 3, 2, 0.344, 6);
INSERT INTO IPL VALUES ('CSK', 5, 3, 2, 0.666, 6);
INSERT INTO IPL VALUES ('LSG', 4, 3, 1, 0.775, 6);
INSERT INTO IPL VALUES ('KKR', 4, 3, 1, 1.528, 6);
INSERT INTO IPL VALUES ('RR', 5, 4, 1, 0.871, 8);

SELECT * FROM IPL;

SELECT ROW_NUMBER() OVER (ORDER BY Pts DESC, NRR DESC) AS Pos, * FROM IPL;