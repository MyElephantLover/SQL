-- In the task, you need to calculate whether a Pareto principle is observed for a DVD rentals, which states that 20% of customers will be responsible for approximately 80% of the rentals. You need to write a query that would identify the top 20% of customers based on the number of rentals they had made, and then calculate the percentage of total rentals they accounted for. In the task you need to:

-- calculate the total number of rentals across all customers.
-- identify the top 20% of customers by rentals.
-- calculate the number of rentals by these top 20% of customers.
-- Finally, to calculate the percentage of rentals by the top 20% of customers compared to the total number of rentals.
-- In your query you need to return three pieces of information:

-- top_20%_rentals_count: The total number of rentals made by the top 20% of customers.
-- total_rentals_count: The total number of rentals made by all customers.
-- percentage_of_top_20%: The percentage of total rentals made by the top 20% of customers. Should be of numeric type, rounded to 2 decimal places

WITH customer_rentals AS (
  SELECT 
    customer_id,
    COUNT(*) AS rental_count
  FROM rental
  GROUP BY customer_id
),
ranked_customers AS (
  SELECT
    customer_id,
    rental_count,
    NTILE(5) OVER (ORDER BY rental_count DESC) AS quantile -- divide customers into 5 groups (20% each)
  FROM customer_rentals
),
top_20_percent AS (
  SELECT
    SUM(rental_count)::INTEGER AS top_20_rentals_count
  FROM ranked_customers
  WHERE quantile = 1  -- top 20% customers by rental count
),
total AS (
  SELECT
    SUM(rental_count)::INTEGER AS total_rentals_count
  FROM customer_rentals
)
SELECT
  t.top_20_rentals_count::INTEGER AS "top_20%_rentals_count",
  total.total_rentals_count,
  ROUND(
    (t.top_20_rentals_count::NUMERIC / total.total_rentals_count) * 100,
    2
  )::NUMERIC AS "percentage_of_top_20%"
FROM top_20_percent t
CROSS JOIN total;

-- The reason why we use Cross Join is that top 20% rental count, total rental count, and the percentage of top 20% are all single row aggregates.
-- there is no relationship key to join them on
-- cross join is the simplist way to combine single-row aggregates side by side