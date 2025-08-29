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
    select 1::BIGINT, 0::BIGINT, 1::bigint -- fibo(1) = 0
    union all
    select n + 1, next, res + next -- fibo(n+1) = fibo(n) + fibo(n - 1)
    from fib
    where n < least((select max(n) from fibo), 80)
)

select distinct f.n, f.res from fib f join fibo on f.n = fibo.n  
order by f.n asc;

-- the solution to work around the error "PG::NumericValueOutOfRange: ERROR: integer out of range"
-- is to cast the integer to the data type ::Bigint



