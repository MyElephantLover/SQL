-- Timmy & Sarah think they are in love, but around where they live, they will only know once they pick a flower each. If one of the flowers has an even number of petals and the other has an odd number of petals it means they are in love.

-- Write a function that will take the number of petals of each flower and return true if they are in love and false if they aren't.

-- # write your SQL statement here: you are given a table 'love' with columns 'flower1' and 'flower2', return a table with columns ('flower1' and 'flower2') and your result in a column named 'res'.


create or replace function flower()
return tables(flower1 int, flower2 int, res boolean)
language plpgsql as $$
begin
return query 
    select l.flower1, -- need to add alias later so this flower1 would not be mixed with the flower1 as table variable
            l.flower2,
            case when (l.flower1 % 2 = 0 and l.flower2 % 2 != 0) or(l.flower2 % 2 = 0 and l.flower1 % 2 != 0) -- needs to be opposite
            then true else false end as res from love l; -- table alias
end;
$$

select * from flower();