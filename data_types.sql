-- CHAR 

-- fixed number, will truncate if too long or add spaces to get to exact char length

-- DECIMAL ()

INSERT INTO items(price, product) VALUES(6, 'candy');

-- FLOAT/DOUBLES are approximations

-- Dates & Times Insert: (CURDATE(), CURTIME, NOW())

INSERT INTO people (name, birthdate, birthtime, birthdt)
  VALUES ('Karl', curdate(), curtime(), now());

-- DATETIME Shortcuts: https://dev.mysql.com/doc/refman/5.7/en/date-and-time-functions.html#function_date-format
SELECT
    birthdate,
    DATE_FORMAT(birthdate, '%M %d, %Y')
FROM people;
SELECT
    birthtime,
    DATE_FORMAT(birthtime, '%h:%i %p')
FROM people;


-- Date math

SELECT 
    DATE_FORMAT(NOW(), '%M %d, %Y') AS 'Current Time',
    DATE_FORMAT(birthdate, '%M %d, %Y') AS Birthdate ,
    DATEDIFF(NOW(), birthdate) AS Difference
FROM people;


-- TIMESTAMPS - two differences between timestamps and datetime: 1: timestamp
-- restricted to 1970-2038, 2: timestamp is smaller, but with limited range ^

INSERT INTO comments(content) VALUES('And some more, but a few minutes after the first two');

-- ON UPDATE

CREATE TABLE comments2 (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    content VARCHAR(100),
    changed_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);
Insert into comments2(content) VALUES('some differet content');

UPDATE comments2 SET content = 'this content has been edited' WHERE id = 2;

-- good use of CHAR?

CREATE TABLE teams (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, name_abbr CHAR(3));
INSERT INTO teams(name_abbr) VALUES('SAS');

CREATE TABLE inventory (id INT NOT NULL PRIMARY KEY AUTO_INCREMENT, item_name VARCHAR(100), price DECIMAL(8,2), quantity INT);

INSERT INTO inventory(item_name, price, quantity) VALUES('Honda Fits', '12399.99', 46);

SELECT DATE_FORMAT(NOW(), '%M %D at %l:%i');

CREATE table tweets
    (
        id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
        content VARCHAR(140),
        username VARCHAR(15),
        created_at TIMESTAMP DEFAULT NOW() 
    );

INSERT INTO tweets(content, username) VALUES('My first tweet', 'monkey_face16');