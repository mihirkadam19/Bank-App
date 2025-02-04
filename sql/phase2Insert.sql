drop database bank_phase2;
create database bank_phase2;
use bank_phase2;

CREATE TABLE BRANCH (
    BID INT PRIMARY KEY,
    Name VARCHAR(100),
    Assets DECIMAL(15, 2),
    City VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE MANAGER (
	BID INT PRIMARY KEY,
    MANAGER INT
);

CREATE TABLE ASSISTANT_MGR(
	BID INT PRIMARY KEY,
    ASSISTANTMANAGER INT
);


CREATE TABLE EMPLOYEE (
	EmpID INT AUTO_INCREMENT PRIMARY KEY,
    SSN INT UNIQUE,
    Name VARCHAR(100),
    StartDate DATE,
    TeleNo VARCHAR(15),
    DependentName VARCHAR(100),
    BID INT
);
ALTER TABLE EMPLOYEE AUTO_INCREMENT = 1201;

CREATE TABLE CUSTOMER (
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    CSSN INT UNIQUE,
    Name VARCHAR(100),
    City VARCHAR(100),
    State VARCHAR(100),
    Zipcode VARCHAR(10),
    StreetNo VARCHAR(10),
    AptNo VARCHAR(10)
);

-- Set the starting value for CustomerID to 1000
ALTER TABLE CUSTOMER AUTO_INCREMENT = 100000;


CREATE TABLE ACCOUNT (
    AccNo INT AUTO_INCREMENT PRIMARY KEY,
    Balance DECIMAL(15, 2),
    Type ENUM('Savings', 'Checking', 'Money Market', 'Loan'),
    RecentAccess DATETIME,
    InterestsRate DECIMAL(5, 2),
    OverDraft DECIMAL(15, 2)
);
ALTER TABLE ACCOUNT AUTO_INCREMENT = 3400001;

CREATE TABLE ACC_OWNER (
    CustomerID INT,
    AccNo INT,
    PRIMARY KEY (CustomerID, AccNo)
);


CREATE TABLE TRANSACTION (
    TID INT AUTO_INCREMENT,
    CustomerID INT,
    AccNo INT,
    Code ENUM('WD', 'CD'),
    Date DATE,
    Time Time,
    Amount DECIMAL(15, 2),
    Charge DECIMAL(15, 2),
    PRIMARY KEY (TID, CustomerID, AccNo)
);



CREATE TABLE PERSONAL_BANKER (
    CustomerID INT,
    BID INT,
    ESSN INT,
    PRIMARY KEY (CustomerID)
);



CREATE TABLE LOANS (
    CustomerID INT,
    AccNo INT,
    BID INT,
    Amount DECIMAL(15, 2),
    LoanNo INT PRIMARY KEY,
    MonthlyRepayment DECIMAL(15, 2)
);





ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (BID) REFERENCES BRANCH(BID) ON DELETE CASCADE;

ALTER TABLE MANAGER
ADD FOREIGN KEY (Manager) REFERENCES EMPLOYEE(SSN) ON DELETE SET NULL,
ADD foreign key (BID) references branch(BID) ON DELETE CASCADE;

ALTER TABLE ASSISTANT_MGR
ADD FOREIGN KEY (AssistantManager) REFERENCES EMPLOYEE(SSN) ON DELETE SET NULL,
ADD foreign key (BID) references branch(BID) ON DELETE CASCADE;

ALTER TABLE ACC_OWNER
ADD FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE,
ADD FOREIGN KEY (AccNo) REFERENCES ACCOUNT(AccNo) ON DELETE CASCADE;

ALTER TABLE PERSONAL_BANKER
ADD FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE,
ADD FOREIGN KEY (BID) REFERENCES BRANCH(BID) ON DELETE SET NULL,
ADD FOREIGN KEY (ESSN) REFERENCES EMPLOYEE(SSN) ON DELETE SET NULL;

ALTER TABLE LOANS
ADD FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE,
ADD FOREIGN KEY (AccNo) REFERENCES ACCOUNT(AccNo) ON DELETE CASCADE,
ADD FOREIGN KEY (BID) REFERENCES BRANCH(BID) ON DELETE SET NULL;









-- Insert data into BRANCH
INSERT INTO BRANCH (BID, Name, Assets, City, Address) VALUES
(1, 'Downtown Branch', 5000000.00, 'New York', '123 Wall Street'),
(2, 'Uptown Branch', 3000000.00, 'New York', '456 Madison Ave'),
(3, 'Suburban Branch', 2000000.00, 'New Jersey', '789 Maple St'),
(4, 'Central Branch', 7000000.00, 'Los Angeles', '101 Sunset Blvd'),
(5, 'Midtown Branch', 4500000.00, 'Chicago', '202 Loop Rd');

-- Insert data into EMPLOYEE
INSERT INTO EMPLOYEE (SSN, Name, StartDate, TeleNo, DependentName, BID) VALUES
(111111111, 'John Doe', '2022-01-15', '555-1234', 'Jane Doe', 1),
(222222222, 'Sarah Smith', '2021-03-22', '555-5678', 'Peter Smith', 1),
(333333333, 'Michael Brown', '2020-07-12', '555-8765', 'Mary Brown', 2),
(444444444, 'Emily White', '2019-05-30', '555-3456', 'David White', 2),
(555555555, 'Chris Green', '2018-08-14', '555-7890', 'Sophia Green', 3),
(666666666, 'Amanda Black', '2017-11-19', '555-2345', 'James Black', 3),
(777777777, 'Daniel Lee', '2016-02-10', '555-4567', 'Anna Lee', 4),
(888888888, 'Laura Young', '2015-04-18', '555-6789', 'Ethan Young', 4),
(999999999, 'Thomas King', '2014-09-12', '555-9012', 'Isabella King', 5),
(123456789, 'Jessica Wright', '2013-12-25', '555-3456', 'George Wright', 5);

-- Insert data into MANAGER (5 managers)
INSERT INTO MANAGER (BID, MANAGER) VALUES
(1, 111111111),
(2, 333333333),
(3, 555555555),
(4, 777777777),
(5, 999999999);

-- Insert data into ASSISTANT_MGR (5 assistant managers)
INSERT INTO ASSISTANT_MGR (BID, ASSISTANTMANAGER) VALUES
(1, 222222222),
(2, 444444444),
(3, 666666666),
(4, 888888888),
(5, 123456789);


-- Insert data into CUSTOMER
INSERT INTO CUSTOMER (CSSN, Name, City, State, Zipcode, StreetNo, AptNo) VALUES
(111223333, 'Alice Johnson', 'New York', 'NY', '10001', '101', '1A'),
(222334444, 'Bob Lee', 'Los Angeles', 'CA', '90001', '202', '2B'),
(333445555, 'Carol White', 'Chicago', 'IL', '60601', '303', '3C'),
(444556666, 'David Smith', 'Houston', 'TX', '77001', '404', '4D'),
(555667777, 'Emma Brown', 'Phoenix', 'AZ', '85001', '505', '5E');

-- Insert data into ACCOUNT
INSERT INTO ACCOUNT (Balance, Type, RecentAccess, InterestsRate, OverDraft) VALUES
(1500.00, 'Savings', '2024-01-15 10:15:00', 0.5, NULL),
(2500.00, 'Checking', '2024-02-20 14:30:00', NULL, 500.00),
(3000.00, 'Money Market', '2024-03-10 09:45:00', 1.5, NULL),
(5000.00, 'Savings', '2024-04-05 13:20:00', 0.75, NULL),
(4500.00, 'Checking', '2024-05-01 15:00:00', NULL, 300.00);

-- Insert data into ACC_OWNER (Associates customers with accounts)
INSERT INTO ACC_OWNER (CustomerID, AccNo) VALUES
(100000, 3400001),
(100001, 3400002),
(100002, 3400003),
(100003, 3400004),
(100004, 3400005);

-- Insert data into the updated TRANSACTION table
INSERT INTO TRANSACTION (CustomerID, AccNo, Code, Date, Time, Amount, Charge) VALUES
(100000, 3400001, 'WD', '2024-06-15', '09:30:00', 200.00, 1.00),
(100001, 3400002, 'CD', '2024-07-20', '10:45:00', 500.00, 2.50),
(100002, 3400003, 'WD', '2024-08-10', '11:15:00', 300.00, 1.50),
(100003, 3400004, 'CD', '2024-09-05', '12:30:00', 400.00, 2.00),
(100004, 3400005, 'WD', '2024-10-01', '13:00:00', 150.00, 1.25);


-- Insert data into PERSONAL_BANKER (Links customers with a banker at a specific branch)
INSERT INTO PERSONAL_BANKER (CustomerID, BID, ESSN) VALUES
(100000, 1, 111111111),
(100001, 2, 333333333),
(100002, 3, 555555555),
(100003, 4, 777777777),
(100004, 5, 999999999);

-- Insert data into LOANS (Loans associated with customers and accounts)
INSERT INTO LOANS (CustomerID, AccNo, BID, Amount, LoanNo, MonthlyRepayment) VALUES
(100000, 3400001, 1, 10000.00, 400001, 250.00),
(100001, 3400002, 2, 15000.00, 400002, 300.00),
(100002, 3400003, 3, 20000.00, 400003, 400.00),
(100003, 3400004, 4, 25000.00, 400004, 500.00),
(100004, 3400005, 5, 30000.00, 400005, 600.00);










-- Select all from BRANCH
SELECT * FROM BRANCH;

-- Select all from EMPLOYEE
SELECT * FROM EMPLOYEE;

-- Select all from MANAGER
SELECT * FROM MANAGER;

-- Select all from ASSISTANT_MGR
SELECT * FROM ASSISTANT_MGR;

-- Select all from CUSTOMER
SELECT * FROM CUSTOMER;

-- Select all from ACCOUNT
SELECT * FROM ACCONT;

-- Select all from ACC_OWNER
SELECT * FROM ACC_OWNER;

-- Select all from TRANSACTION
SELECT * FROM TRANSACTION;

-- Select all from PERSONAL_BANKER
SELECT * FROM PERSONAL_BANKER;

-- Select all from LOANS
SELECT * FROM LOANS;


-- Update and Delete operations for BRANCH table
UPDATE BRANCH SET Assets = 5500000.00 WHERE BID = 1;
DELETE FROM BRANCH WHERE BID = 5;

-- Update and Delete operations for EMPLOYEE table
UPDATE EMPLOYEE SET TeleNo = '555-4321' WHERE SSN = 111111111;
DELETE FROM EMPLOYEE WHERE EmpID = 1201;

-- Update and Delete operations for MANAGER table
UPDATE MANAGER SET MANAGER = 222222222 WHERE BID = 1;
DELETE FROM MANAGER WHERE BID = 5;

-- Update and Delete operations for ASSISTANT_MGR table
UPDATE ASSISTANT_MGR SET ASSISTANTMANAGER = 555555555 WHERE BID = 2;
DELETE FROM ASSISTANT_MGR WHERE BID = 5;

-- Update and Delete operations for CUSTOMER table
UPDATE CUSTOMER SET City = 'Brooklyn' WHERE CustomerID = 100000;
DELETE FROM CUSTOMER WHERE CustomerID = 100004;

-- Update and Delete operations for ACCOUNT table
UPDATE ACCOUNT SET Balance = 2000.00 WHERE AccNo = 3400001;
DELETE FROM ACCOUNT WHERE AccNo = 3400005;

-- Update and Delete operations for ACC_OWNER table
UPDATE ACC_OWNER SET CustomerID = 100002 WHERE AccNo = 3400001;
DELETE FROM ACC_OWNER WHERE CustomerID = 100004 AND AccNo = 3400005;

-- Update and Delete operations for TRANSACTION table
UPDATE TRANSACTION SET Charge = 1.50 WHERE TID = 1;
DELETE FROM TRANSACTION WHERE TID = 5;

-- Update and Delete operations for PERSONAL_BANKER table
UPDATE PERSONAL_BANKER SET ESSN = 333333333 WHERE CustomerID = 100000;
DELETE FROM PERSONAL_BANKER WHERE CustomerID = 100004;

-- Update and Delete operations for LOANS table
UPDATE LOANS SET MonthlyRepayment = 275.00 WHERE LoanNo = 400001;
DELETE FROM LOANS WHERE LoanNo = 400005;


SELECT Type, SUM(Balance) AS TotalBalance
FROM ACCOUNT
GROUP BY Type;

SELECT Type, SUM(Balance) AS TotalBalance
FROM ACCOUNT
GROUP BY Type
HAVING SUM(Balance) > 5000;

SELECT CustomerID, SUM(Balance) AS TotalBalance
FROM ACCOUNT
JOIN ACC_OWNER ON ACCOUNT.AccNo = ACC_OWNER.AccNo
GROUP BY CustomerID
HAVING SUM(Balance) > ALL (
    SELECT SUM(Balance)
    FROM ACCOUNT
    JOIN ACC_OWNER ON ACCOUNT.AccNo = ACC_OWNER.AccNo
    WHERE CustomerID = 100000
    GROUP BY CustomerID
);


SELECT CustomerID, SUM(Balance) AS TotalBalance
FROM ACCOUNT
JOIN ACC_OWNER ON ACCOUNT.AccNo = ACC_OWNER.AccNo
WHERE CustomerID IN (
    SELECT CustomerID
    FROM PERSONAL_BANKER
)
GROUP BY CustomerID
HAVING SUM(Balance) > 2000;



SELECT Type, SUM(Balance) AS TotalBalance
FROM ACCOUNT
GROUP BY Type;


SELECT Type, SUM(Balance) AS TotalBalance
FROM ACCOUNT
GROUP BY Type
HAVING SUM(Balance) > 5000;


SELECT CustomerID, SUM(Balance) AS TotalBalance
FROM ACCOUNT
JOIN ACC_OWNER ON ACCOUNT.AccNo = ACC_OWNER.AccNo
GROUP BY CustomerID
HAVING SUM(Balance) > ALL (
    SELECT SUM(Balance)
    FROM ACCOUNT
    JOIN ACC_OWNER ON ACCOUNT.AccNo = ACC_OWNER.AccNo
    WHERE CustomerID = 100000
    GROUP BY CustomerID
);

SELECT CustomerID, SUM(Balance) AS TotalBalance
FROM ACCOUNT
JOIN ACC_OWNER ON ACCOUNT.AccNo = ACC_OWNER.AccNo
WHERE CustomerID IN (
    SELECT CustomerID
    FROM PERSONAL_BANKER
)
GROUP BY CustomerID
HAVING SUM(Balance) > 2000;

