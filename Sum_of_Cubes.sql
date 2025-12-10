-- Write a function that takes a positive integer n, sums all the cubed values from 1 to n (inclusive), and returns that sum.

-- Assume that the input n will always be a positive integer.

-- Examples: (Input --> output)

-- 2 --> 9 (sum of the cubes of 1 and 2 is 1 + 8)
-- 3 --> 36 (sum of the cubes of 1, 2, and 3 is 1 + 8 + 27)

-- The first approach: Use mathematical way, that 1^3 + 2^3 + ... + n^3 can be derived with the formula
-- (n * (n + 1) / 2)^2
select n,
       (n * (n + 1) / 2)*(n * (n + 1) / 2)::bigint as res  
from cubes 
order by n asc;


-- The second approach: Use generate_series() function i splpgsql. In plpgsql, generate_series() is a semi-returning function
-- that sum(power(generate_series(i , 3))) means 1^3 + 2^3 + ... + i^3

select n,
        sum(power(i , 3))::bigint as res  
from cubes
join generate_series(1, n) as i on true 
group by n 
order by n asc
;


-- or not use power() function --

select n,
       sum(i * i * i):: bigint as res  
from cubes
join generate_series(1, n) as i on true 
group by n 
order by n asc;

