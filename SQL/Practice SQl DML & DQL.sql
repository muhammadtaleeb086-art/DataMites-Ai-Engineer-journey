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


INSERT INTO employees VALUES
(201,'Michael',28,52000,'New York',2),
(202,'Sophia',31,78000,'London',1),
(203,'Daniel',26,45000,'Toronto',3),
(204,'Emma',29,69000,'Sydney',4),
(205,'James',34,85000,'Paris',2),
(206,'Olivia',24,38000,'Berlin',1),
(207,'William',30,61000,'Dubai',3),
(208,'Isabella',27,57000,'Singapore',4),
(209,'Ethan',33,92000,'Tokyo',2),
(210,'Mia',25,41000,'Seoul',1);

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

#### Question 4-Increase the salary of **every employee** by **5000**.
Update employees 
set salary = salary + 5000 ; 
select * from employees;

## Question 5-Delete the employee whose ID is **110**.
delete from employees where emp_id=110;
select * from employees;

## Question 6-Delete every employee working in department **HR (dept_id=1)**.
DELETE FROM employees
WHERE dept_id = 1;
select * from employees;

## Question 7-Update every employee from **Delhi** by increasing their salary by **10%**.
UPDATE employees
SET salary = salary * 1.10
WHERE city = 'Delhi';
select * from employees;

## Question 8-Change the department of **John** from Sales to IT.
UPDATE employees
SET dept_id = 2
WHERE emp_name = 'John' AND dept_id = 3;
select * from employees;

## Question 9-Delete employees whose salary is less than **70000**.
Delete  from employees where salary < 70000;
select * from employees;

## Question 10-Give a **₹2000 bonus** to employees whose salary is greater than **50000**.
Update employees
set salary = salary + 2000
where salary > 50000 ;
select * from employees;

# DQL Practice (20 Questions)

## Basic SELECT

### Question 1-Display all employees.
select * from employees ;


### Question 2-Display only employee names.
SELECT emp_name FROM employees;

### Question 3-Display employee names and salaries.
select emp_name , salary from employees;


### Question 4-Display unique cities.
select distinct city  from employees;


### Question 5-Display employees whose salary is greater than **50000**.
select * from employees where salary > 50000;

## WHERE
### Question 6-Display employees from Delhi.
select * from employees where city = "Delhi";

### Question 7-Display employees whose age is greater than 25.
select * from employees where age > 25;


### Question 8-Display employees whose salary is between **30000 and 60000**.
select * from employees where salary >=30000 and salary <=60000;


### Question 9-Display employees whose city is Mumbai.
select * from employees where city = "Mumbai";


### Question 10-Display employees working in department 2.
select * from employees where dept_id=2;


## ORDER BY

### Question 11-Display employees ordered by salary (ascending).

select * from employees order by salary asc ; 

### Question 12-Display employees ordered by salary (descending).
select * from employees order by salary desc ; 

### Question 13-Display employees ordered by age.
select * from employees order by age;

## LIMIT
### Question 14-Display the first 5 employees.
select * from employees limit 5;

### Question 15-Display the top 3 highest-paid employees.
select * from employees order by salary desc limit 3 ;

## LIKE
### Question 16-Display employees whose names start with **A**.
select * from employees where emp_name like "A%";


### Question 17-Display employees whose names end with **a**.
select * from employees where emp_name like "%A";


### Question 18-Display employees whose names contain **h**.
select * from employees where emp_name like "%H%";

## IN
### Question 19-Display employees from Delhi or Mumbai.
select * from employees where city in ("Delhi","Mumbai");

## BETWEEN
### Question 20-Display employees whose age is between **24 and 29**.
select * from employees where age between 24 and  29;

# Aggregate Functions (Easy)

## Question 1:Count the total number of employees.
-- **Hint:** Use `COUNT()`.
select count(*) from employees;

## Question 2 Find the total salary paid to all employees.
-- **Hint:** Use `SUM()`.
select sum(salary) from employees;

## Question 3 Find the average salary of employees.
-- **Hint:** Use `AVG()`.
select avg(salary) from employees;

## Question 4 Find the highest salary.
-- **Hint:** Use `MAX()`. 
select max(salary) from employees;

## Question 5 Find the lowest salary.
-- **Hint:** Use `MIN()`.
select min(salary) from employees;


# GROUP BY (Intermediate)

## Question 6 Display the number of employees in each department.
-- Expected output:
-- | dept_id | total_employees |
-- | --- | --- |
-- | 1 | 2 |
-- | 2 | 3 |
-- | 3 | 2 |
-- | 4 | 3 |
select dept_id , count(*) as total_employees from employees group by dept_id;

## Question 7 Display the average salary of each department.
-- Expected output:
-- | dept_id | avg_salary |
-- | --- | --- |
-- | 1 | 43500 |
-- | 2 | 50000 |
-- | 3 | 39000 |
-- | 4 | 75000 |
select dept_id , avg(salary) as avg_salary from employees group by dept_id;

## Question 8 Display the highest salary in each department.
select dept_id , max(salary) as max_salary from employees group by dept_id ;
 
 
## Question 9 Display the total salary paid by each department.
select dept_id , sum(salary) as total_salary from employees group by dept_id ;


## Question 10 Display the number of employees in each city.
-- Expected output:
-- | city  | employees |
-- | ---   | --- |
-- | Delhi | 4 |
-- | Mumbai| 3 |
-- | Pune  | 2 |
select city, count(*) as employees from employees group by city ;

## HAVING (Advanced)
-- `HAVING` is used to filter **groups**, while `WHERE` filters **rows**.

## Question 11 Display departments having more than **2 employees**.


## Question 12 Display departments whose average salary is greater than **50000**.


## Question 13 Display cities where more than **1 employee** lives.


## Question 14 Display departments whose total salary is greater than **100000**.


## Question 15 Display cities where the maximum salary is greater than **70000**.