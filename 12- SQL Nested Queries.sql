CREATE DATABASE college_temp;
-- DROP DATABASE college_temp;

USE college_temp;

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
(101, "Ali" , 150, "A", "Karachi"),
(102, "Akbar" , 120, "A", "Islamabad"),
(103, "Misbah" , 99, "B", "Islamabad"),
(104, "Imran" , 95, "B", "Karachi");

-- SQL SUB QUERIES
-- A SubQuery or Inner Query or a Nested Query is a query within another SQL Query. 
-- From Prev Student Table
SELECT AVG(marks) FROM student;
-- Result  87.6667
SELECT name
FROM student WHERE marks > 87.6667;

-- The Above query is static

-- The dynamic one will be
SELECT name, marks
FROM student
WHERE marks > (SELECT AVG(marks) FROM student);  



-- Another Example with WHERE
SELECT rollno
FROM student
WHERE rollno % 2 = 0;
-- Result 102, 104, 106 
SELECT name
FROM student
WHERE rollno IN (102, 104, 106);

-- Now Making it Dynamic
SELECT name
FROM student
WHERE rollno IN (
	SELECT rollno
	FROM student
	WHERE rollno % 2 = 0);
    
    
    
-- Another Example with FROM
SELECT MAX(marks) FROM
(SELECT * FROM student WHERE city = "Islamabad") AS temp;


-- Another Example with SELECT
SELECT (SELECT MAX(marks) FROM student), name FROM student;