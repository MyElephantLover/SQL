-- Within a growing digital bank, the Risk Management team is constantly on the lookout for account behaviors that may indicate potential risks or anomalies. They are specifically interested in tracking larger transactions over 100 units due to their potential financial impact. In order to enhance their surveillance, they have requested a detailed account transaction history that not only outlines all transactions but also pinpoints the last date of each transaction over 100 units. This data will provide valuable insights to track, analyze, and manage the risk associated with these larger transactions.

-- You are given a table named account_transactions with multiple dates, account IDs, and amounts. Schema of the table is following:

-- date (date): The date of the transaction.
-- account_id (integer): The ID of the account associated with the transaction.
-- amount (integer): The amount of the transaction.
-- Your task is to write a SQL query that retrieves all columns from the table with an additional last_over_hundred column which shows the last date upto and including the current date where the amount is strictly over 100 for that specific account_id. If no previous amount is over 100, it should be NULL.

-- The result should be sorted by account_id in descending order and then by date in ascending order. It is guaranteed that there is at most 1 transaction per date for each of the accounts.


select date,
        account_id,
        amount,
        max(case when amount > 100 then date end) over(partition by account_id -- convert each row into a date or NULL if amount > 100
        order by date asc 
        rows between unbounded preceding and current row) -- for each row, look at all prevous rows and the current row (the last date upto and including the current date)
        as last_over_hundred
from account_transactions
order by account_id desc, DATE
;

