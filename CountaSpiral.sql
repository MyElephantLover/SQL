--# write your SQL statement here: 
-- you are given a table 'spiral' with column 'n'.
-- create a query with:
--   this column and your result in a column named 'res'
--   ordered ascending by 'n'

SELECT n, (n + 1) * (n + 1) / 2 - 1 AS res 
FROM spiral
ORDER BY 1

-- Arithmettic progression: the sequence of numbers that the difference from any succeeding terms to any preceeding terms remains constant throughtout the sequence



