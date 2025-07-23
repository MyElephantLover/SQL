-- Write a solution to find the first login date for each player.
-- Return the result table in any order.

-- simplest way

select player_id, min(event_date) as first_login
from Activity
group by 1 -- group rows into subgroups specific into each player
-- retrieve the earliest event date for each subgroups by means of min()



-- window function

select X.player_id, X.event_date as first_login
from
(
    select player_id, event_date, rank() over(partition by player_id order by event_date)
    as rnk
) X
where rnk = 1