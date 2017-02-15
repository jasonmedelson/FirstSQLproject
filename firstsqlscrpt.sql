IF EXISTS (SELECT * FROM sys.databases
	WHERE [name] = 'TechAcademy')
DROP DATABASE TechAcademy
GO

CREATE DATABASE TechAcademy
GO

USE TechAcademy

CREATE TABLE book(
BookID INT PRIMARY KEY, Title varchar(30) not null, PublisherName varchar(50) null
)

INSERT INTO book
VALUES
	(1, 'Name of a Wind', 'Penguins'),
	(2, 'Way of Queens', 'Closed House'),
	(3, 'Words from Raidience', 'Closed House'),
	(4, 'The Lost Tribe', 'Randoms'),
	(5, 'The Found Tribe', 'Randoms'),
	(6, 'The Tribe Returns', 'Randoms'),
	(7, 'The Nobbit', 'Self'),
	(8, 'Fellowship of the Bands', 'Self'),
	(9, 'Three Towers', 'Self'),
	(10, 'Return of the Queen', 'Self'),
	(11, 'Wise Men Fear', 'Penguins'),
	(12, 'Door of Rock', 'Penguins'),
	(13, 'Catcher in the Grain', 'Closed House'),
	(14, 'Fogborn', 'Closed House'),
	(15, 'Alchemists Stone', 'UKPUB'),
	(16, 'Dresden Cabinet', 'Penguins'),
	(17, 'Twinight', 'Randoms'),
	(18, 'The Night', 'UKPUB'),
	(19, 'Cowboy War', 'Closed House'),
	(20, 'Shadow of Ways', 'Randoms')


CREATE TABLE book_authors(
BookID INT PRIMARY KEY, AuthorName varchar(30)
)

INSERT INTO book_authors
VALUES
	(1, 'Patrick'),
	(2, 'Brandon'),
	(3, 'Brandon'),
	(4, 'Joe'),
	(5, 'Joe'),
	(6, 'Joe'),
	(7, 'Tolkien'),
	(8, 'Tolkien'),
	(9, 'Tim'),
	(10, 'Tod'),
	(11, 'Patrick'),
	(12, 'Nick'),
	(13, 'Lewis'),
	(14, 'Brandon'),
	(15, 'JK'),
	(16, 'Jim'),
	(17, 'Sarah'),
	(18, 'Stephen King'),
	(19, 'Jess'),
	(20, 'Mindy')

CREATE TABLE publisher(
Name varchar(30) PRIMARY KEY, Address varchar(30) null, Phone INT null
)

INSERT INTO publisher
VALUES
	('Penguins', '101 Main St', 1111222333),
	('Closed House', '456 First St', 1987654321),
	('Randoms', '2468 Washington Ave', 1868757646),
	('Self', NULL, NULL),
	('UKPUB', '911 Tea Ln.',NULL)

CREATE TABLE library_branch(
BranchID INT PRIMARY KEY, BranchName varchar(30), Address varchar(30)
)

INSERT INTO library_branch
VALUES
	(1, 'Sharpstown', '444 Valencia Blvd'),
	(2, 'Central', '202 Main St'),
	(3, 'Westville', '98711 Tulip Ave'),
	(4, 'Freemont', '5577 Mowry Pl') 

CREATE TABLE book_copies(
BookID INT, BranchID INT, No_Of_Copies INT
)

INSERT INTO book_copies
VALUES
	(1, 1, 4),
	(2, 1, 2),
	(3, 1, 2),
	(4, 1, 3),
	(6, 1, 3),
	(8, 1, 4),
	(9, 1, 8),
	(11, 1, 2),
	(14, 1, 3),
	(18, 1, 3),
	(20, 1, 6),
	(1, 2, 4),
	(4, 2, 4),
	(5, 2, 5),
	(7, 2, 6),
	(10, 2, 4),
	(12, 2, 5),
	(13, 2, 4),
	(15, 2, 7),
	(16, 2, 3),
	(18 ,2, 4)
	(19, 2, 5),
	(1, 3, 2),
	(3, 3, 3),
	(4, 3, 2),
	(6, 3, 4),
	(7, 3, 4),
	(9, 3, 2),
	(10, 3, 3),
	(12, 3, 4),
	(14, 3, 2),
	(17, 3, 3),
	(1, 4, 2),
	(2, 4, 2),
	(5, 4, 2),
	(6, 4, 2),
	(7, 4, 2),
	(9, 4, 2),
	(10, 4, 2),
	(11, 4, 2),
	(18, 4, 2),
	(19, 4, 2)

