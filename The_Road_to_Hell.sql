-- Write a SQL query that extracts and presents information about various metaphorical journeys, showing each journey’s path through different stations (representing vices and virtues) and identifying those that ultimately end in "Hell."

-- DB Schema:

-- stations:

-- id (integer, primary key)
-- station_name (string)

-- journey:

-- id (integer, primary Key)
-- journey_name (string)

-- journey_stop:

-- journey_id (integer, foreign key to journey.id)
-- station_id (integer, foreign key to stations.id)
-- sequence_number (integer)
-- Identify journeys that end at the station named "Hell". In these journeys, "Hell" is always the final destination, not a passing station. Your result set should return 2 columns: journey_name and station_name

-- Display the journey for the first stop of each journey. For subsequent stops of the same journey, display NULL in place of the journey_name.
-- For station_name, concatenate the station_name with the sequence_number in brackets in the format of station_name (sequence_number).
-- Order the results by journey_id and sequence_number - both in ascending order.

-- GLHF!

-- Desired Output
-- The desired output should look like this:

-- | journey             | station_name    |
-- +---------------------+-----------------+
-- | Journey of Ambition | Greed (1)       |
-- | <null>              | Pride (2)       |

with hell_journey as (
    select js.journey_id
    from journey_stop js join
    stations s on js.station_id = s.id 
    group by js.journey_id
    having
    -- final stop is Hell
    max(case when s.station_name = 'Hell' then js.sequence_number end) = max(js.sequence_number)
    and count(case when s.station_name = 'Hell' then 1 end) >= 1
)

select case when js.sequence_number = min(js.sequence_number) over(partition by js.journey_id)
then j.journey_name
else null end as journey,
concat(s.station_name, '(', js.sequence_number, ')') as station_name
from journey_stop js join journey j on js.journey_id = j.id join
stations s on js.station_id = s.id 
where js.journey_id in (select journey_id from hell_journey)
order by js.journey_id, js.sequence_number;
