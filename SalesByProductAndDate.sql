-- Task
-- Given the information about sales in a store, calculate the total revenue for each day, month, year, and product.

-- Notes
-- The sales table stores only the dates for which any data has been recorded - 
-- the information about individual sales (what was sold, and when) is stored in the sales_details table instead
-- The sales_details table stores totals per product per date
-- Order the result by the product_name, year, month, day columns
-- We're interested only in the product-specific data, so you shouldn't return the total revenue from all sales

-- Revenue per product per day

select p.name as product_name, 
extract(year from s.date)::int as year, 
extract(month from s.date)::int as month,
extract(day from s.date)::int as day, 
sum(p.price*sd.count) as total
from 
sales s join sales_details sd on s.id = sd.sale_id
join products p on sd.product_id = p.id
group by 1,2,3,4

union 

-- Revenue per product per month

select p.name as product_name, 
extract(year from s.date)::int as year, 
extract(month from s.date)::int as month,
NULL as day, 
sum(p.price*sd.count) as total
from 
sales s join sales_details sd on s.id = sd.sale_id
join products p on sd.product_id = p.id
group by 1,2,3

union

-- Revenue per product per year

select p.name as product_name, 
extract(year from s.date)::int as year, 
NULL as month,
NULL as day, 
sum(p.price*sd.count) as total
from 
sales s join sales_details sd on s.id = sd.sale_id
join products p on sd.product_id = p.id
group by 1,2

union

-- Total revenue per product (all time)

select p.name as product_name, 
NULL as year, 
NULL as month,
NULL as day, 
sum(p.price*sd.count) as total
from 
sales s join sales_details sd on s.id = sd.sale_id
join products p on sd.product_id = p.id
group by 1

order by 1, 2, 3, 4

;


