-- Given a database of first and last IPv4 addresses, calculate the number of addresses between them (including the first one, excluding the last one).

-- Input
-- ---------------------------------
-- |     Table    | Column | Type  |
-- |--------------+--------+-------|
-- | ip_addresses | id     | int   |
-- |              | first  | text  |
-- |              | last   | text  |
-- ---------------------------------
-- Output
-- -------------------------
-- |   Column    |  Type   |
-- |-------------+---------|
-- | id          | int     |
-- | ips_between | bigint  |
-- -------------------------
-- All inputs will be valid IPv4 addresses in the form of strings. The last address will always be greater than the first one.

-- ## The core idea of this question is to convert IPv4 address to numbers and do the subtraction

select id,
        ((split_part(last, '.', 1)::bigint * power(256, 3)::bigint + 
        split_part(last, '.', 2)::bigint * power(256, 2)::bigint + 
        split_part(last, '.', 3)::bigint * 256::bigint) - 
        (split_part(first, '.', 1)::bigint * power(256, 3)::bigint + 
        split_part(first, '.', 2)::bigint * power(256, 2)::bigint + 
        split_part(first, '.', 3)::bigint * 256::bigint))::bigint as ips_between
from  ip_addresses;

