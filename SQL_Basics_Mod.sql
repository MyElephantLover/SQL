-- Given the following table 'decimals':

-- ** decimals table schema **

-- id
-- number1
-- number2
-- Return a table with one column (mod) which is the output of number1 modulus number2.

select case when number2 = 0 then 0
        else number1 % number2 end as mod from decimals;

-- When Cast is not needed --
-- % modulus is defined for integer types
-- e.g. smallint % smallint / bigint % bigint
-- Plpgsql implicitly cast compatible integer types if needed

-- When Cast is needed? --
-- decimal / numetric types or flocating-point numbers, aka decimal precision



