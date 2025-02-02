DROP DATABASE AUTO1;
CREATE DATABASE LIBRARY;
USE LIBRARY;
-- CREATING  A LIBRARY MANAGEMENT SYSTEM
--CREATE TABLE BOOK
CREATE TABLE BOOKS
(Book_ID  VARCHAR(20)NOT NULL PRIMARY KEY,
Title  VARCHAR(30) NOT NULL,
Author VARCHAR(35) UNIQUE NOT NULL, 
Genre VARCHAR(40) NOT NULL);
--CREATE TABLE MEMBERS
CREATE TABLE MEMBERS
(Member_ID VARCHAR(20) PRIMARY KEY NOT NULL,
Name VARCHAR(30) NOT NULL,
Email VARCHAR(20) NOT NULL,
Phone_Number BIGINT UNIQUE NOT NULL,
Membership_Type VARCHAR(30) CHECK (Membership_Type
IN('Student', 'Faculty','Guest')));
--CREATE TABLE TRANSACTION
CREATE TABLE TRANSACTIONS
(Transaction_ID VARCHAR(20) PRIMARY KEY NOT NULL,
Book_ID VARCHAR(20) NOT NULL,
Member_ID VARCHAR(20) NOT NULL,
Issue_Date DATETIME ,
Return_Date DATETIME,
Status varchar(20) CHECK (Status IN ('Borrowed','Returned')),
FOREIGN KEY(Book_ID) REFERENCES BOOKS(Book_ID),
FOREIGN KEY(Member_ID) REFERENCES MEMBERS(Member_ID));
--CREATING TABLE STATUS
CREATE TABLE STATUS
(Staff_ID VARCHAR(20) NOT NULL ,
Name VARCHAR(30),
Email VARCHAR(40),
Role VARCHAR(30) CHECK( Role IN('LIBRARIAN','ADMIN')));

ALTER TABLE STATUS ADD 
Transaction_ID VARCHAR(20);
ALTER TABLE STATUS 
ADD CONSTRAINT FK FOREIGN KEY(Transaction_ID)
REFERENCES TRANSACTIONS(Transaction_ID);
USE LIBRARY;
--Inserting books
INSERT INTO BOOKS (Book_ID, Title, Author, Genre) VALUES
('B001', 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic Literature'),
('B002', 'Dune', 'Frank Herbert', 'Science Fiction'),
('B003', 'Pride and Prejudice', 'Jane Austen', 'Romance'),
('B004', 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy'),
('B005', '1984', 'George Orwell', 'Dystopian Fiction');

-- Inserting members
INSERT INTO MEMBERS (Member_ID, Name, Email, Phone_Number, Membership_Type) VALUES
('M001', 'John Smith', 'john@email.com', 1234567890, 'Student'),
('M002', 'Sarah Johnson', 'sarah@email.com', 2345678901, 'Faculty'),
('M003', 'Mike Wilson', 'mike@email.com', 3456789012, 'Guest'),
('M004', 'Emma Davis', 'emma@email.com', 4567890123, 'Student'),
('M005', 'Robert Brown', 'robert@email.com', 5678901234, 'Faculty');

-- Inserting transactions
INSERT INTO TRANSACTIONS (Transaction_ID, Book_ID, Member_ID, Issue_Date, Return_Date, Status) VALUES
('T001', 'B001', 'M001', '2024-01-15 10:00:00', '2024-02-15 10:00:00', 'Borrowed'),
('T002', 'B002', 'M002', '2024-01-20 11:30:00', '2024-01-27 15:45:00', 'Returned'),
('T003', 'B003', 'M003', '2024-01-25 14:20:00', '2024-02-25 14:20:00', 'Borrowed'),
('T004', 'B004', 'M004', '2024-01-30 09:15:00', '2024-02-06 16:30:00', 'Returned'),
('T005', 'B005', 'M005', '2024-02-01 13:45:00', '2024-03-01 13:45:00', 'Borrowed');

-- Inserting status records
INSERT INTO STATUS (Staff_ID, Name, Email, Role, Transaction_ID) VALUES
('S001', 'Lisa Cooper', 'lisa@library.com', 'LIBRARIAN', 'T001'),
('S002', 'David Miller', 'david@library.com', 'ADMIN', 'T002'),
('S003', 'Anna White', 'anna@library.com', 'LIBRARIAN', 'T003'),
('S004', 'James Taylor', 'james@library.com', 'LIBRARIAN', 'T004'),
('S005', 'Maria Garcia', 'maria@library.com', 'ADMIN', 'T005');
SELECT * FROM MEMBERS;
SELECT * FROM BOOKS;
SELECT * FROM TRANSACTIONS;
SELECT * FROM STATUS;



