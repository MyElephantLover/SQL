-- You work at a book store. It's the end of the month, and you need to find out the 5 bestselling books at your store. Use a select statement to list names, authors, and number of copies sold of the 5 books which were sold most.

-- books table schema

-- name
-- author
-- copies_sold


select name, author, copies_sold
from books
order by copies_sold desc 
limit 5
;

-- since the column, copies_sold, already aggregate the counts for each book for us
-- we only need to order it in desc and limit the top 5 best sellers


