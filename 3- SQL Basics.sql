-- Creating Database
CREATE DATABASE SQL_STUDY;
-- DROP DATABASE SQL_STUDY;

-- Using Database 
USE SQL_STUDY;

-- Creating a Table
CREATE TABLE student(
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);

-- Inserting a Data into Table
INSERT INTO student VALUES(1, "Ali Akbar", 22);
INSERT INTO student VALUES(2, "Imran Khan", 71);

-- Printing Student Column
SELECT * FROM Student;
