-- !=

-- SELECT
--     title,
--     released_year as 'All years except 2003'
-- FROM books
-- WHERE released_year != 2003 
-- ORDER BY released_year;

-- SELECT
--     title,
--     author_lname as 'Last Name'
-- FROM books
-- WHERE author_lname != 'Carver';


-- NOT LIKE
-- SELECT  
--     title
-- FROM books 
-- WHERE title NOT LIKE 'W%';


-- GREATER THAN / LESS THAN
-- SELECT 
--     released_year
-- FROM books 
-- WHERE released_year > 1990
-- AND
-- released_year < 2000
-- ORDER BY released_year;
-- SELECT title, released_year FROM books
-- WHERE released_year <= 2000;


-- LOGICAL AND -  &&/AND (both expressions have to be true)
-- SELECT 
--     *
-- FROM books
-- WHERE released_year > 2010
-- &&
-- author_lname = 'Eggers';


-- LOGICAL OR - ||/OR
-- SELECT 
--     *
-- FROM books
-- WHERE author_fname = 'Dave'
-- ||
-- author_fname = 'David';
-- SELECT title, 
--       author_lname, 
--       released_year, 
--       stock_quantity 
-- FROM   books 
-- WHERE  author_lname = 'Eggers' 
--               || released_year > 2010 
-- OR     stock_quantity > 100;


-- BETWEEN and NOT BETWEEN
SELECT 
    *
FROM books
WHERE released_year BETWEEN 1950 AND 1995
ORDER BY released_year;



-- CAST with BETWEEN / NOT BETWEEN - convert from one data type to another 
-- SELECT CAST('2017-03-12' AS DATETIME);
-- SELECT 
--     name, 
--     birthdt 
-- FROM people
-- WHERE 
--     birthdt BETWEEN CAST('1980-01-01' AS DATETIME)
--     AND CAST('2000-01-01' AS DATETIME);


-- IN and NOT IN
-- SELECT 
--     *
-- FROM books
-- WHERE author_lname = 'Carver'
-- ||
-- author_lname = 'Lahiri'
-- ||
-- author_lname = 'Smith';
-- CAN BE SIMPLIFIED TO (w/ IN)
-- SELECT 
--     *
-- FROM books
-- WHERE author_lname IN ('Carver', 'Lahiri', 'Smith');
-- SELECT 
--     *
-- FROM books
-- WHERE released_year NOT IN (2000, 2002, 2004, 2006, 2008, 2010, 2012, 2014, 2016)
-- AND
-- released_year >= 2000
-- ORDER BY released_year;

-- COULD BE SIMPLIFIED TO (no NOT IN):
-- SELECT 
--     *
-- FROM books
-- WHERE released_year % 2 != 0
-- AND
-- released_year >= 2000
-- ORDER BY released_year;


-- CASE statements
-- SELECT 
--     title,
--     released_year,
--     CASE
--         WHEN released_year > 2000 THEN 'Modern Lit'
--         ELSE '20th Century Lit'
--     END AS Genre
-- FROM books;

-- SELECT 
--     title,
--     stock_quantity,
--     CASE 
--         WHEN stock_quantity BETWEEN 0 AND 50 THEN '*'
--         WHEN stock_quantity BETWEEN 51 AND 100 THEN '**'
--         ELSE '***'
--     END AS STOCK
-- FROM books;


-- CHALLENGES:
-- SELECT 
--     title
-- FROM books
-- WHERE released_year < 1980;

-- SELECT
--     title
-- FROM books
-- WHERE author_lname = 'Eggers'
-- OR
-- author_lname = 'Chabon';

-- SELECT
--     title
-- FROM books
-- WHERE author_lname = 'Lahiri'
-- &&
-- released_year >= 2001;

-- SELECT
--     title,
--     pages
-- FROM books
-- WHERE pages BETWEEN 100 AND 200;

-- SELECT
--     title,
--     author_lname
-- FROM books
-- WHERE author_lname LIKE 'C%'
--   Or author_lname LIKE 'S%';


-- SELECT
--     title,
--     author_lname,
--     CASE 
--         WHEN title LIKE '%stories%' THEN 'Short Stories'
--         WHEN title IN ('Just Kids', 'A Heartbreaking Work of Staggering Genius') THEN 'Memoir'
--         ELSE 'Novel'
--     END AS TYPE
-- FROM books;

SELECT
    title,
    author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), ' books')
    END AS COUNT
FROM books 
GROUP BY author_lname, author_fname
ORDER BY author_lname, author_fname;

    