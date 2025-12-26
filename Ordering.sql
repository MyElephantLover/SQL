-- Your task is to sort the information in the provided table 'companies' by number of employees (high to low). Returned table should be in the same format as provided:

-- companies table schema

-- id
-- ceo
-- motto
-- employees

-- Solution should use pure SQL. Ruby is only used in test cases.

select id, ceo, motto, employees from companies
order by employees desc, id asc;

-- confused with this question, but looking twice, the table is companies, so the 'employees' column contains the total number of employees for each company
-- during test cases, we need to add a tie breaker, id, in case there are the same # of employees


