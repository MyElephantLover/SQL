--# write your SQL statement here: 
-- you are given a table 'fibo' with column 'n'.
-- return a table with:
--   this column and your result in a column named 'res'
--   ordered ascending by 'n'
--   distinct results (remove duplicates)

-- This one I referred to ai tool for guidance because I know 
-- needs a recursive function but not know where to start

-- use recursive CTE

with recursive fib(n, res, next) AS
(
    select 1, 0, 1 -- fibo(1) = 0
    union all
    select n + 1, next, res + next
    from fib
    where n < (select mx(n) from fibo)
)

select distinct f.n, f.res from fib f join fibo on f.n = fibo.n  
order by f.n asc;

