CREATE DATABASE IF NOT EXISTS college;
USE college;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO student
(rollno, name)
VALUES
(103, "Imran"),
(104, "Cristiano");

SELECT * FROM student;



