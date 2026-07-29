create  database practiceDB ;

### 1. Create a Student Table
-- Create a table named `students` with the following columns:
--  student_id (Integer, Primary Key)
--  first_name (VARCHAR(50))
--  last_name (VARCHAR(50))
--  age (Integer)
--  email (VARCHAR(100))-- 

create table students (
student_id integer  primary key,
first_name varchar(50) ,
last_name varchar(50),
age integer,
email varchar(50)
);

select * from students;

### 2. Create an Employee Table with Constraints
-- Create a table named `employees` with:
-- emp_id (Primary Key)
-- name (VARCHAR(100), NOT NULL)
-- salary (DECIMAL(10,2))
-- department (VARCHAR(50))
-- joining_date (DATE)

create table employees(
emp_id integer primary key ,
emp_name varchar(100) not null ,
salary decimal(10,2),
department varchar(50),
joining_date DATE
);

select * from employees;


### 3. Add New Columns
-- The `students` table already exists.
-- Write SQL statements to:
-- Add a `phone_number` column (VARCHAR(15))
-- Add a `city` column (VARCHAR(50))

ALTER TABLE students
add phone_no varchar(15),
add city varchar(50);

select * from students;

### 4. Modify Existing Columns
-- Using the `students` table:
-- Change the size of `first_name` from 50 to 100 characters.
-- Make the `email` column `NOT NULL`.

ALTER TABLE students
modify column first_name varchar(100),
modify column email varchar(100) not null ;

select * from students;

### 5. Remove Columns
-- Write SQL statements to:
-- Remove the `age` column.
-- Remove the `phone_number` column.

ALTER TABLE students
drop column age ,
drop column phone_no;

select * from students;

### 6. Create Department and Employee Tables with Foreign Key
-- Create two tables.
-- **departments**
-- dept_id (Primary Key)
-- dept_name (Unique)
-- **employees**
-- emp_id (Primary Key)
-- emp_name
-- salary
-- dept_id (Foreign Key referencing departments)

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE
);

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
DESC departments;
DESC employees;