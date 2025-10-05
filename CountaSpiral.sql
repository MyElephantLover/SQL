--# write your SQL statement here: 
-- you are given a table 'spiral' with column 'n'.
-- create a query with:
--   this column and your result in a column named 'res'
--   ordered ascending by 'n'

SELECT
    n,
    FLOOR((n * n + (n - 1) * (n - 1)) / 2)::bigint AS res
FROM
    spiral
ORDER BY
    n;

-- OEIS A274059: a(n) = floor(n^2 / 2) + (n mod 2)
-- a(n) = (n * n) / 2     if n is even  
-- a(n) = (n * n + 1) / 2 if n is odd


