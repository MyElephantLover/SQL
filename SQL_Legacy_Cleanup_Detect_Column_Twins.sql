-- You have been hired to maintain a legendary enterprise database.

-- And by “legendary,” we mean the kind of legacy system where:

-- tables have hundreds of columns,
-- naming conventions died years ago,
-- and the original developer mysteriously disappeared into the mountains (probably to avoid support tickets).
-- One table in particular, legacy_members, is especially cursed. Over the years, developers added new columns instead of reusing old ones, resulting in multiple fields that store exactly the same data.

-- Your job? Find all pairs of columns that contain identical values in every row of the table. Because manually checking 200+ columns is how database administrators go extinct.

-- Your query must return a table:

-- | col1               | col2                |
-- +--------------------+---------------------+
-- | first column name  | second column name  |
-- with these conditions:

-- col1 < col2 alphabetically
-- only pairs where values match in every row
-- sorted by col1 (asc), then col2 (asc)

create or replace function detect(name text, out result text[])
language plpgsql as   
$$
begin
    execute format('select array_agg(json_build_array("%s")->>0) from legacy_memebers order by 1', name)
    into result;
    -- json_build_array build a json array from the column value and '->>0' extract the first element into text
end;
$$

select a.column_name col1, b.column_name col2 
from information_schema.columns a join 
information_schema.columns b on a.table_name = 'legacy_members' -- be aware to use single quote to refer to literals
and b.table_name = 'legacy_members'
and not ('id' in (a.column_name, b.column_name))
and a.column_name < b.column_name -- col1 < col2
and (detect(a.column_name) = detect(b.column_name))
order by col1, col2
;



