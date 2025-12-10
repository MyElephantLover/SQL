-- You are working for a local school, and you are responsible for collecting tuition from students. You have a list of all students, some of them have already paid tution and some haven't. Write a select statement to get a list of all students who haven't paid their tuition yet. The list should include all the data available about these students.

-- students table schema

-- name (string)
-- age (integer)
-- semester (integer)
-- mentor (string)
-- tuition_received (Boolean)

select name, age, semester, mentor, tuition_received
from students
where tuition_received is false ; 

-- Be aware that "tuition_received" has data type as boolean, not string
-- so false needs not to have single quotes

-- in SQL, single quotes are used for values (literals), such as students' name
-- double quotes are used for identifiers, such as table names or column names (case sensitive, contains space or special characters)




