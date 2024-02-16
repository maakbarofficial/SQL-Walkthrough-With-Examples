-- SQL constraints are used to specify rules for data in a table.

-- NOT NULL - Ensures that a column cannot have a NULL value
-- UNIQUE - Ensures that all values in a column are different
-- PRIMARY KEY - A combination of a NOT NULL and UNIQUE. Uniquely identifies each row in a table
-- FOREIGN KEY - Prevents actions that would destroy links between tables
-- CHECK - Ensures that the values in a column satisfies a specific condition
-- DEFAULT - Sets a default value for a column if no value is specified
-- CREATE INDEX - Used to create and retrieve data from the database very quickly

USE COMPANY_XYZ;

CREATE TABLE temp1 (
 id INT UNIQUE
);

INSERT INTO temp1 VALUES (101);

SELECT * from temp1;

INSERT INTO temp1 VALUES (101);

-- CREATE TABLE temp2 (
--  id INT PRIMARY KEY,
--  name VARCHAR(50),
--  age INT,
--  city VARCHAR(20),
-- );

CREATE TABLE temp2 (
 id INT,
 name VARCHAR(50),
 age INT,
 city VARCHAR(20),
 PRIMARY KEY (id, name)
);

-- FOREIGN KEY
-- CREATE TABLE Orders (
--     OrderID int NOT NULL,
--     OrderNumber int NOT NULL,
--     PersonID int,
--     PRIMARY KEY (OrderID),
--     CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
--     REFERENCES Persons(PersonID)
-- );


-- Default
-- CREATE TABLE Persons (
--     ID int NOT NULL,
--     LastName varchar(255) NOT NULL,
--     FirstName varchar(255),
--     Age int,
--     City varchar(255) DEFAULT 'Sandnes'
-- );