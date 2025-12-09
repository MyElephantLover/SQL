-- Write a program that finds the summation of every number from 1 to num (both inclusive). The number will always be a positive integer greater than 0. Your function only needs to return the result, what is shown between parentheses in the example below is how you reach that result and it's not part of it, see the sample tests.

-- For example (Input -> Output):

-- 2 -> 3 (1 + 2)
-- 8 -> 36 (1 + 2 + 3 + 4 + 5 + 6 + 7 + 8)

-- calculate the summation from 1 to n is the formula: ((1+n)*n)/2, the formula for calculating
-- the area of a trapezoid

create or replace function summation()
returns table(n int, res int)
language sql  
as $$
    select n,
            ((1 + n)*n)/2 as res  -- the question said the number would always be positive and gt 0
    from kata;
$$;

select * from summation();

