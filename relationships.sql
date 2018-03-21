-- 1:MANY, customers & orders

-- CREATE TABLE customers
--     (
--         id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--         first_name VARCHAR(100),
--         last_name VARCHAR(100),
--         email VARCHAR(100)
--     );
    
-- CREATE TABLE orders
--     (
--         id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--         order_date DATE,
--         amount DECIMAL(8,2),
--         customer_id INT,
--         FOREIGN KEY(customer_id) REFERENCES customers(id)
--     );
    
-- INSERT INTO customers (first_name, last_name, email) 
-- VALUES ('Boy', 'George', 'george@gmail.com'),
--       ('George', 'Michael', 'gm@gmail.com'),
--       ('David', 'Bowie', 'david@gmail.com'),
--       ('Blue', 'Steele', 'blue@gmail.com'),
--       ('Bette', 'Davis', 'bette@aol.com');
       
-- INSERT INTO orders (order_date, amount, customer_id)
-- VALUES ('2016/02/10', 99.99, 1),
--       ('2017/11/11', 35.50, 1),
--       ('2014/12/12', 800.67, 2),
--       ('2015/01/03', 12.50, 2),
--       ('1999/04/11', 450.25, 5);

-- INSERT INTO orders(order_date, amount, customer_id) VALUES(now(), 13.99, 1);


-- CROSS JOIN, multiple rows, kinda useless without WHERE
-- SELECT * FROM customers, orders;

-- IMPLICIT INNER JOIN
-- SELECT first_name, last_name, order_date, amount
-- FROM customers, orders
--     WHERE customers.id = orders.customer_id;

-- EXPLICIT INNER JOIN
-- SELECT
--     c.id AS CustomerID,
--     CONCAT(c.first_name, ' ', c.last_name) as Name,
--     c.email AS Email,
--     DATE_FORMAT(o.order_date, '%M %D, %Y') AS OrderDate,
--     o.amount AS Amount
-- From customers AS c
-- INNER JOIN orders AS o ON
-- c.id = o.customer_id
-- WHERE o.customer_id = 2
-- ORDER BY o.amount;



-- LEFT JOIN
-- SELECT 
--     c.id AS ID,
--     CONCAT(c.first_name, ' ', c.last_name) AS Name,
--     c.email AS Email,
--     CASE 
--         WHEN o.amount IS NOT NULL THEN CONCAT('$', SUM(o.amount))
--         ELSE '$0'
--     END AS 'Total Spent'
-- FROM customers c
-- LEFT JOIN orders o
--     ON c.id = o.customer_id
-- GROUP BY c.id
-- ORDER BY o.amount DESC;

-- ^^^ with IFNULL
-- SELECT 
--     c.id AS ID,
--     CONCAT(c.first_name, ' ', c.last_name) AS Name,
--     c.email AS Email,
--     IFNULL(SUM(o.amount), 0) AS 'Total Spent'
-- FROM customers c
-- LEFT JOIN orders o
--     ON c.id = o.customer_id
-- GROUP BY c.id
-- ORDER BY o.amount DESC;


-- RIGHT JOIN - literal opposite of LJ
-- SELECT 
--     *
-- FROM customers
-- RIGHT JOIN orders
-- ON customers.id = orders.customer_id;

-- SELECT 
--     IFNULL(first_name,'MISSING') AS first, 
--     IFNULL(last_name,'USER') as last, 
--     order_date, 
--     amount, 
--     SUM(amount)
-- FROM customers
-- RIGHT JOIN orders
--     ON customers.id = orders.customer_id
-- GROUP BY first_name, last_name;


-- CHALLENGES
-- CREATE TABLE students
--     (
--         id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--         first_name VARCHAR(100) NOT NULL UNIQUE
--     );
    
-- CREATE TABLE papers
--     (
--         id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
--         title VARCHAR(100),
--         grade INT,
--         student_id INT,
--         FOREIGN KEY(student_id) REFERENCES students(id)
--         ON DELETE CASCADE
--     );
    
-- INSERT INTO students (first_name) VALUES 
-- ('Caleb'), 
-- ('Samantha'), 
-- ('Raj'), 
-- ('Carlos'), 
-- ('Lisa');
 
-- INSERT INTO papers (student_id, title, grade ) VALUES
-- (1, 'My First Book Report', 60),
-- (1, 'My Second Book Report', 75),
-- (2, 'Russian Lit Through The Ages', 94),
-- (2, 'De Montaigne and The Art of The Essay', 98),
-- (4, 'Borges and Magical Realism', 89);

-- SELECT
--     st.first_name,
--     p.title,
--     p.grade
-- FROM students st
-- JOIN papers p
--     ON st.id = p.student_id
-- ORDER BY p.grade DESC;

-- SELECT
--     st.first_name,
--     p.title,
--     p.grade
-- FROM students st
-- LEFT JOIN papers p
--     ON st.id = p.student_id
-- ORDER BY st.id;

-- SELECT
--     st.first_name,
--     IFNULL(p.title, 'MISSING') AS title,
--     IFNULL(p.grade, 0) AS grade
-- FROM students st
-- LEFT JOIN papers p
--     ON st.id = p.student_id
-- ORDER BY st.id;

-- SELECT
--     st.first_name,
--     IFNULL(AVG(p.grade), '0') AS average
-- FROM students st
-- LEFT JOIN papers p
--    ON st.id = p.student_id
-- GROUP BY st.id
-- ORDER BY average DESC, st.first_name DESC;

-- SELECT
--     st.first_name AS 'Student',
--     IFNULL(AVG(p.grade), '0') AS average,
--     CASE
--         WHEN p.grade > 70 THEN 'PASSING'
--         ELSE 'FAILING'
--     END AS 'Status'
-- FROM students st
-- LEFT JOIN papers p
--     ON st.id = p.student_id
-- GROUP BY st.id
-- ORDER BY p.grade DESC, st.first_name DESC;