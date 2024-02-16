CREATE DATABASE Company_XYZ;

USE Company_XYZ;

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(100),
salary INT
);

INSERT INTO employee
(id, name, salary)
VALUES
(1, "Emp1", 25000),
(2, "Emp2", 30000),
(3, "Emp3", 40000);

SELECT * FROM employee;