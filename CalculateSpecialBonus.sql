select employee_id, 
case when employee_id % 2 != 0 and substring(name, 1, 1) != "M" then salary else 0 as bonus
from Employees
order by employee_id
;

-- substring(name, 1, 1) PostgreSQL string indexing is 1-based, so substring(name, 1, 1)
-- gets the first character, not (0, 1), which was how I got it wrong in the first place 