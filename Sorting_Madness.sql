-- As a data analyst at an online store, you are analyzing the purchasing behavior of your customers. Each customer can have multiple transactions, each transaction is either a purchase (represented by is_return column value of false) or a return (represented by is_return column value of true).

-- The transactions are recorded in a table called orders. The table structure is as follows:

-- customer_id | is_return
-- -----------------------
-- 1           |   true
-- 1           |   true
-- 1           |   false
-- 1           |   false
-- 2           |   true
-- 2           |   true
-- 2           |   true
-- 2           |   false
-- 3           |   false
-- Your task is to write a PostgreSQL SQL query that orders the data in the following way:

-- First, order by customer_id.
-- Then, within each customer, try to alternate between is_return = true (return) and is_return = false (purchase) as much as possible (starting with true). This means that, ideally, each return transaction should be followed by a purchase transaction, and vice versa. However, please note that it might not always be possible to alternate perfectly if a customer has more returns than purchases, or vice versa.

with numbered as (
    select customer_id, is_return,
    row_number() over(partition by customer_id, is_return order by (select 1))
    as rn from orders
)

select customer_id, is_return from numbered
order by customer_id,
rn, 
is_return desc; -- True at first

