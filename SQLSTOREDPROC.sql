CREATE PROCEDURE RUNQUERYNUM @query INT
AS
	IF(@query = 1)
		SELECT No_Of_Copies FROM book AS b INNER JOIN book_copies AS co
		ON b.BookID = co.BookID
		INNER JOIN library_branch AS li
		ON  co.BranchID = li.BranchID
		WHERE b.Title = 'The Lost Tribe' AND li.BranchName = 'Sharpstown';
	
	IF(@query = 2)
		SELECT BranchName, No_of_copies FROM book AS b INNER JOIN book_copies AS co
		ON b.BookID = co.BookID
		INNER JOIN library_branch AS li
		ON  co.BranchID = li.BranchID
		WHERE b.Title = 'The Lost Tribe';

	IF(@query = 3)
		SELECT bo.Name FROM book_loans AS lo FULL OUTER JOIN borrower AS bo
		ON lo.CardNo = bo.CardNo
		WHERE lo.CardNo IS NULL OR bo.CardNo IS NULL;

	IF(@query = 4)
		SELECT b.Title, bo.Name, bo.Address, lo.DateDue FROM book AS b FULL OUTER JOIN book_loans AS lo
		ON b.BookID = lo.BookID
		FULL OUTER JOIN library_branch AS li
		ON lo.BranchID = li.BranchID
		FULL OUTER JOIN borrower AS bo
		ON lo.CardNo = bo.CardNo
		WHERE lo.BranchID = 1 AND lo.DateDue = CONVERT(date, getdate()); 

	IF(@query = 5)
		SELECT li.BranchName, COUNT(*) AS loans FROM book_loans AS b INNER JOIN library_branch AS li
		ON b.BranchID = li.BranchID
		GROUP BY li.BranchName;

	IF(@query = 6)
		SELECT name, address, COUNT(*) AS 'books checked out' FROM book_loans AS bo  INNER JOIN borrower AS bor
		ON bo.CardNo = bor.CardNo
		GROUP BY bor.Name, bor.Address
		HAVING COUNT(*) > 5
		ORDER BY bor.Name;

	IF(@query = 7)
		SELECT b.Title, No_of_copies FROM book AS b INNER JOIN book_copies AS co
		ON b.BookID = co.BookID
		INNER JOIN library_branch AS li
		ON co.BranchID = li.BranchID
		INNER JOIN book_authors AS au
		ON b.BookID = au.BookID
		WHERE li.BranchName = 'Central' AND au.AuthorName = 'Stephen King';