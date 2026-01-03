-- You have access to a table of monsters as follows:

-- ** monsters table schema **

-- id
-- name
-- legs
-- arms
-- characteristics
-- Your task is to make a new table where each column should contain the length of the string in the column to its right (last column should contain length of string in the first column). Remember some column values are not currently strings. Column order and titles should remain unchanged:

-- ** output table schema **

-- id
-- name
-- legs
-- arms
-- characteristics

select length(cast(name) as varchar(255)) as id,
        length(cast(legs) as varchar(255)) as name,
        length(cast(arms) as varchar(255)) as legs,
        length(cast(characteristics) as varchar(255)) as arms,
        length(cast(id) as varchar(255)) as characteristics

from monsters;

-- there is no string data type in PostreSQL
-- there is no len function in PostreSQL


