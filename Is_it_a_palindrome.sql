-- Write a function that checks if a given string (case insensitive) is a palindrome.
-- # write your SQL statement here: you are given a table 'ispalindrome' with column 'str', return a table with column 'str' and your result in a column named 'res'.

create or replace function is_palindrome(input_text TEXT)
return boolean as $$
declare 
    cleaned TEXT;
begin
    -- normalize by lowercasing and removing whitespaces
    -- := means assignment, assign a value into a variable
    -- Stores the cleaned, normalized string into the variable cleaned.
    cleaned := LOWER(REGEXP_REPLACE(input_text, '\s+', '', 'g'))
    -- '\s+' means removing one or more whitespace characters, 'g' means global, so it replaces all matches, not just the first one
    return cleaned = reverse(cleaned)
end;
$$ language plpgsql immutable

select str,
        is_palindrome(str) as res
from ispalindrome;


