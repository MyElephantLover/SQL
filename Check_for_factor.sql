-- This function should test if the factor is a factor of base.
-- Return true if it is a factor or false if it is not.

-- About factors
-- Factors are numbers you can multiply together to get another number.

-- 2 and 3 are factors of 6 because: 2 * 3 = 6

-- You can find a factor by dividing numbers. If the remainder is 0 then the number is a factor.
-- You can use the mod operator (%) in most languages to check for a remainder
-- For example 2 is not a factor of 7 because: 7 % 2 = 1

-- -- Note: base is a non-negative number, factor is a positive number.

create or replace function check_factor()
returns table(id int, res boolean)
language sql 
as $$
    select id,
    -- base can be 0, and every factor is a factor of 0
    case when base = 0 then true  
    when base % factor = 0 then true else false end as res 
    from kata;
$$

-- call the function

select * from check_factor();

