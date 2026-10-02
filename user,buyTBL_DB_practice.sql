CREATE DATABASE gmarketDB;

USE gmarketDB;

CREATE TABLE buyTBL (
    userID VARCHAR(20) NOT NULL,
    OrderDate DATE,
    OrderDetailNumber INT AUTO_INCREMENT PRIMARY KEY,
    ProductCode VARCHAR(20),
    ProductName VARCHAR(200),
    ProductPrice DECIMAL(10, 2),
    Quantity INT
);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('dino', '2023-10-01', 'WMELON001', '수박', 9000, 1);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('tree', '2023-10-01', 'WMELON002', '수박쥬스', 9000, 1);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('Yu123', '2023-10-01', 'NOODLES001', '라면', 12000, 2);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('Mun2', '2023-10-01', 'LAPTOP001', '노트북', 1025000.58, 1);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('dino', '2023-10-01', 'KIMCHI001', '김치', 9000, 1);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('Lee346', '2023-10-01', 'IPAD001', '아이패드', 9000, 1);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('Lee346', '2023-10-01', 'CATFOOD001', '고양이사료', 42000, 3);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('Lee346', '2023-10-01', 'COSMETICS001', '화장품', 52000, 1);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('Jang09', '2023-10-01', 'TOILETPAPER001', '롤화장지', 23000, 1);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('tree', '2023-10-01', 'AIRFRESHENER001', '페브리즈', 9000, 1);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('tree', '2023-10-01', 'TOOTHPASTE001', '치약', 15000, 1);

INSERT INTO buyTBL (userID, OrderDate, ProductCode, ProductName, ProductPrice, Quantity)
VALUES ('Young', '2023-10-01', 'SPORTSDRINK001', '포카리스웨트', 23000, 1);

SELECT * FROM buyTBL;

DELETE FROM buyTBL
WHERE OrderDetailNumber IN (1, 2, 3);

SELECT userTBL.*, buyTBL.*
FROM userTBL
INNER JOIN buyTBL
ON userTBL.userID = buyTBL.userID;

SELECT userTBL.userID, buyTBL.Quantity
FROM userTBL
INNER JOIN buyTBL
ON userTBL.userID = buyTBL.userID;

SELECT userTBL.userID,
       buyTBL.ProductName,
       buyTBL.ProductPrice,
       userTBL.address
FROM userTBL
INNER JOIN buyTBL
ON userTBL.userID = buyTBL.userID;

SELECT
    u.userID AS '사용자 ID',
    b.ProductName AS '상품 이름',
    b.ProductPrice AS '가격',
    u.address AS '주소'
FROM userTBL AS u
INNER JOIN buyTBL AS b
ON u.userID = b.userID;

SELECT userTBL.userID,
       SUM(buyTBL.Quantity) AS totalQuantity
FROM userTBL
INNER JOIN buyTBL
ON userTBL.userID = buyTBL.userID
GROUP BY userTBL.userID
ORDER BY totalQuantity DESC
LIMIT 3;

CREATE VIEW user_buy_view AS
SELECT userTBL.userID,
       buyTBL.ProductName,
       buyTBL.ProductPrice,
       userTBL.address
FROM userTBL
INNER JOIN buyTBL
ON userTBL.userID = buyTBL.userID;

SELECT * FROM user_buy_view;

DROP VIEW IF EXISTS user_buy_view;

CREATE TABLE femaleUsers AS
SELECT *
FROM userTBL
WHERE gender = 'Female';

SHOW TABLES;

SELECT * FROM femaleUsers;

RENAME TABLE femaleUsers TO femaleUsers_member;

SELECT * FROM femaleUsers_member;

DROP TABLE femaleUsers_member;

SHOW TABLES;