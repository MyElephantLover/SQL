select employee_id, 
case when employee_id % 2 != 0 and substring(name, 1, 1) != "M" then salary else 0 as bonus
from Employees
order by employee_id
;

