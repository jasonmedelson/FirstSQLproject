/*1. How many copies of the book titled The Lost Tribe are owned by the library branch whose name
is"Sharpstown"?*/

SELECT No_Of_Copies FROM book AS b INNER JOIN book_copies AS co
ON b.BookID = co.BookID
INNER JOIN library_branch AS li
ON  co.BranchID = li.BranchID
WHERE b.Title = 'The Lost Tribe' AND li.BranchName = 'Sharpstown'

/*2. How many copies of the book titled The Lost Tribe are owned by each library branch?*/

SELECT BranchName, No_of_copies FROM book AS b INNER JOIN book_copies AS co
ON b.BookID = co.BookID
INNER JOIN library_branch AS li
ON  co.BranchID = li.BranchID
WHERE b.Title = 'The Lost Tribe'

--3. Retrieve the names of all borrowers who do not have any books checked out.

SELECT bo.Name FROM book_loans AS lo FULL OUTER JOIN borrower AS bo
ON lo.CardNo = bo.CardNo
WHERE lo.CardNo IS NULL OR bo.CardNo IS NULL

/*4. For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
retrieve the book title, the borrower's name, and the borrower's address.*/

SELECT b.Title, bo.Name, bo.Address, lo.DateDue FROM book AS b FULL OUTER JOIN book_loans AS lo
ON b.BookID = lo.BookID
FULL OUTER JOIN library_branch AS li
ON lo.BranchID = li.BranchID
FULL OUTER JOIN borrower AS bo
ON lo.CardNo = bo.CardNo
WHERE lo.BranchID = 1 AND lo.DateDue = CONVERT(date, getdate()) 


/*5. For each library branch, retrieve the branch name and the total number of books loaned out from
that branch.*/

SELECT li.BranchName, COUNT(*) AS loans FROM book_loans AS b INNER JOIN library_branch AS li
ON b.BranchID = li.BranchID
GROUP BY li.BranchName


/*6. Retrieve the names, addresses, and number of books checked out for all borrowers who have more
than five books checked out.*/

SELECT name, address, COUNT(*) AS 'books checked out' FROM book_loans AS bo  INNER JOIN borrower AS bor
ON bo.CardNo = bor.CardNo
GROUP BY bor.Name, bor.Address
HAVING COUNT(*) > 5
ORDER BY bor.Name

/*7. For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of
copies owned by the library branch whose name is "Central"*/

SELECT b.Title, No_of_copies FROM book AS b INNER JOIN book_copies AS co
ON b.BookID = co.BookID
INNER JOIN library_branch AS li
ON co.BranchID = li.BranchID
INNER JOIN book_authors AS au
ON b.BookID = au.BookID
WHERE li.BranchName = 'Central' AND au.AuthorName = 'Stephen King'