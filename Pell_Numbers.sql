--# write your SQL statement here: 
-- you are given a table 'pell' with column 'n'.
-- return a table with:
--   this column and your result in a column named 'res'
--   ordered ascending by 'n'
--   distinct results (remove duplicates)

with recursive pell_seq(n, res, p_prev) as (
-- base case: n = 0 -> res = 0, p_prev = 0 (dummy for recursion)
select 1::bigint, 0::bigint, 0::bigint
union all
-- recursive case: when n is 0, next is (1, 1, 0)
-- from n >= 1: next is (n + 1, 2* res + p_prev, res)
select n + 1,
       case when n = 1 then 1 else 2*res + p_prev end, -- the column res
       res
from pell_seq
where n < least((select max(n) from pell), 80)
)

select distinct p.n, ps.res
from pell p
join pell_seq ps on ps.n = p.n
order by n asc

-- In the SQL version the description describes the sequence of pell numbers as 0-indexed, but the test expect it to be 1-indexed.
-- In other words: The description states P(0) = 0, P(1) = 1, ..., but the tests expect P(1) = 0, P(2) = 1, ....