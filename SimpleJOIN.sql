-- For this challenge you need to create a simple SELECT statement that will return all columns from the products table, and join to the companies table so that you can return the company name.

select p.*, c.name as company_name from products p
left join companies c
on p.company_id = c.id

