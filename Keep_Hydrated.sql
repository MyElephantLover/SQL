-- Nathan loves cycling.

-- Because Nathan knows it is important to stay hydrated, he drinks 0.5 litres of water per hour of cycling.

-- You get given the time in hours and you need to return the number of litres Nathan will drink, rounded down.

-- Input data is available from the table cycling, which has 2 columns: id and hours. For each row, you have to return 3 columns: id, hours and liters (not litres, it's a difference from the kata description)

select id, hours, floor(0.5 * hours) as liters from cycling;

-- rounding down: floor() returns the largest integer that is less than or equal to the argument

