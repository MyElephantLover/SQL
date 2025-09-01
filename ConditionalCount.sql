--- Given a payment table, which is a part of DVD Rental Sample Database, with the following schema
--- Column       | Type                        | Modifiers
-------------+-----------------------------+----------
-- payment_id   | integer                     | not null 
-- customer_id  | smallint                    | not null
-- staff_id     | smallint                    | not null
-- rental_id    | integer                     | not null
-- amount       | numeric(5,2)                | not null
-- payment_date | timestamp without time zone | not null
-- produce a result set for the report that shows a side-by-side comparison of the number and total amounts of payments made in Mike's and Jon's stores broken down by months.
-- The resulting data set should be ordered by month using natural order (Jan, Feb, Mar, etc.).

SELECT  extract(month from payment_date) as month,
        count(*) as total_count,
        sum(amount) as total_amount,
        sum(case when staff_id = 1 then 1 else 0 end) as mike_count,
        sum(case when staff_id = 1 then amount else 0 end) as mike_amount,
        sum(case when staff_id = 2 then 1 else 0 end) as jon_count,
        sum(case when staff_id = 2 then amount else 0 end) as jon_amount
        from payment
        group by 1
        order by 1 asc
        ;

-- lesson learned: initally, I used date_trunc('month' from payment_date) to 
-- transform a timestamp (unix timestamp representation) to month
-- but later i realize it wants numeric values for the month
-- this way, we can use extract(month from payment_date) to get Jan. maps to 1
-- Feb. maps to 2, etc