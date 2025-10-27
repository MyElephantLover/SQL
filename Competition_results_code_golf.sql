-- Task
-- Given a table which holds information about the number of points received by each participant across a set of competitions, you have to present these records with some additional competition-specific statistics:

-- rank - current participant's rank based on their points
-- next_behind - how many points is the current participant behind the next better participant
-- total_behind - how many points is the current participant behind the leader
-- diff_from_avg - difference between the number of points received by the current participant and the average number of points received by all of the participants
-- On top of that, this kata is a code golf - your solution can be at most 240 characters long.

-- Notes
-- Multiple participants will never have the same number of points in a single competition
-- next_behind and total_behind should equal 0 when the current pariticipant has a rank of 1
-- The resulting rows should be sorted by competition_id and rank

select competition_id, 
      participant_id, 
      points, 
      rank() over(partition by competition_id order by points desc) as rank,
      coalesce(lag(points) over (partition by competition_id order by points desc) - points, 0) as next_behind,
      max(points) over(partition by competition_id) - points as total_behind,
      points - avg(points) over(partition by competition_id) as diff_from_avg
from results
order by competition_id, rank
