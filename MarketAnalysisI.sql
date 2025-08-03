-- Write a solution to find for each user, the join date and the number of orders they made as a buyer in 2019.
-- Return the result table in any order.


select user_id, join_date, sum(case when order_date > join_date and extract(year from order_date::date)=2019 then 1 else 0 end) as 'orders_in_2019'
from Users u left join Orders O
on u.user_id = o.buyer_id
and extract(year from join_date::date) = 2019
group by 1, 2
;

