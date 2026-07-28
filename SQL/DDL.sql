create database datamites ;

drop database datamites ; 

create table department(
dep_id varchar(255) primary key ,
dep_name varchar(255) not null
);


create table employee(
emp_id varchar (255) primary key ,
email_id varchar (255) unique,
emp_name varchar(255) not null,
monthly_salary int check(monthly_salary<=50000),
bonus decimal(6,2),
dep_id varchar(255),
foreign key employee(dep_id) references department(dep_id)
);

#truncate
insert into department values
("101","HR"),
("102","Operations");

insert into employee values
("1","Taleeb@gmail.com","Taleeb",200,2.5,"101"),
("2","kaif@gmail.com","kaif",400,22.5,"102");

truncate employee;

select * from employee;
select * from department

