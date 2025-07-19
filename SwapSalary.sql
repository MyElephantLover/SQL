-- Use a single update statement to swamp sex from 'm' to 'f' and vice versa

update Salary 
set sex = case when sex = 'm' then 'f' else 'm' end;

-- Pay attention to the single quotation mark, not the double quotation marks



