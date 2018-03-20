-- SELECT
--   Concat(SUBSTRING(title, 1, 10), '...') AS 'Short'
-- FROM books;

-- SELECT
--   Concat(Substringse(REPLACE(title, 'e', 3), 1, 10), '!!!!!!!!!')
-- FROM books;

-- SELECT
--   Concat(author_lname, ' is ', CHAR_LENGTH(author_lname),
--   ' characters long')
-- FROM books;

-- SELECT  
--     LOWER(title)
-- FROM books;

-- SELECT
--     UPPER(REVERSE('Why does my cat look at me with such hatred?'));

-- SELECT
--     REPLACE
--     (
--     CONCAT('I', ' ', 'like', ' ', 'cats'),
--     ' ',
--     '-'
--     );

-- SELECT
--     REPLACE
--     (
--         title, 
--         ' ',
--         '->'
--     )
--     AS 'title'
-- FROM books;

-- SELECT 
--     author_lname as 'forwards',
--     REVERSE
--     (
--         author_lname  
--     )
--     as 'backwards'
-- FROM books;

-- SELECT
--     UPPER
--     (
--         CONCAT
--     (
--         author_fname,
--         ' ',
--         author_lname
--     )
--     ) 
--     as 'full name in caps'
-- FROM books;

-- SELECT
--     CONCAT
--     (
--         title,
--         ' was released in ',
--         released_year
--     )
--     as blurb
-- FROM books;

-- SELECT 
--     title as 'title',
--     CHAR_LENGTH(title)
--     as 'character count'
-- FROM books;

-- SELECT 
--     CONCAT(SUBSTRING(title, 1, 10), '...') AS 'short title',
--     CONCAT(author_lname, ',', author_fname) AS 'author',
--     CONCAT(stock_quantity, ' in stock') AS 'quantity'
-- FROM books ORDER BY title LIMIT 2;
    
-- SELECT DISTINCT
--     CONCAT(author_fname, ' ', author_lname) as 'distinct authors'
-- FROM books
-- ORDER BY author_lname;

-- SELECT author_fname as 'first', author_lname as 'last' FROM books 
-- ORDER BY author_lname, author_fname;

-- SELECT * from books WHERE title LIKE '%king%';
-- % is a wildcard

-- Select * from books where stock_quantity LIKE '____';
-- select * from books where title LIKE '___________';
-- underscore wildcard returns by length of characters

-- select title from books where title LIKE '%\%%';
-- \ if search for actual % or _

-- select title from books where title LIKE '%stories%';
-- SELECT title, pages FROM books ORDER BY pages DESC LIMIT 1; 
-- SELECT CONCAT(title, ' - ', released_year) as 'summary' from books ORDER BY released_year DESC LIMIT 3;
-- SELECT title, author_lname from books WHERE author_lname LIKE '% %';
-- select title, released_year, stock_quantity from books ORDER BY stock_quantity LIMIT 3;
-- SELECT title, author_lname from books ORDER BY author_lname, title;

-- SELECT 
--     CONCAT
--         (
--             'MY FAVORITE AUTHOER IS ', 
--             UPPER(author_fname), 
--             ' ', 
--             UPPER(author_lname), 
--             '!'
--         ) 
--         as 'yell' 
-- FROM books 
-- ORDER BY author_lname;


