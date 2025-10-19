-- For each category in the tree-like categories table, calculate how many records in the items table belong to it and its parent categories across all the tree levels.

-- Notes
-- Items can only belong to the leaves of the category tree
-- There will be multiple roots for separate category trees
-- Order the result by the id column

-- Recursive query: count items per category and its descendants
with recursive category_hierarchy AS (
    -- Base case: each category is an ancestor of itself
    SELECT 
        id AS ancestor,
        id AS descendant
    FROM categories

    UNION ALL --Union removes duplicates

    -- Recursive step: parent inherits all descendants of its child
    SELECT 
        c.parent AS ancestor,
        ch.descendant
    FROM categories c
    JOIN category_hierarchy ch
      ON c.id = ch.ancestor
    WHERE c.parent IS NOT NULL
)
SELECT 
    c.id,
    COUNT(i.id) AS total
FROM categories c
LEFT JOIN category_hierarchy ch
  ON c.id = ch.ancestor
LEFT JOIN items i
  ON i.category_id = ch.descendant -- id is ancestor while category_id is descendant
GROUP BY c.id
ORDER BY c.id;
