-- (user_id, follower_id) is the primary key (combination of columns with unique values) for this table.
-- Write a solution that will, for each user, return the number of followers.
-- Return the result table ordered by user_id in ascending order.

select user_id, count(follower_id) as "followers count" 
from Followers
group by 1
order by 1 asc
;

