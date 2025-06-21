select name from Customer where referee_id != 2 or referee_id is null

-- referee_id means the customer who did the referral
-- this can be ambiguous as we also called it referrer
-- and the person being referred as referral
