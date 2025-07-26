-- Write a solution to find all the pairs (actor_id, director_id) where the actor has cooperated with the director at least three times.
-- timestamp is the primary key (column with unique values) for this table.

select x.actor_id, x.director_id
from
(
    select actor_id, director_id, count(*) as freq from ActorDirector
) x
where freq >= 3
;

