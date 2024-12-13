CREATE DATABASE WalletDB;
USE WalletDB;

DROP TABLE BANKACCOUNT;
DROP TABLE TRANSACTION;
DROP TABLE REQUEST;
DROP TABLE USER;
DROP TABLE EMAIL;

CREATE TABLE EMAIL (
    EmailAddress VARCHAR(100) PRIMARY KEY,
    VerificationStatus BOOLEAN NOT NULL
);

CREATE TABLE USER (
    UserID INT PRIMARY KEY,
    SSN VARCHAR(11) UNIQUE NOT NULL,
    Name VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15),
    EmailAddress VARCHAR(100),
    VerificationStatus BOOLEAN NOT NULL,
    DateJoined DATE NOT NULL,
    CONSTRAINT FK_User_Email FOREIGN KEY (EmailAddress) REFERENCES EMAIL(EmailAddress) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE BANKACCOUNT (
    BankID INT PRIMARY KEY AUTO_INCREMENT,
    AccountNumber VARCHAR(20) UNIQUE NOT NULL,
    VerificationStatus BOOLEAN NOT NULL,
    UserID INT NOT NULL,
    CONSTRAINT FK_Bank_User FOREIGN KEY (UserID) REFERENCES USER(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TRANSACTION (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    TransactionType VARCHAR(50) NOT NULL,
    TransactionStatus VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    RecipientID INT NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    UserID INT NOT NULL,
    CONSTRAINT FK_User FOREIGN KEY (UserID) REFERENCES USER(UserID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE REQUEST (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    RequesterID INT NOT NULL,
    RequestTo VARCHAR(255) NOT NULL,
    Amount DECIMAL(10, 2) NOT NULL,
    Date DATE NOT NULL,
    RequestStatus VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (RequesterID) REFERENCES USER(UserID) ON DELETE CASCADE
);

INSERT INTO USER (UserID, SSN, Name, PhoneNumber, VerificationStatus, DateJoined)
VALUES
(1, '123-45-6789', 'John Miller', '555-9987', TRUE, '2021-04-12'),
(2, '987-65-4321', 'Jane Roberts', '555-4321', FALSE, '2020-11-23'),
(3, '456-78-9012', 'Alice Johnson', '555-3421', TRUE, '2019-08-05'),
(4, '321-98-7654', 'Bob Harris', '555-2143', TRUE, '2022-03-15'),
(5, '654-32-1987', 'Charlie Davis', '555-1876', FALSE, '2018-07-10'),
(6, '564-82-1903', 'Diane Wilson', '555-5039', TRUE, '2020-02-21'),
(7, '732-19-2834', 'Evan Walker', '555-6754', TRUE, '2021-01-13'),
(8, '564-92-4830', 'Fiona Clark', '555-8364', FALSE, '2022-09-17'),
(9, '823-46-5956', 'George Lewis', '555-9547', TRUE, '2021-05-19'),
(10, '937-65-8492', 'Hannah Scott', '555-2349', TRUE, '2023-01-04'),
(11, '823-90-2713', 'Ivy Evans', '555-5642', FALSE, '2020-08-30'),
(12, '183-72-3094', 'Jack Perez', '555-6875', TRUE, '2021-12-25'),
(13, '293-84-5601', 'Kara Turner', '555-1138', TRUE, '2022-06-03'),
(14, '657-49-3082', 'Leo Young', '555-7714', FALSE, '2019-10-17'),
(15, '185-47-3951', 'Mia Anderson', '555-2201', TRUE, '2020-01-09'),
(16, '372-91-5624', 'Nate Murphy', '555-9836', FALSE, '2021-07-22'),
(17, '923-16-4625', 'Olivia Carter', '555-7653', TRUE, '2018-11-04'),
(18, '634-81-2740', 'Paul Bennett', '555-4477', TRUE, '2022-03-01'),
(19, '473-82-7153', 'Quincy Mitchell', '555-5698', FALSE, '2021-06-18'),
(20, '826-34-9201', 'Rita Foster', '555-3422', TRUE, '2020-05-10'),
(21, '583-29-1638', 'Sam Morgan', '555-0291', TRUE, '2022-01-16'),
(22, '702-46-2135', 'Tina Campbell', '555-1428', FALSE, '2023-02-07'),
(23, '923-55-4917', 'Ursula Allen', '555-3086', TRUE, '2019-03-25'),
(24, '398-72-1865', 'Victor Simmons', '555-6347', FALSE, '2020-12-30'),
(25, '128-36-5392', 'Wendy Moore', '555-1115', TRUE, '2021-04-25');

INSERT INTO BANKACCOUNT (BankID, AccountNumber, VerificationStatus, UserID)
VALUES
(101, '1001002001', TRUE, 1),
(102, '1001003002', FALSE, 2),
(103, '1001004003', TRUE, 3),
(104, '1001005004', TRUE, 4),
(105, '1001006005', FALSE, 5),
(106, '1001007006', TRUE, 6),
(107, '1001008007', TRUE, 7),
(108, '1001009008', FALSE, 8),
(109, '1001010009', TRUE, 9),
(110, '1001011010', TRUE, 10),
(111, '1001012011', FALSE, 11),
(112, '1001013012', TRUE, 12),
(113, '1001014013', TRUE, 13),
(114, '1001015014', FALSE, 14),
(115, '1001016015', TRUE, 15),
(116, '1001017016', FALSE, 16),
(117, '1001018017', TRUE, 17),
(118, '1001019018', TRUE, 18),
(119, '1001020019', FALSE, 19),
(120, '1001021010', TRUE, 20),
(121, '1001022011', TRUE, 21),
(122, '1001023012', FALSE, 22),
(123, '1001024013', TRUE, 23),
(124, '1001025014', FALSE, 24),
(125, '1001026015', TRUE, 25);

INSERT INTO TRANSACTION (TransactionID, TransactionType, TransactionStatus, Date, RecipientID, Amount, UserID)
VALUES
(1001, 'Transfer', 'Completed', '2021-01-20', 2, 500.00, 1),
(1002, 'Payment', 'Pending', '2022-05-15', 3, 750.00, 2),
(1003, 'Refund', 'Failed', '2021-12-05', 4, 200.00, 3),
(1004, 'Transfer', 'Completed', '2020-11-10', 1, 300.00, 4),
(1005, 'Payment', 'Completed', '2021-08-17', 5, 1000.00, 5),
(1006, 'Transfer', 'Pending', '2022-07-05', 6, 150.00, 6),
(1007, 'Refund', 'Completed', '2022-09-10', 7, 300.00, 7),
(1008, 'Payment', 'Completed', '2021-05-19', 8, 500.00, 8),
(1009, 'Transfer', 'Failed', '2022-04-12', 9, 200.00, 9),
(1010, 'Refund', 'Completed', '2020-12-15', 10, 100.00, 10),
(1011, 'Payment', 'Pending', '2021-06-11', 11, 400.00, 11),
(1012, 'Transfer', 'Completed', '2022-03-01', 12, 600.00, 12),
(1013, 'Refund', 'Completed', '2023-01-01', 13, 350.00, 13),
(1014, 'Payment', 'Failed', '2021-11-21', 14, 150.00, 14),
(1015, 'Transfer', 'Completed', '2022-07-30', 15, 500.00, 15),
(1016, 'Payment', 'Pending', '2021-09-03', 16, 300.00, 16),
(1017, 'Refund', 'Completed', '2023-02-18', 17, 200.00, 17),
(1018, 'Transfer', 'Completed', '2022-08-23', 18, 450.00, 18),
(1019, 'Payment', 'Completed', '2021-10-10', 19, 700.00, 19),
(1020, 'Refund', 'Failed', '2022-06-25', 20, 250.00, 20),
(1021, 'Transfer', 'Pending', '2021-07-17', 21, 550.00, 21),
(1022, 'Payment', 'Completed', '2022-11-13', 22, 450.00, 22),
(1023, 'Refund', 'Failed', '2023-01-23', 23, 300.00, 23),
(1024, 'Transfer', 'Completed', '2022-02-05', 24, 600.00, 24),
(1025, 'Payment', 'Completed', '2023-03-01', 25, 750.00, 25);

INSERT INTO EMAIL (EmailAddress, VerificationStatus)
VALUES
('john.miller@example.com', TRUE),
('jane.roberts@example.net', FALSE),
('alice.johnson@gmail.com', TRUE),
('bob.harris@yahoo.com', TRUE),
('charlie.davis@hotmail.com', FALSE),
('diane.wilson@aol.com', TRUE),
('evan.walker@icloud.com', TRUE),
('fiona.clark@outlook.com', FALSE),
('george.lewis@gmail.com', TRUE),
('hannah.scott@yahoo.com', TRUE),
('ivy.evans@outlook.com', FALSE),
('jack.perez@aol.com', TRUE),
('kara.turner@gmail.com', TRUE),
('leo.young@hotmail.com', FALSE),
('mia.anderson@yahoo.com', TRUE),
('nate.murphy@icloud.com', FALSE),
('olivia.carter@gmail.com', TRUE),
('paul.bennett@outlook.com', TRUE),
('quincy.mitchell@aol.com', FALSE),
('rita.foster@icloud.com', TRUE),
('sam.morgan@yahoo.com', TRUE),
('tina.campbell@gmail.com', FALSE),
('ursula.allen@outlook.com', TRUE),
('victor.simmons@icloud.com', FALSE),
('wendy.moore@hotmail.com', TRUE);

SELECT * FROM USER;

/*CHECK FOR FOREIGN KEY CONSTARINTS*/
SELECT * FROM BANKACCOUNT WHERE UserID NOT IN (SELECT UserID FROM USER);
SELECT * FROM TRANSACTION WHERE UserID NOT IN (SELECT UserID FROM USER);

/*CHECK FOR NOT NULL CONSTRAINT*/
SELECT * FROM USER WHERE SSN IS NULL OR Name IS NULL OR PhoneNumber IS NULL OR VerificationStatus IS NULL OR DateJoined IS NULL;
SELECT * FROM BANKACCOUNT WHERE AccountNumber IS NULL OR VerificationStatus IS NULL OR UserID IS NULL;
SELECT * FROM TRANSACTION WHERE TransactionType IS NULL OR TransactionStatus IS NULL OR Date IS NULL OR RecipientID IS NULL OR Amount IS NULL OR UserID IS NULL;
