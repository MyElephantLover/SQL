-- For a given pair of a and b : Consider a Chess board of a × b squares. Now, for each of the squares; Imagine a Queen standing on that square and compute the number of squares under the queen's attack. 
-- Add all the numbers you get for each of the a × b possible queen's position and return it.
-- For a given pair of a and b : Consider a Chess board of a × b squares. 
-- Now, for each of the squares; Imagine a Queen standing on that square and compute the number of squares under the queen's attack. Add all the numbers you get for each of the a × b possible queen's position and return it.

SELECT
  a,
  b,
  GREATEST(a*b*(a+b-2) + 2*a*(a-1)*(3*b-a-1)/3, b*a*(b+a-2) + 2*b*(b-1)*(3*a-b-1)/3) AS res
FROM chessboard

-- code breakdown TBD