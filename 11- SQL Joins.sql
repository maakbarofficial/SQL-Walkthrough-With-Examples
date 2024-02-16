CREATE DATABASE college;

USE college;

CREATE TABLE student(
	id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO student
(id, name)
VALUES
(101, "Muhammad Imran"),
(102, "Ali"),
(103, "Akbar"),
(104, "Misbah");

CREATE TABLE course(
	id INT PRIMARY KEY,
    course VARCHAR(50)
);

INSERT INTO course
(id, course)
VALUES
(102, "Data Science"),
(105, "Computer Science"),
(103, "Software Engineering"),
(107, "Computer Engineering");

SELECT * FROM student;
SELECT * FROM course;

-- The INNER JOIN keyword selects records that have matching values in both tables.

SELECT * FROM student INNER JOIN course ON student.id = course.id;

-- Aliases are used to give a table, or a column in a table, a temporary name.
-- Aliases are often used to make column names more readable.
-- An alias only exists for the duration of that query.
-- An alias is created with the AS keyword.

SELECT * FROM student AS s INNER JOIN course AS c ON s.id = c.id;


-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records (if any) from the right table (table2).
SELECT * FROM student AS s LEFT JOIN course AS c ON s.id = c.id;

-- The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records (if any) from the left table (table1).
SELECT * FROM student AS s RIGHT JOIN course AS c ON s.id = c.id; 

-- The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.
-- Tip: FULL OUTER JOIN and FULL JOIN are the same.
-- FULL JOIN in MySQL is Left Join UNION Right Join (It doesn't directly exist in mysql but it works in postgresql etc).
-- SELECT column_name(s)
-- FROM table1
-- FULL OUTER JOIN table2
-- ON table1.column_name = table2.column_name
-- WHERE condition;

SELECT * FROM student AS s LEFT JOIN course AS c ON s.id = c.id UNION SELECT * FROM student AS s RIGHT JOIN course AS c ON s.id = c.id;

-- Left Exclusive Join
SELECT * FROM student AS s LEFT JOIN course AS c ON s.id = c.id WHERE c.id IS NULL;

-- Right Exclusive Join
SELECT * FROM student AS s RIGHT JOIN course AS c ON s.id = c.id WHERE s.id IS NULL;

-- A self join is a regular join, but the table is joined with itself. 
CREATE TABLE employee(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    manager_id INT
);

INSERT INTO employee
(id, name, manager_id)
VALUES
(101, "Zeeshan", 103),
(102, "Cristiano", 104),
(103, "Hammad Azhar", NULL),
(104, "Imran Khan", 103);

SELECT *
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT a.name as manager_name,
b.name FROM employee as a
JOIN employee as b
ON a.id = b.manager_id; 



-- The UNION operator is used to combine the result-set of two or more SELECT statements.

-- Every SELECT statement within UNION must have the same number of columns
-- The columns must also have similar data types
-- The columns in every SELECT statement must also be in the same order

-- SELECT column_name(s) FROM table1
-- UNION
-- SELECT column_name(s) FROM table2;

-- SELECT column_name(s) FROM table1
-- UNION ALL
-- SELECT column_name(s) FROM table2;

SELECT name FROM employee
UNION
SELECT name FROM student;

SELECT name FROM employee
UNION ALL
SELECT name FROM student;