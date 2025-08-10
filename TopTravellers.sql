-- Write a solution to report the distance traveled by each user.
-- Return the result table ordered by travelled_distance in descending order, if two or more users traveled the same distance, order them by their name in ascending order.

select name, travelled_distance
from
(
select u.id, u.name, coalesce(sum(r.distance), null, 0) as travelled_distance
from Users u left join Rides r
on u.id = r.user_id
group by (u.id, u.name) -- in case users have the same name
) x 
group by travelled_distance desc, name asc 


-- the official solution <but this incur Runtime Error>

select u.name, coalesce(sum(r.distance), null, 0) as travelled_distance
from Users u left join Rides r 
on u.id = r.user_id
group by u.id order by travelled_distance desc, name asc 
;

