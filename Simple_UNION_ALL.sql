-- For this challenge you need to create a UNION statement, there are two tables ussales and eusales the parent company tracks each sale at its respective location in each table, you must all filter the sale price so it only returns rows with a sale greater than 50.00. You have been tasked with combining that data for future analysis. Order by location (US before EU), then by id.

-- (us/eu)sales table schema
-- id
-- name
-- price
-- card_name
-- card_number
-- transaction_date

-- resultant table schema
-- location (EU for eusales and US for ussales)
-- id
-- name
-- price (greater than 50.00)
-- card_name
-- card_number
-- transaction_date

-- price needs to be filtered to >= 50.00, order by location, id

select 'US' as location, id, name, price, card_name, card_number, transaction_date
from ussales
where price >= 50.00

union all 

select 'EU' as location, id, name, price, card_name, card_number, transaction_date
from eusales
where price >= 50.00

order by location, id;

