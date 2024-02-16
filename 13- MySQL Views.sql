CREATE DATABASE college_view;
-- DROP DATABASE college_view;

USE college_view;

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

-- VIRTUAL TABLE 

CREATE VIEW view1 AS
SELECT rollno, name FROM student;

SELECT * FROM view1; 

DROP VIEW view1;