-- For a given pair of a and b : Consider a Chess board of a × b squares. Now, for each of the squares; Imagine a Queen standing on that square and compute the number of squares under the queen's attack. 
-- Add all the numbers you get for each of the a × b possible queen's position and return it.
-- For a given pair of a and b : Consider a Chess board of a × b squares. 
-- Now, for each of the squares; Imagine a Queen standing on that square and compute the number of squares under the queen's attack. Add all the numbers you get for each of the a × b possible queen's position and return it.

SELECT
  a,
  b,
  GREATEST(a*b*(a+b-2) + 2*a*(a-1)*(3*b-a-1)/3, b*a*(b+a-2) + 2*b*(b-1)*(3*a-b-1)/3) AS res -- GREATES(x,y) compares the two symantrical expressions and pick the bigger one
  --- they are two mirrored images with a anb b swapped 
  --- (a + b - 2) represents rook/bishop movementpatterns, that rooks move horizontally or vertically; bishop moves diagnotically
  --- (a - 1) or (b - 1) means the number of diagonals minus something

FROM chessboard

-- The formula of total number of squares in a board of a x b
-- the number of squares on the same row: (a - 1)
-- the number of squares on the same column: (b - 1)
-- total other squares on the same row or column: ( a - 1) + (b - 1) = (a + b - 2)

-- if we count "ordered pairs", rook-ordered: ab(a + b - 2)
-- A known closed form for the total of nonordered diagonal pairs on a axb board is: [a(a - 1)(3b - a - 1) + b(b - 1)(3a - b - 1)]/3
-- the formula is symmetric when both a and b are included; it counts unordered pairs in both diagonal orientations combined


