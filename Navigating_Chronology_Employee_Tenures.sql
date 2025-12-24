-- You are given two tables in a PostgreSQL database: employees and employee_works. The employees table contains basic information about employees, while the employee_works table tracks the periods during which each employee has worked for the company.

-- Tables Structure:

-- employees:

-- id (int): primary key
-- employee_name (string): name of the employee

-- employee_works:

-- id (int): primary key
-- employee_id(int): foreign key referencing employees.id)
-- start_date(DateTime): date and time when employee started working
-- finish_date (DateTime, nullable): date and time when employee finished working
-- Note: A NULL value in finish_date indicates that the employee is currently working.

-- Write a SQL query to generate a report that provides the following information for each employee in the employees table:

-- id (int): Employee's ID.
-- employee_name (string): Employee's name.

-- status (string): A string that can be one of the following:
-- 'Still with us': If the employee is currently working (i.e., has an ongoing period with finish_date as NULL).
-- 'Left': If the employee has worked in the past but is not currently working.
-- 'Never worked': If the employee has never worked (i.e., no corresponding records in employee_works).

-- total_duration (interval): The total accumulated duration of employment for each employee, calculated as follows:
-- For employees currently working (finish_date is NULL for their latest period), calculate the duration from the start date of their first period to the current date. This includes aggregating any previous periods of employment. Use PostgreSQL's current_date function for ongoing employment calculations.
-- For past employees (those who have left and have a finish_date for their last period), aggregate the durations of all their work periods.
-- The interval datatype in PostgreSQL will automatically format this duration in a standardized and human-readable format, so don't worry about formatting. This will default to PostgreSQL's interval format, which primarily shows days and time.

-- Additional info:
-- Please note that this query assumes that each employee has at most one continuous employment period or multiple periods with no overlaps.
-- The PostgreSQL interval datatype, when summed up directly, often defaults to a format that primarily shows days and time (hours, minutes, seconds) and does not automatically convert this into years and months. This behavior is due to the inherent complexity in converting days to months or years, as the number of days in a month and year can vary. In this task, we will not focus on manually adjusting the interval to a specific format like years, months, and days.
-- Order the results by the employee's id in descending order.

-- employees table alias: e
--  employee_works alias: w

select e.id,
        e.employee_name,
        case when count(w.id) = 0 then 'Never worked' -- with left join, meaning no records in w
        when bool_or(w.finish_date is null) then 'Still with us' -- bool_or() means at least one condition is true
        else 'Left' end as status,
        case when count(w.id) = 0 then NULL -- worked in tests
        else sum(coalesce(w.finish_date, current_date::timestamp) - w.start_date)::interval
        end as total_duration
from employees e left join employee_works w on e.id = w.employee_id
group by 1, 2
order by 1 desc;

-- 'interval '0'' is a typed interval literal
-- in a CASE expression, all branches must resolves to the same data type