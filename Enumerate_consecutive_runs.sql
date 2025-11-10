-- Task
-- Given a table with some arbitrary entries having id and value columns, 
-- enumerate the runs of rows which have consecutive id's and the same value. The runs' indices should be stored in the run_id column of the output table; the indices themselves should be consecutive and start from 1.

-- Notes
-- id and value columns in the output are the same as in the input table
-- Order the result by the id column

with runs as(
    select 
    id, 
    value,
    case when value != lag(value) over(order by id) or id != lag(id) over(order by id) + 1 
    then 1 else 0 end as run_boundary
    from entries -- check if we need to start a new run
), numbered as (
    select id,
    value,
    sum(run_boundary) over(order by id rows unbounded proceeding) + 1 as run_id -- "rows unbounded proceeding" means for each row, include all previous row and the current one in the calculation
    from runs
)

select * from runs order by id