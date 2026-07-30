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

##7. Rename Table and Column
-- Write SQL statements to:
-- Rename table employees to staff.
-- Rename column emp_name to employee_name.

rename table employees to staff;
ALTER TABLE staff
RENAME COLUMN emp_name TO employee_name;

select * from staff;

### 8. Create an Orders Table
-- Create a table named `orders` with:
-- - order_id (Primary Key)
-- - customer_name (NOT NULL)
-- - amount (Must always be greater than 0)
-- - order_date (Default today's date)
-- - status (Default 'Pending')
-- Use appropriate constraints.

create table orders(
order_id varchar(255) primary key ,
customer_name varchar(255) Not null ,
amount  decimal(10,2) check (amount > 0),
order_date date default (current_date()),
status varchar(255) default 'pending'
);

INSERT INTO orders VALUES
(1, 'Ali', 2500, '2025-07-20', 'Pending');

select * from orders;

### 9. Alter Table with Multiple Operations
-- The `staff` table already exists.
-- Write SQL statements to:
--  Add a `bonus` column (DECIMAL(8,2), default 0)
--  Change `salary` to DECIMAL(12,2)
--  Add a UNIQUE constraint on `employee_name`
--  Drop the `department` column

Alter table staff add bouns decimal(8,2) default(0);
Alter table staff modify column salary decimal(12,2);
ALTER TABLE staff ADD CONSTRAINT uq_employee_name UNIQUE (employee_name);

ALTER TABLE staff
DROP FOREIGN KEY staff_ibfk_1;

ALTER TABLE staff
DROP COLUMN dept_id;

select * from staff;

### 10. Company Database Design Challenge
-- Create the following tables with all appropriate constraints.
### Projects
-- project_id (Primary Key)
-- project_name (NOT NULL)
-- budget (Must be greater than 10000)
### Employees
-- emp_id (Primary Key)
-- emp_name (NOT NULL)
-- email (Unique)
-- project_id (Foreign Key)
-- joining_date (Default current date)
### Requirements
-- Use PRIMARY KEY
-- Use FOREIGN KEY
-- Use UNIQUE
-- Use NOT NULL
-- Use CHECK
-- Use DEFAULT
create table projects(
project_id integer primary key ,
project_name varchar(255) not null ,
budget decimal(12,2),
check (budget >=10000)
);
create table employees(
emp_id int primary key ,
emp_name varchar(255) not null , 
email varchar(255) unique,
project_id int ,
foreign key employees(project_id) references projects(project_id),
joining_date date default (current_date)
);
DESC projects;
DESC employees;

