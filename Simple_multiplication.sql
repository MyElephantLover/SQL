-- This kata is about multiplying a given number by eight if it is an even number and by nine otherwise.

-- # write your SQL statement here: you are given a table 'multiplication' with column 'number', return a table with column 'number' and your result in a column named 'res'.

select number,
        case when number % 2 = 0 then number * 8
        else number * 9
        end as res
from multiplication
;

