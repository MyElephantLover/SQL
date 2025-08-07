-- Write a solution to find all customers who never order anything.
-- Return the result table in any order.

select name as Customers 
where id not in
(
    select customerId from Orders
)
;

