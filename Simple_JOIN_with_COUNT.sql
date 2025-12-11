-- For this challenge you need to create a simple SELECT statement that will return all columns from the people table, and join to the toys table so that you can return the COUNT of the toys

-- people table schema
-- id
-- name

-- toys table schema
-- id
-- name
-- people_id

-- You should return all people fields as well as the toy count as "toy_count".

-- output all fields in the people table

select a.*, count(b.*) as toy_count
from people a left join toys b on a.id = b.people_id
group by 1
;

-- although inner join and left join return the same result, the best practice is to use left join 
-- since we want to return all people even though they may not have any toys




