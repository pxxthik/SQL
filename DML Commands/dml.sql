DROP DATABASE IF EXISTS campusx;
CREATE DATABASE IF NOT EXISTS campusx;
USE campusx;

CREATE TABLE users(
	user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    f1 INTEGER,
    f2 INTEGER,
    password VARCHAR(255) NOT NULL
);

-- INSERT

INSERT INTO users (user_id, name, email, f1, f2, password) VALUES (NULL, ' nitish', 'nitish@gmail.com', 10, 20, '1234');
INSERT INTO users VALUES (NULL, ' ankit', 'ankit@gmail.com', 11, 22, '1234');
INSERT INTO users (name, email, password) VALUES ('amit', 'amit@gmail.com', '4567');
-- Adding multiple rows
INSERT INTO users VALUES
(NULL, 'rishab', 'rishab@gmail.com', 12, 22, '2467'),
(NULL, 'rahul', 'rahul@gmail.com', 13, 23, '8538');

-- SELECT

SELECT * FROM users WHERE 1;

-- Filtering cols
SELECT name, email FROM users;

-- Aliasing (Renaming cols)
SELECT f1 AS 'Feature 1', f2 AS 'Feature 2' FROM users;

-- Create expression using cols
SELECT f1 * f2 AS 'New Feature' FROM users;

-- Constants
SELECT "smartpones";

-- Distict (unique)
SELECT DISTINCT name FROM users;
-- Distict combo
SELECT DISTINCT name, email FROM users;

-- WHERE (filtering rows)
SELECT * FROM users WHERE email = 'ankit@gmail.com';
SELECT * FROM users WHERE f1 > 10;
SELECT * FROM users WHERE f1 BETWEEN 11 AND 12;
SELECT * FROM users WHERE f1 > 11 AND f2 > 22;

-- IN, NOT IN
SELECT * FROM users
WHERE email IN ('nitish@gmail.com', 'ankit@gmail.com');


-- UPDATE
UPDATE users
SET f1 = 14
WHERE email = "nitish@gmail.com";


-- DELETE
DELETE FROM users
WHERE f1 > 100;


-- AGGRIGATE FUNCTIONS
SELECT MIN(f1) AS "min" FROM users;
SELECT MAX(f1) AS "max" FROM users;
SELECT AVG(f1) AS "avg" FROM users;
SELECT SUM(f1) AS "sum" FROM users;
SELECT COUNT(f1) AS "count" FROM users;
SELECT COUNT(DISTINCT(f1)) FROM users;
SELECT STD(f1) AS "std" FROM users;
SELECT VARIANCE(f1) AS "var" FROM users;

-- Scalar functions
SELECT ABS(f1) AS 'abs' FROM users;
SELECT SQRT(f1) AS 'sqrt' FROM users;
SELECT ROUND(f1) AS 'round' FROM users;
SELECT CEIL(f1) AS 'ceil' FROM users;
SELECT FLOOR(f1) AS 'floor' FROM users;
SELECT ROUND(f1) AS 'round' FROM users;
SELECT CEIL(f1) AS 'ceil' FROM users;
SELECT FLOOR(f1) AS 'floor' FROM users;