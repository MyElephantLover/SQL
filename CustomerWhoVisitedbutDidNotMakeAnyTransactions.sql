-- Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
-- which means, find the customer_id with the visit_id not in the Transactions table

select customer_id, count(visit_id) as "count_no_trans"
from Visits
where visit_id not in
(
    select visit_id from Transactions
)
group by 1
;

-- I over complicated the questions - thinking I need to find the common visit_id
-- in both tables
-- but there are already common visit_id in both tables
-- I only needed to find those visit_id not presented on the other table