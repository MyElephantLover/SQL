-- We have a table recipe_priority the following schema:

-- id (integer) - primary key
-- group_id (integer) - Identifier for grouping recipes, can have duplicate values
-- recipe (varchar) - Name or code representing the recipe, can have duplicate values within the same group
-- priority (integer) - Numerical value indicating the priority of a recipe within a group
-- Write an SQL query that sorts rows from this table based on the following hierarchy of importance:

-- Group ID: Sort by group in ascending order.
-- Max Priority within Group and Recipe: Sort by the highest priority associated with each recipe within each group in descending order.
-- Recipe: Sort by recipe name in ascending alphabetical order.
-- Priority: Sort by individual row priority in descending order.
-- ID: Sort by id in desc order to break ties.

select id
        , group_id
        , recipe
        , priroty
from recipe_priority
order by 
group_id asc,
max(priority) over(partition by group_id, recipe) desc,
recipe asc,
priority desc,
id desc;
