CREATE DATABASE Lista2CJ3034496;
GO

USE Lista2CJ3034496;
GO

CREATE TABLE VENDOR (
    V_CODE INT PRIMARY KEY,
    V_NAME VARCHAR(100) NOT NULL,
    V_CONTACT VARCHAR(50),
    V_AREACODE VARCHAR(5),
    V_PHONE VARCHAR(15),
    V_STATE CHAR(2),
    V_ORDER CHAR(1)
);
GO

CREATE TABLE PRODUCT (
    P_CODE VARCHAR(10) PRIMARY KEY,
    P_DESCRIPT VARCHAR(255),
    P_INDATE DATE,
    P_QOH INT,
    P_MIN INT,
    P_PRICE DECIMAL(10, 2),
    P_DISCOUNT DECIMAL(5, 2),
    V_CODE INT,
    FOREIGN KEY (V_CODE) REFERENCES VENDOR(V_CODE)
);
GO

CREATE TABLE CUSTOMER (
    CUS_CODE INT PRIMARY KEY,
    CUS_LNAME VARCHAR(50) NOT NULL,
    CUS_FNAME VARCHAR(50) NOT NULL,
    CUS_INITIAL CHAR(1),
    CUS_AREACODE VARCHAR(5),
    CUS_PHONE VARCHAR(15),
    CUS_BALANCE DECIMAL(10,2)
);
GO

CREATE TABLE INVOICE (
    INV_NUMBER INT PRIMARY KEY,
    CUS_CODE INT,
    INV_DATE DATE,
    FOREIGN KEY (CUS_CODE) REFERENCES CUSTOMER(CUS_CODE)
);
GO

CREATE TABLE LINE (
    INV_NUMBER INT,
    LINE_NUMBER INT,
    P_CODE VARCHAR(10),
    LINE_UNITS INT,
    LINE_PRICE DECIMAL(10, 2),
    PRIMARY KEY (INV_NUMBER, LINE_NUMBER),
    FOREIGN KEY (INV_NUMBER) REFERENCES INVOICE(INV_NUMBER),
    FOREIGN KEY (P_CODE) REFERENCES PRODUCT(P_CODE)
);
GO

INSERT INTO CUSTOMER (CUS_CODE, CUS_LNAME, CUS_FNAME, CUS_INITIAL, CUS_AREACODE, CUS_PHONE, CUS_BALANCE)
VALUES 
    (10010, 'Ramas', 'Alfred', 'A', '615', '844-2573', 0.00),
    (10011, 'Dunne', 'Leona', 'K', '713', '894-1238', 0.00),
    (10012, 'Smith', 'Kathy', 'W', '615', '894-2285', 345.86),
    (10013, 'Olowski', 'Paul', 'F', '615', '894-2180', 536.75),
    (10014, 'Orlando', 'Myron', NULL, '615', '222-1672', 0.00),
    (10015, 'O''Brian', 'Amy', 'B', '713', '442-3381', 0.00),
    (10016, 'Brown', 'James', 'G', '615', '297-1228', 221.19),
    (10017, 'Williams', 'George', NULL, '615', '290-2556', 768.93),
    (10018, 'Farriss', 'Anne', 'G', '713', '382-7185', 216.55),
    (10019, 'Smith', 'Olette', 'K', '615', '297-3809', 0.00);
GO

INSERT INTO VENDOR (V_CODE, V_NAME, V_CONTACT, V_AREACODE, V_PHONE, V_STATE, V_ORDER)
VALUES 
    (21225, 'Bryson, Inc.', 'Smithson', '615', '223-3234', 'TN', 'Y'),
    (21226, 'SuperLoo, Inc.', 'Flushing', '904', '215-8995', 'FL', 'N'),
    (21231, 'D&E Supply', 'Singh', '615', '228-3245', 'TN', 'Y'),
    (21344, 'Gomez Bros.', 'Ortega', '615', '889-2546', 'KY', 'N'),
    (22567, 'Dome Supply', 'Smith', '901', '678-1419', 'GA', 'N'),
    (23119, 'Randsets Ltd.', 'Anderson', '901', '678-3998', 'GA', 'Y'),
    (24004, 'Brackman Bros.', 'Browning', '615', '228-1410', 'TN', 'N'),
    (24288, 'ORDVA, Inc.', 'Hakford', '615', '898-1234', 'TN', 'Y'),
    (25443, 'B&K, Inc.', 'Smith', '904', '227-0093', 'FL', 'N'),
    (25501, 'Damal Supplies', 'Smythe', '615', '890-3529', 'TN', 'N'),
    (25595, 'Rubicon Systems', 'Orton', '904', '456-0092', 'FL', 'Y');
GO

INSERT INTO INVOICE (INV_NUMBER, CUS_CODE, INV_DATE)
VALUES 
    (1001, 10014, '2008-03-16'),
    (1002, 10011, '2008-03-16'),
    (1003, 10012, '2008-03-16'),
    (1004, 10011, '2008-03-17'),
    (1005, 10018, '2008-03-17'),
    (1006, 10014, '2008-03-17'),
    (1007, 10015, '2008-03-17'),
    (1008, 10011, '2008-03-17');
