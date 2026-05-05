CREATE DATABASE IF NOT EXISTS test;
USE test;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS instructor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    dept_name VARCHAR(255) NOT NULL
);

INSERT INTO instructor (name, dept_name)
SELECT * FROM (
    SELECT 'Ada Lovelace' AS name, 'Computer Science' AS dept_name
    UNION ALL
    SELECT 'Grace Hopper', 'Computer Science'
    UNION ALL
    SELECT 'Katherine Johnson', 'Mathematics'
    UNION ALL
    SELECT 'Richard Feynman', 'Physics'
) AS seed_rows
WHERE NOT EXISTS (
    SELECT 1 FROM instructor
);
