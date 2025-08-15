-- --# write your SQL statement here: you are given a table 'dnastrand' with column 'dna', return a table with column 'dna' and your result in a column named 'res'.

-- Table: dnastrand
-- Column: dna
-- Requested results: dna, res

-- 1, Retrieve string in "dna" column
-- 2, Replace A <> T, C <> G
-- 3, Return original string in "dna", transformed string in "res"

select dns, TRANSLATE(dna, 'ATCG', 'TAGC') as res
from dnastrand

