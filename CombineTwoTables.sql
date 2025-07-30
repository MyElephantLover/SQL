-- Write a solution to report the first name, last name, city, and state of each person in the Person table. If the address of a personId is not present in the Address table, report null instead.
-- Return the result table in any order.

select a.firstName, a.lastName, b.city, b.state 
from Person a left join Address b 
on a.PersonID = b.PersonID
;

-- left join on the Address table, so if the personID does not have city or state listed
-- in the Address, it would show as null

