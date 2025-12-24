-- Now you have to write a function that takes an argument and returns the square of it.

--# write your SQL statement here: 
-- you are given a table 'square' with column 'n'
-- return a table with:
--   this column and your result in a column named 'res'

create or replace function sqrt_func() -- in this question, the table square is an input, not an argument
returns table(n int, res bigint)
language plpgsql 
as $$
begin
return query -- in plpgsql, we need 'return query' to return rows
select s.n,
        s.n::bigint * s.n::bigint as res from square s; -- don't forget a semi-colon here
end;
$$;

select * from sqrt_func();

