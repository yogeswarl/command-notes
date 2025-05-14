-- BEST Practices and things to remember
  -- use uppercase for commands
  -- end sql statements with ;
  -- One statement per line
  -- BETWEEN is inclusive, meaning the beginning and end values are included in the results
  -- SQL assumes that if you divide an integer by an integer, you want to get an integer back.
  -- ORDER BY always goes after GROUP BY
  -- in SQL, aggregate functions can't be used in WHERE clauses. 
  -- Field Names should be lowercase, no spaces and singular(because they indicate per record. )
-- REFERENCES!!!!
-- Select single/multiple columns
SELECT col1,col2,... FROM Table_Name;
-- Select anything
SELECT * FROM Table_Name;
-- DISTINCT (unique column values) values
SELECT DISTINCT colname FROM Table_Name;
-- COUNT number of rows in a column (colname) or a table (*)
SELECT COUNT(*) FROM Table_Name;

-- Filtering with WHERE 
-- Different comparison operators
-- = equal
-- <> not equal
-- < less than
-- > greater than
-- <= less than or equal to
-- >= greater than or equal to
-- OR Display only rows that meet at least one of the specified conditions
-- AND Display only rows that meet both the specified conditions
SELECT title
FROM films
WHERE (release_year = 1994 OR release_year = 1995)
AND (certification = 'PG' OR certification = 'R');

-- BETWEEN keyword provides a useful shorthand for filtering values within a specified range
-- BETWEEN can also be used with AND and OR operators.
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000
AND budget > 100000000
AND language = 'Spanish'

-- The IN operator allows you to specify multiple values in a WHERE clause,
SELECT name
FROM kids
WHERE age IN (2, 4, 6, 8, 10);

-- NULL represents a missing or unknown value. You can check for NULL values using the expression IS NULL, NOT NULL values using the expression IS NOT NULL
SELECT COUNT(*)
FROM people
WHERE birthdate IS NULL;

-- the LIKE operator can be used in a WHERE clause to search for a pattern in a column. You can also use the NOT LIKE operator to find records that don't match the pattern you specify
-- The % wildcard will match zero, one, or many characters in text
SELECT name
FROM companies
WHERE name LIKE 'Data%';

-- The _ wildcard will match a single character.
SELECT name
FROM companies
WHERE name LIKE 'DataC_mp';
-- Aggregate function =  AVG, MAX, MIN, SUM
SELECT SUM(budget)
FROM films
WHERE release_year >= 2010;

-- aliasing can be done using AS
SELECT 45/10*100.0 AS value;

-- Sorting using ORDER BY, ORDER BY can also be used to sort on multiple columns. It will sort by the first column specified, then sort by the next
-- GROUP BY is used to group a resuly by one or more columns.
SELECT sex, count(*)
FROM employees
GROUP BY sex
ORDER BY count DESC;


-- HAVING clause can be used to filter based on the result of an aggregate function.
SELECT release_year
FROM films
GROUP BY release_year
HAVING COUNT(title) > 10;


-- INNER JOIN : results, where the resulting fields has matching values
SELECT *
FROM left_table
INNER JOIN right_table
ON left_table.id = right_table.id;
-- INNER JOIN by USING
SELECT *
FROM countries
  INNER JOIN economies
    USING(code)

-- LEFT JOIN: results, where the resulting fields on the left may not have a matching field on the right
SELECT * 
FROM left_table
LEFT JOIN right_table
USING(table_id)

-- RIGHT JOIN: results, where the resulting fields on the right may not have a matching field on the left
SELECT * 
FROM left_table
RIGHT JOIN right_table
USING(table_id)

-- FULL JOIN: results, where the resulting fields returns every possible match on a given id from both the left and right table
SELECT * 
FROM left_table
FULL JOIN right_table
USING(table_id)

-- CROSS JOIN: returns a combination of all pairs between the two table 
-- CROSS JOINS do not require ON 
SELECT *
FROM left_table
CROSS JOIN right_table
WHERE left_table.id ='value' AND right_table.id = 'value2'


-- SELF JOIN: join a table to itself.
SELECT * 
FROM left_table lt
INNER JOIN left_table lt2
USING(id);
