-- For this challenge you need to create a simple SELECT statement that will return all columns from the people table, and join to the sales table so that you can return the COUNT of all sales and RANK each person by their sale_count.

-- people table schema
-- id
-- name

-- sales table schema
-- id
-- people_id
-- sale
-- price

-- You should return all people fields as well as the sale count as "sale_count" and the rank as "sale_rank".

-- people table: p
-- sales table: s

select 
    t.id, 
    t.name, 
    sale_count,
    rank() over(order by sale_count desc) as sale_rank -- if we partion by people_id, each person becomes its own partition, the rank would restart at 1 for every person
from 
(
    select p.*, count(s.id) as sale_count
    from people p left join sales s on p.id = s.people_id
    group by p.id, p.name
) t

-- need partition: window function within each category
-- no partition: rank with everyone

