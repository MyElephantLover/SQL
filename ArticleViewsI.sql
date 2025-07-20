-- Write a solution to find all the authors that viewed at least one of their own articles.
-- euqal author-id and viewer-id indicates the same person

select author_id as id from 
(select author_id, count(*) as freq from Views where author_id = viewer_id 
group by author_id) X
where freq >= 1

