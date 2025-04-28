CREATE DATABASE LibraryManagement;
USE LibraryManagement;
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    PublishedYear INT
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    JoinDate DATE
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);
INSERT INTO Books (Title, Author, Genre, PublishedYear)
VALUES 
('The Alchemist', 'Paulo Coelho', 'Fiction', 1988),
('Atomic Habits', 'James Clear', 'Self-Help', 2018);

INSERT INTO Members (Name, JoinDate)
VALUES 
('John Doe', '2024-01-01'),
('Jane Smith', '2024-02-15');

INSERT INTO Loans (BookID, MemberID, LoanDate, ReturnDate)
VALUES 
(1, 1, '2024-03-01', '2024-03-10'),
(2, 2, '2024-03-05', '2024-03-15');
SELECT Members.Name, Books.Title, Loans.LoanDate, Loans.ReturnDate
FROM Loans
JOIN Members ON Loans.MemberID = Members.MemberID
JOIN Books ON Loans.BookID = Books.BookID;


