-- Challenge 1: Five oldest users
SELECT 
    username,
    DATE_FORMAT(created_at, '%M, %D, %Y') AS 'Join Date'
FROM users
ORDER BY created_at
LIMIT 5;

-- Challenge 2: Day of week most users register on?
SELECT 
    DATE_FORMAT(created_at, '%W') AS Day,
    COUNT(*) AS Count
FROM users
GROUP BY Day
ORDER BY Count DESC;

-- Challenge 3: Users who have never posted a photo
SELECT 
    *
FROM users AS u
LEFT JOIN photos AS p
    ON u.id = p.user_id
WHERE p.id IS NULL
GROUP BY u.id;

-- Challenge 4: Most likes on a single photo
SELECT 
    u.username,
    p.image_url AS ImageURL,
    COUNT(*) AS Likes
FROM likes AS l
JOIN photos AS p
    ON p.id = l.photo_id
JOIN users as u 
    ON u.id = p.user_id
GROUP BY p.id
ORDER BY Likes DESC
LIMIT 10;

-- Challenge 5: How many times does the average user post?
SELECT
    (
        SELECT 
            COUNT(*)
        FROM photos
    ) /
    (
        SELECT
            COUNT(*)
        FROM users
    ) AS AVG;
    
-- Challenge 6: What are the top 5 most commonly used hashtags?
SELECT 
    t.tag_name,
    COUNT(*) AS total
FROM photo_tags AS p
    JOIN tags AS t
        ON p.tag_id = t.id
GROUP BY t.id
ORDER BY total DESC
LIMIT 5;

-- Challenge 7: Find users who have liked every single photo on the site
SELECT 
    u.username,
    COUNT(*) AS Total_Likes
FROM users AS u 
    JOIN likes AS l
        ON l.user_id = u.id
GROUP BY u.id
HAVING Total_Likes = (SELECT COUNT(*) FROM photos);