GO

INSERT INTO LINE (INV_NUMBER, LINE_NUMBER, P_CODE, LINE_UNITS, LINE_PRICE)
VALUES 
    (1001, 1, '13-Q2/P2', 1, 14.99),
    (1001, 2, '23109-HB', 1, 9.95),
    (1002, 1, '54778-2T', 2, 4.99),
    (1003, 1, '2238/QPD', 1, 38.95),
    (1003, 2, '1546-QQ2', 1, 39.95),
    (1003, 3, '13-Q2/P2', 5, 14.99),
    (1004, 1, '54778-2T', 3, 4.99),
    (1004, 2, '23109-HB', 2, 9.95),
    (1005, 1, 'PVC23DRT', 12, 5.87),
    (1006, 1, 'SM-18277', 3, 6.99),
    (1006, 2, '2232/QTY', 1, 109.92),
    (1006, 3, '23109-HB', 1, 9.95),
    (1006, 4, '89-WRE-Q', 1, 256.99),
    (1007, 1, '13-Q2/P2', 2, 14.99),
    (1007, 2, '54778-2T', 1, 4.99),
    (1008, 1, 'PVC23DRT', 5, 5.87),
    (1008, 2, 'WR3/TT3', 3, 119.95),
    (1008, 3, '23109-HB', 1, 9.95);
GO

INSERT INTO PRODUCT (P_CODE, P_DESCRIPT, P_INDATE, P_QOH, P_MIN, P_PRICE, P_DISCOUNT, V_CODE)
VALUES 
    ('11QER/31', 'Power painter, 15 psi., 3-nozzle', '2007-11-03', 8, 5, 109.99, 0.00, 25595),
    ('13-Q2/P2', '7.25-in. pwr. saw blade', '2007-12-13', 32, 15, 14.99, 0.05, 21344),
    ('14-Q1/L3', '9.00-in. pwr. saw blade', '2007-11-13', 18, 12, 17.49, 0.00, 21344),
    ('1546-QQ2', 'Hrd. cloth, 1/4-in., 2x50', '2008-01-15', 15, 8, 39.95, 0.00, 23119),
    ('1558-QW1', 'Hrd. cloth, 1/2-in., 3x50', '2008-01-15', 23, 5, 43.99, 0.00, 23119),
    ('2232/QTY', 'B&D jigsaw, 12-in. blade', '2007-12-30', 8, 5, 109.92, 0.05, 24288),
    ('2232/QWE', 'B&D jigsaw, 8-in. blade', '2007-12-24', 6, 5, 99.87, 0.05, 24288),
    ('2238/QPD', 'B&D cordless drill, 1/2-in.', '2008-01-20', 12, 5, 38.95, 0.05, 25595),
    ('23109-HB', 'Claw hammer', '2008-01-20', 23, 10, 9.95, 0.10, 21225),
    ('23114-AA', 'Sledge hammer, 12 lb.', '2008-01-02', 8, 5, 14.40, 0.05, NULL),
    ('54778-2T', 'Rat-tail file, 1/8-in. fine', '2007-12-15', 43, 20, 4.99, 0.00, 21344),
    ('89-WRE-Q', 'Hicut chain saw, 16 in.', '2008-02-07', 11, 5, 256.99, 0.05, 24288),
    ('PVC23DRT', 'PVC pipe, 3.5-in., 8-ft', '2008-02-20', 188, 75, 5.87, 0.00, NULL),
    ('SM-18277', '1.25-in. metal screw, 25', '2008-03-01', 172, 75, 6.99, 0.00, 21225),
    ('SW-23116', '2.5-in. wd. screw, 50', '2008-02-24', 237, 100, 8.45, 0.00, 21231),
    ('WR3/TT3', 'Steel matting, 4x8x1/6, 5 mesh', '2008-01-17', 18, 5, 119.95, 0.10, 25595);
GO

SELECT COUNT(*) AS 'Número de Faturas' FROM INVOICE;
GO

SELECT COUNT(*) AS 'Clientes com saldo superior a US$ 500'
FROM CUSTOMER WHERE CUS_BALANCE > 500;
GO

SELECT C.CUS_CODE, I.INV_NUMBER, I.INV_DATE, P.P_DESCRIPT, L.LINE_UNITS, L.LINE_PRICE
FROM CUSTOMER C JOIN INVOICE I ON C.CUS_CODE = I.CUS_CODE JOIN LINE L ON I.INV_NUMBER = L.INV_NUMBER
JOIN PRODUCT P ON L.P_CODE = P.P_CODE
ORDER BY C.CUS_CODE, I.INV_NUMBER, P.P_DESCRIPT;
GO

