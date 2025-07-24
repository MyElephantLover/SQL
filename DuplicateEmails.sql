-- Write a solution to report all the duplicate emails. Note that it's guaranteed that the email field is not NULL.
-- Return the result table in any order.

-- wrote this question a long time ago, surprising I still remembered how to solve it
-- to find duplicates in SQL is use differnet alias referring to the same table

select a.email as Email
from Person a, Person b
where a.id != b.id and a.email = b.email
group by 1
;


