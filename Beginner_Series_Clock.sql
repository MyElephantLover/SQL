-- Clock shows h hours, m minutes and s seconds after midnight.
-- Your task is to write a function which returns the time since midnight in milliseconds.

-- Input constraints:
-- 0 <= h <= 23
-- 0 <= m <= 59
-- 0 <= s <= 59

create or replace function clock()
returns table (res int)
language sql 
as $$
    select h*60*60*1000 + m*60*1000 + s*1000 as res 
    from past; -- be sure to add semi-colon at the end
$$; -- be sure to have $$ to end the function

select * from clock(); -- be sure to add the parenthesis