CREATE TABLE borrower(
CardNo INT PRIMARY KEY, Name varchar(30), Address varchar(30), Phone varchar(30)
)

INSERT INTO borrower
VALUES
	(101, 'Jake', '103 Main St', 1234567234),
	(102, 'Nancy', '563 Torrey Ln', 1918273645),
	(103, 'Allison', '5673 Maimi Blvd', NUll),
	(104, 'Roy', NULL, 18989898980),
	(105, 'Chris', ' 905 Main St', 1456456456),
	(106, 'Billy', NULL, NULL),
	(107, 'Stugotz', '1800 Lebatard Ct', 1234567888),
	(108, 'Madison', '2222 California Wy', NULL)


CREATE TABLE book_loans(
BookID INT, BranchID INT, CardNo INT, DateOut DATE, DateDue DATE
)

INSERT INTO book_loans
VALUES
	(1, 1, 101, '2017-02-14', '2017-02-28'),
	(2, 1, 101, '2017-02-14', '2017-02-28'),
	(6, 1, 101, '2017-02-14', '2017-02-28'),
	(8, 1, 101, '2017-02-14', '2017-02-28'),
	(9, 1, 101, '2017-02-14', '2017-02-28'),
	(19, 2, 102, '2017-02-14', '2017-02-28'),
	(16, 2, 102, '2017-02-14', '2017-02-28'),
	(15, 2, 102, '2017-02-14', '2017-02-28'),
	(13, 2, 102, '2017-02-14', '2017-02-28'),
	(12, 2, 102, '2017-02-14', '2017-02-28'),
	(10, 2, 102, '2017-02-14', '2017-02-28'),
	(1, 3, 103, '2017-02-15', '2017-03-01'),
	(4, 3, 103, '2017-02-15', '2017-03-01'),
	(7, 3, 103, '2017-02-15', '2017-03-01'),
	(9, 3, 103, '2017-02-15', '2017-03-01'),
	(7, 4, 104, '2017-02-15', '2017-03-01'),
	(9, 4, 104, '2017-02-15', '2017-03-01'),
	(10, 4, 104, '2017-02-15', '2017-03-01'),
	(11, 4, 104, '2017-02-15', '2017-03-01'),
	(1, 4, 105, '2017-02-16', '2017-03-02'),
	(2, 4, 105, '2017-02-16', '2017-03-02'),
	(18, 1, 101, '2017-02-17', '2017-03-03'),
	(20, 1, 101, '2017-02-17', '2017-03-03'),
	(1, 1, 106, '2017-02-17', '2017-03-03'),
	(20, 1, 106, '2017-02-17', '2017-03-03'),
	(14, 3, 107, '2017-02-18', '2017-03-04'),
	(17, 3, 107, '2017-02-18', '2017-03-04'),
	(1, 3, 107, '2017-02-19', '2017-03-05'),
	(12, 3, 103, '2017-02-19', '2017-03-05'),
	(14, 3, 103, '2017-02-19', '2017-03-05'),
	(18, 1, 108, '2017-02-19', '2017-03-05'),
	(20, 1, 108, '2017-02-19', '2017-03-05'),
	(2, 4, 108, '2017-02-20', '2017-03-06'),
	(5, 4, 108, '2017-02-20', '2017-03-06'),
	(11, 1, 101, '2017-02-20', '2017-03-06'),
	(14, 1, 101, '2017-02-20', '2017-03-06'),
	(7, 3, 107, '2017-02-21', '2017-03-07'),
	(9, 3, 107, '2017-02-21', '2017-03-07'),
	(10, 3, 107, '2017-02-21', '2017-03-07'),
	(5, 4, 105, '2017-02-21', '2017-03-07'),
	(6, 4, 105, '2017-02-21', '2017-03-07'),
	(18, 4, 105, '2017-02-21', '2017-03-07'),
	(2, 1, 106, '2017-02-23', '2017-03-09'),
	(9, 1, 106, '2017-02-23', '2017-03-09'),
	(18, 1, 106, '2017-02-23', '2017-03-09'),
	(1, 2, 102, '2017-02-24', '2017-03-10'),
	(5, 2, 102, '2017-02-24', '2017-03-10'),
	(7, 2, 102, '2017-02-24', '2017-03-10'),
	(18, 4, 104, '2017-02-24', '2017-03-10'),
	(19, 4, 104, '2017-02-24', '2017-03-10')