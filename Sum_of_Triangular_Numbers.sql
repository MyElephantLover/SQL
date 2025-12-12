-- Triangular Number: "any of the series of numbers (1, 3, 6, 10, 15, etc.) obtained by continued summation of the natural numbers 1, 2, 3, 4, 5, etc."

-- [01]
-- 02 [03]
-- 04 05 [06]
-- 07 08 09 [10]
-- 11 12 13 14 [15]
-- 16 17 18 19 20 [21]
-- e.g. If 4 is given: 1 + 3 + 6 + 10 = 20.

-- Triangular Numbers cannot be negative so return 0 if a negative number is given.

select n,
        case when n < 0 then 0 -- the constraint
        else (n::bigint*(n + 1)*(n + 2))/6 end as res
from sumtriangular
;
--The formula for triangular numbers is: Summation (k = 1 to n) k(k + 1) / 2 equals to k(k + 1)(k + 2)/6


