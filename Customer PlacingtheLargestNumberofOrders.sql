-- Write a solution to find the customer_number for the customer who has placed the largest number of orders.
-- The test cases are generated so that exactly one customer will have placed more orders than any other customer.

-- it seems to be I used sum(order_number) but it actually needs to be count(*)
-- becasue it should not be the summation of the order numbers but the count of the orders

-- my solution

select customer_number
from (
    select count(*) as total_orders,
    customer_number,
    rank() over(order by count(*) desc) as rnk
    from Orders group by customer_number
) k where rnk = 1

-- official solution

select customer_number
from Orders 
group by 1
order by count(*) desc 
limit 1



