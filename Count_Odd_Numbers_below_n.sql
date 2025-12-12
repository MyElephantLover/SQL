-- Given a number n, return the number of positive odd numbers below n, EASY!

-- Examples (Input -> Output)
-- 7  -> 3 (because odd numbers below 7 are [1, 3, 5])
-- 15 -> 7 (because odd numbers below 15 are [1, 3, 5, 7, 9, 11, 13])

-- Expect large Inputs!


select n,
        floor(n / 2)::bigint as res 
from oddcount
;

-- bigint used to deal with very large numbers, bigint is 64-bit signed integer
-- can be as big as 9 times 10 to the eighteeth power, more than large for everything
-- but not infinite
-- Rule of Thumb --
-- int for counts, caseID under billions 
-- bigint for timestamps, eventcounter, largeIDs
-- numeric for money, crypto, scientific precision

-- floor() is rounding down, finding the largest number <= x
-- ceiling() is rounding up, finding the smallest number >= x