SELECT C.CUS_CODE, I.INV_NUMBER, P.P_DESCRIPT, 
       L.LINE_UNITS AS 'Units Bought', 
       L.LINE_PRICE AS 'Unit Price', 
       (L.LINE_UNITS * L.LINE_PRICE) AS 'Subtotal'
FROM CUSTOMER C JOIN INVOICE I ON C.CUS_CODE = I.CUS_CODE JOIN LINE L ON I.INV_NUMBER = L.INV_NUMBER
JOIN PRODUCT P ON L.P_CODE = P.P_CODE;
GO

SELECT C.CUS_CODE, C.CUS_BALANCE, 
       SUM(L.LINE_UNITS * L.LINE_PRICE) AS 'Total Compras'
FROM CUSTOMER C JOIN INVOICE I ON C.CUS_CODE = I.CUS_CODE JOIN LINE L ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY C.CUS_CODE, C.CUS_BALANCE;
GO

SELECT C.CUS_CODE, C.CUS_BALANCE, 
       SUM(L.LINE_UNITS * L.LINE_PRICE) AS 'Total Compras',
       COUNT(*) AS 'Números de Compras'
FROM CUSTOMER C JOIN INVOICE I ON C.CUS_CODE = I.CUS_CODE JOIN LINE L ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY C.CUS_CODE, C.CUS_BALANCE;
GO

SELECT C.CUS_CODE, C.CUS_BALANCE, 
       SUM(L.LINE_UNITS * L.LINE_PRICE) AS 'Total Compras',
       COUNT(*) AS 'Números de Compras',
       (SUM(L.LINE_UNITS * L.LINE_PRICE) / COUNT(*)) AS 'Valor médio da compra'
FROM CUSTOMER C JOIN INVOICE I ON C.CUS_CODE = I.CUS_CODE JOIN LINE L ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY C.CUS_CODE, C.CUS_BALANCE;
GO

SELECT INV_NUMBER, SUM(LINE_UNITS * LINE_PRICE) AS 'Total Fatura'
FROM LINE GROUP BY INV_NUMBER;
GO

SELECT CUS_CODE, I.INV_NUMBER, SUM(L.LINE_UNITS * L.LINE_PRICE) AS 'Total Fatura'
FROM INVOICE I JOIN LINE L ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY CUS_CODE, I.INV_NUMBER;
GO

SELECT CUS_CODE, 
       COUNT(DISTINCT I.INV_NUMBER) AS 'Número Faturas',
       SUM(LINE_UNITS * LINE_PRICE) AS 'Total de Compras por Cliente'
FROM INVOICE I JOIN LINE L ON I.INV_NUMBER = L.INV_NUMBER
GROUP BY CUS_CODE;
GO 

SELECT COUNT(*) AS "Total de faturas",
    SUM(invoice_total) AS "Total de todas as faturas",
    MIN(invoice_total) AS "Menor valor de fatura",
    MAX(invoice_total) AS "Maior valor de fatura",
    AVG(invoice_total) AS "Valor médio Faturas"
FROM (SELECT INV_NUMBER, SUM(LINE_UNITS * LINE_PRICE) AS invoice_total
    FROM LINE
    GROUP BY INV_NUMBER
) AS InvoiceTotals;
GO

SELECT CUS_CODE, CUS_BALANCE 
FROM CUSTOMER
WHERE CUS_CODE IN (SELECT DISTINCT CUS_CODE FROM INVOICE);
GO

SELECT MIN(CUS_BALANCE) AS 'Saldo Mínimo', 
       MAX(CUS_BALANCE) AS 'Saldo Máximo', 
       AVG(CUS_BALANCE) AS 'Saldo Médio'
FROM CUSTOMER
WHERE CUS_CODE IN (SELECT DISTINCT CUS_CODE FROM INVOICE);
GO

SELECT SUM(CUS_BALANCE) AS 'Saldo Total',
       MIN(CUS_BALANCE) AS 'Saldo Mínimo',
       MAX(CUS_BALANCE) AS 'Saldo Máximo',
       AVG(CUS_BALANCE) AS 'Saldo Médio'
FROM CUSTOMER;
GO

SELECT CUS_CODE, CUS_BALANCE 
FROM CUSTOMER
WHERE CUS_CODE NOT IN (SELECT DISTINCT CUS_CODE FROM INVOICE);
GO

SELECT SUM(CUS_BALANCE) AS 'Saldo Total',
       MIN(CUS_BALANCE) AS 'Saldo Mínimo',
       MAX(CUS_BALANCE) AS 'Saldo Máximo',
       AVG(CUS_BALANCE) AS 'Saldo Médio'
FROM CUSTOMER
WHERE CUS_CODE NOT IN (SELECT DISTINCT CUS_CODE FROM INVOICE);
GO

SELECT P_DESCRIPT, P_QOH, P_PRICE, (P_QOH * P_PRICE) AS 'Subtotal'
FROM PRODUCT ORDER BY P_DESCRIPT;
GO

SELECT SUM(P_QOH * P_PRICE) AS 'Valor total do estoque' 
FROM PRODUCT;
GO