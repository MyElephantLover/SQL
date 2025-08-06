-- Write a solution to find the names of all the salespersons who did not have any orders related to the company with the name "RED".
-- Return the result table in any order

select name as "salesperson_name"
from 
(
    select a.name from SalesPerson a left join Orders b
    on a.sales_id = b.sales_id
    left join Company c on b.com_id = c.com_id
    where c.name not like '%RED%'
) x 

-- this solution is not correct
-- correct answer TBD