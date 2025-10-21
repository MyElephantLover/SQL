-- You are given a transactions table with the following columns:

-- id(integer): the transaction's unique identifier
-- user_id(integer): the unique identifier of the user who made the transaction
-- country(string): the country from which the transaction was made
-- date(date): the date of the transaction
-- amount(integer): the amount of the transaction
-- Your task is to write a SQL query that retrieves transactions for each user where the cumulative amount for that specific user from the first his/her transaction in the system to the row where, when arranged by transaction id in ascending order, reaches or exceeds a limit of 15

-- While id, date and amount should be displayed for every row of result set, the query should only display the user_id and country in the last row of each user's data (with all other rows being NULL).

-- In addition to columns from transactions table, the result set should include a column days_to_reach_threshold which indicates the number of days it took for each user to reach the cumulative transaction amount of 15. In the same logic with user_id and country, this value should be displayed only in the last row for each user (where all other rows are NULL).

-- Finally, the result set should also include a column avg_country_days_to_reach_threshold which shows the average of days_to_reach_threshold for all users from the same country. This value should be rounded to the nearest integer and also should be displayed only in the last row for each user (where all other rows are NULL).

-- The final result set should be ordered by user_id and id in ascending order. When user_id is NULL (i.e., not the last row of each user's data), these rows should be sorted to the end.

with user_cumulative as (
    select 
    id,
    user_id,
    country,
    date,
    amount,
    sum(amount) over(partition by user_id order by id asc) as cum_amount,
    min(date) over(partition by user_id) as first_txn_date
    from transactions
), 
threshold_reached AS (
    select *,
    min(id) filter (where cum_amount >= 15) over(partition by user_id) as threshold_id
    from user_cumulative
), 
with_days as (
    select 
    id,
    case when id = threshold_id then user_id end as user_id,
    case when id = threshold_id then country end as country,
    date,
    amount,
    case when id = threshold_id then (date - first_txn_date) end as days_to_reach_threshold
    from threshold_reached
    where id <= threshold_id
), 
avg_by_country as (
    select country,
    round(avg(days_to_reach_threshold))::INTEGER as avg_country_days_to_reach_threshold
    from with_days
    where days_to_reach_threshold is not NULL
    group by country
)

select 
    w.id,
    w.user_id,
    w.country,
    w.date,
    w.amount,
    w.days_to_reach_threshold,
    case when w.days_to_reach_threshold is not null then a.avg_country_days_to_reach_threshold end as avg_country_days_to_reach_threshold
from with_days w left join avg_by_country a using (country)
order by 1,2
;

