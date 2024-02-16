CREATE DATABASE college;
-- DROP DATABASE college;

USE college;

CREATE TABLE student(
	rollno INT PRIMARY KEY,
    name VARCHAR(50),
    marks INT NOT NULL,
    grade VARCHAR(1),
    city VARCHAR(20)
);

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(105, "Student 5" , 150, "A", "Karachi"),
(106, "Student 6" , 120, "A", "Mansehra"),
(107, "Student 7" , 99, "A", "Mansehra"),
(108, "Student 8" , 95, "A", "Karachi");

SELECT name, marks FROM student;

SELECT * FROM student;

SELECT DISTINCT city FROM student; -- No Repeat 


-- WHERE Clause 
SELECT * FROM student WHERE marks > 50;
SELECT * FROM student WHERE city = "Karachi";
SELECT * FROM student WHERE marks > 50 AND city = "Karachi";

-- ARITHEMATIC OPERATORS
SELECT * FROM student WHERE marks+10 > 100;
-- The AND and OR operators are used to filter records based on more than one condition:
-- The AND operator displays a record if all the conditions separated by AND are TRUE.
-- The OR operator displays a record if any of the conditions separated by OR is TRUE.
-- The NOT operator displays a record if the condition(s) is NOT TRUE.
SELECT * FROM student WHERE marks > 100 AND city = "Mansehra";
SELECT * FROM student WHERE marks > 100 OR city = "Mansehra";
SELECT * FROM student WHERE NOT city = "Mansehra";

-- The BETWEEN operator selects values within a given range. The values can be numbers, text, or dates.
-- The BETWEEN operator is inclusive: begin and end values are included.
SELECT * FROM student WHERE marks BETWEEN 80 AND 110;

-- The IN operator allows you to specify multiple values in a WHERE clause.
-- The IN operator is a shorthand for multiple OR conditions.
SELECT * FROM student WHERE city IN ("Mansehra", "Karachi");
SELECT * FROM student WHERE marks IN (100, 50);
SELECT * FROM student WHERE marks NOT IN (100, 50);


-- The LIMIT clause is used to specify the number of records to return.
-- The LIMIT clause is useful on large tables with thousands of records. Returning a large number of records can impact performance.
SELECT * FROM student WHERE NOT city = "Mansehra" LIMIT 3;


-- The ORDER BY keyword is used to sort the result-set in ascending or descending order.
-- The ORDER BY keyword sorts the records in ascending order by default. To sort the records in descending order, use the DESC keyword.
SELECT * FROM student ORDER BY city ASC;
SELECT * FROM student ORDER BY marks ASC;
SELECT * FROM student ORDER BY marks DESC LIMIT 3; -- Top 3 Students 


-- AGGREGARE FUNCTIONS (LOGICS)
-- The COUNT() function returns the number of rows that matches a specified criterion.
-- The AVG() function returns the average value of a numeric column. 
-- The SUM() function returns the total sum of a numeric column. 
-- The MIN() function returns the smallest value of the selected column.
-- The MAX() function returns the largest value of the selected column.
SELECT MAX(marks) FROM student;
SELECT MIN(marks) FROM student;
SELECT AVG(marks) FROM student;
SELECT COUNT(name) FROM student;


-- The GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.
SELECT city, COUNT(rollno) FROM student GROUP BY city;
SELECT city, name,  COUNT(rollno) FROM student GROUP BY city, name;
SELECT city, AVG(marks) FROM student GROUP BY city;

-- Q
SELECT city, AVG(marks) FROM student GROUP BY city ORDER BY AVG(marks) DESC;
SELECT grade, COUNT(name) FROM student GROUP BY grade ORDER BY grade;



-- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.
-- SELECT column_name(s)
-- FROM table_name
-- WHERE condition
-- GROUP BY column_name(s)
-- HAVING condition
-- ORDER BY column_name(s);
SELECT city, COUNT(rollno) FROM student GROUP BY city HAVING MAX(marks) > 99;

INSERT INTO student
(rollno, name, marks, grade, city)
VALUES
(109, "Student 9" , 105, "A", "Islamabad");
(110, "Student 10" , 100, "A", "Lahore");

SELECT city, COUNT(rollno) FROM student GROUP BY city HAVING MAX(marks) > 99;

-- ORDER TO WRITE
-- SELECT columns
-- FROM table_name
-- WHERE condition
-- GROUP BY columns
-- HAVING condition
-- ORDER BY columns ASC
SELECT city FROM student WHERE grade = "A" GROUP BY city HAVING MAX(marks) > 50 ORDER BY city DESC;


-- The UPDATE statement is used to modify the existing records in a table.
-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition;
SET SQL_SAFE_UPDATES = 0; -- Turn Off Safe Mode 
UPDATE student SET grade = "O" WHERE grade = "0";
UPDATE student SET marks = 77 WHERE rollno = 101;
UPDATE student SET grade = "B" WHERE marks BETWEEN 80 AND 90;
UPDATE student SET marks = marks + 1;


-- The DELETE statement is used to delete existing records in a table.
-- DELETE FROM table_name WHERE condition;
DELETE FROM student WHERE marks = 81;
DELETE FROM student; -- Whole Table will deleted 

-- FOREIGN KEY
-- Parent Table 
CREATE TABLE department(
	id INT PRIMARY KEY,
    name VARCHAR(50)
); 

-- Child Table 
CREATE TABLE teacher(
	id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(id)
   ON UPDATE CASCADE -- For Reflecting Changes
   ON DELETE CASCADE
);

-- CASCADING FOR FOREIGN KEY
-- CREATE TABLE student (
--     id INT PRIMARY KEY,
--     courseID INT,
--     FOREIGN KEY(courseID) REFERENCES course(id)
--     ON UPDATE CASCADE -- For Reflecting Changes
--     ON DELETE CASCADE
-- );

INSERT INTO department VALUES
(101, "English"),
(102, "IT");

SELECT * FROM department;

INSERT INTO teacher VALUES
(101, "Sir Imran", 101),
(102, "Sir Ali", 102);

SELECT * FROM teacher;

-- DROP TABLE teacher;


-- The ALTER TABLE statement is used to add, delete, or modify columns in an existing table.
-- The ALTER TABLE statement is also used to add and drop various constraints on an existing table.

SELECT * FROM student;

ALTER TABLE student ADD COLUMN age INT NOT NULL DEFAULT 19;

ALTER TABLE student DROP COLUMN stu_age;

ALTER TABLE student RENAME TO stu_age;

ALTER TABLE student CHANGE age stu_age INT;

ALTER TABLE student MODIFY age VARCHAR(2);

INSERT INTO student
(rollno, name, marks, stu_age)
VALUES
(155, "Studentt" , 68, 100),
(122, "Studenttt" , 70, 50);

-- The TRUNCATE TABLE statement is used to delete the data inside a table, but not the table itself.
TRUNCATE TABLE student;

-- JOINS 

-- A JOIN clause is used to combine rows from two or more tables, based on a related column between them.

-- The INNER JOIN keyword selects records that have matching values in both tables.

-- The LEFT JOIN keyword returns all records from the left table (table1), and the matching records (if any) from the right table (table2).

-- The RIGHT JOIN keyword returns all records from the right table (table2), and the matching records (if any) from the left table (table1).

-- The CROSS JOIN keyword returns all records from both tables (table1 and table2).

-- A self join is a regular join, but the table is joined with itself.


-- INNER JOIN Syntax:-
-- SELECT column_name(s)
-- FROM table1
-- INNER JOIN table2
-- ON table1.column_name = table2.column_name;