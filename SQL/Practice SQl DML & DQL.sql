CREATE DATABASE DML_DQL;
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    age INT,
    salary DECIMAL(10,2),
    city VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
INSERT INTO departments VALUES
(1,'HR'),
(2,'IT'),
(3,'Sales'),
(4,'Finance');
INSERT INTO employees VALUES
(101,'Ali',23,35000,'Delhi',2),
(102,'Sara',28,45000,'Mumbai',1),
(103,'Ahmed',30,60000,'Delhi',2),
(104,'John',25,30000,'Pune',3),
(105,'Ayesha',27,70000,'Mumbai',4),
(106,'Rohan',24,32000,'Delhi',3),
(107,'Priya',29,55000,'Chennai',2),
(108,'Kabir',31,80000,'Delhi',4),
(109,'Neha',26,42000,'Pune',1),
(110,'Arjun',22,28000,'Mumbai',3);
SELECT * FROM departments;
SELECT * FROM  employees;

##Question 1 (Easy) 
-- Insert a new employee.
-- emp_id = 111
-- emp_name = Rahul
-- age = 27
-- salary = 48000
-- city = Bangalore
-- dept_id = 2
INSERT INTO employees VALUES
(111,'Rahul',27,48000,'Bangalore',2);
select * from employees;

## Question 2:Update Rahul's salary to 55000.
UPDATE employees
SET salary = 55000
WHERE emp_id = 111;
SELECT * FROM employees
WHERE emp_id = 111;

## ## Question 3:Change the city of employee **Ali** to **Noida**.
update employees
set city = 'Noida'
where emp_id = '101';
select * from employees;

