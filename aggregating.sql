-- COUNT

-- selects only unique first names
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_lname, author_fname) FROM books;
SELECT 
    COUNT(*) 
FROM books 
WHERE title LIKE '%the%';


-- GROUP BY (summarizes or aggregates identical data into single rows)

SELECT
    author_lname,
    COUNT(*)
FROM books
GROUP BY author_lname;

-- count and group by unique authors book totals
SELECT
    author_fname,
    author_lname, 
    COUNT(*)
FROM books
GROUP BY author_lname, 
         author_fname;

SELECT
    released_year,
    COUNT(*)
FROM books
GROUP BY released_year
ORDER BY released_year DESC;


-- MIN and MAX

SELECT MAX(released_year)
FROM books;

-- selecting the title with max pages and accurate title requires subquery
SELECT
    title,
    pages
FROM books
WHERE pages = (SELECT
    MAX(pages)
FROM books);
^^^ sames as SELECT title, pages FROM books where pages=634;

-- could also use ORDER BY
SELECT
    title,
    pages
FROM books
ORDER BY pages DESC LIMIT 1;

-- MIN/MAX with GROUP BY
SELECT
    author_fname,
    author_lname,
    MIN(released_year)
FROM books
GROUP BY author_lname, author_fname;

SELECT  
    CONCAT(author_fname, ' ', author_lname) as author,
    MAX(pages) as 'longest book'
FROM books
GROUP BY author_lname, author_fname;


-- SUM

SELECT 
    SUM(pages)
FROM books;

-- with CONCAT and GROUP BY
SELECT  
    CONCAT(author_fname, ' ', author_lname) as Author,
    SUM(pages) as 'Total Pages Written by'
FROM books
GROUP BY author_lname, author_fname; 

-- AVG

SELECT
    AVG(released_year)
FROM books;

SELECT 
    title,
    released_year,
    COUNT(*),
    AVG(stock_quantity)
FROM books
GROUP BY released_year;

SELECT
    COUNT(*) as 'Total Books in DB'
FROM books;
SELECT 
    COUNT(*) as 'Total Released',
    released_year
FROM books
GROUP BY released_year;
SELECT  
    SUM(stock_quantity) as 'Total Number of Books in Stock'
FROM books;
SELECT  
    CONCAT(author_fname, ' ', author_lname) as Author,
    AVG(released_year) as 'Average Released Year'
FROM books
GROUP BY author_lname, author_fname;

SELECT
    CONCAT(author_fname, ' ', author_lname) AS 'Full Name'
FROM books
WHERE pages = (SELECT
    MAX(pages)
FROM books);

SELECT
    released_year AS year,
    COUNT(*) AS '# books',
    AVG(pages) AS 'avg pages'
FROM books
GROUP BY released_year;