-- Write a solution to report the IDs of all the employees with missing information. The information of an employee is missing if:
-- The employee's name is missing, or
-- The employee's salary is missing.
-- Return the result table ordered by employee_id in ascending order.

select employee_id
from Employees where employee_id not in (
    select employee_id from Salaries
)
union -- union remove duplicates
select employee_id
from Salaries where employee_id not in (
    select employee_id from Employees
)
order by employee_id asc;

-- Good practice for union / union all

