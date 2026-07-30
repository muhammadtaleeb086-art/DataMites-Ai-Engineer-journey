create database zomato1;

# Update
set sql_safe_updates=0;
update  orders set customer_name="Hritik" where order_id="ORD-10001";

#Delete
delete from  orders where customer_name="Hritik";

/* ======================================================
   DQL (Data Query Language) - SELECT Statements
   ====================================================== */

-- 1. Table ke saare records aur saare columns dekhne ke liye
SELECT *
FROM orders;
-- 2. Sirf customer_name aur city columns dekhne ke liye
SELECT customer_name, city
FROM orders;
-- 3. customer_name ka heading "name" show karne ke liye (Alias)
SELECT customer_name AS name, city
FROM orders;
-- 4. Sirf Mumbai city ke orders dekhne ke liye
SELECT *
FROM orders
WHERE city = "Mumbai";
-- 5. Mumbai ke customers ka sirf name aur city dekhne ke liye
SELECT customer_name AS name, city
FROM orders
WHERE city = "Mumbai";


-- 6. Mumbai ke un orders ko dekhna jinki sales 1500 ya usse zyada hain
-- AND => Dono conditions true honi chahiye
SELECT *
FROM orders
WHERE sales >= 1500
AND city = "Mumbai";

/* ======================================================
   Top Orders
   ====================================================== */
-- High sales wale orders ya Mumbai ya Bengaluru ke orders
-- OR => Agar koi bhi ek condition true ho to record show hoga
SELECT *
FROM orders
WHERE sales >= 2000
OR city = "Mumbai"
OR city = "Bengaluru";

-- better way to write the code nd alternate of "or" to "in"  
select *
from orders where sales>=2000 or city in("Mumbai","Bengaluru");

-- Sales 1500 se 2000 ke beech (1500 aur 2000 dono included)
select * from orders where sales  between 1500 and 2000 ;

/* ======================================================
   LIKE Operator = wild card operator
   Pattern Matching
   ====================================================== */
-- 1. Jinke customer_name ki shuruaat 'A' se hoti hai
SELECT *
FROM orders
WHERE customer_name LIKE "A%";
-- 2. Jinke customer_name ka last letter 'a' hai
SELECT *
FROM orders
WHERE customer_name LIKE "%a";
-- 3. Jinke customer_name mein kahin bhi 'a' aata hai
SELECT *
FROM orders
WHERE customer_name LIKE "%a%";
-- 4 Alia Sani nikla na hai
select *
from orders
where customer_name like "a__a____i";

select * from orders;

## order  by , limit , offset
-- sorting  desceding
select * from orders order by sales desc ;

-- sorting in descendingn but only 10 row data
select * from orders order by sales desc  limit 10;

-- the highest sales of data 
select * from orders order by sales desc  limit 1;

-- 3 hightest sales of data by using offset means (skip) and used with limit 
select * from orders order by sales desc limit 1 offset 2 ;

select * from orders where city="Mumbai" and category="Food" order by sales desc limit 1 offset 1;

## Agregation
-- sales ky sum 
select sum(sales) from orders;

--  sales sum as total sales
select sum(sales) as total_sales from orders;

-- average of sales 
select avg(sales) as average_sales from orders;

-- count the order in dataset
select count(*) from orders;

-- maximum sales in orders
select max(sales) from orders;

-- minimum sales of orders
select min(sales) from orders;

-- standard derivation of dataset
select stddev(sales) from orders;

-- variance of sample data
select var_samp(sales) from orders;

-- sales mai se order_id ko null kr dia 
set sql_safe_updates=0; ## safe mode disable 
update orders set sales=null where order_id="ORD-10002";
select count(sales) from orders;

-- customer name in upper case
select upper(customer_name) from orders;

-- customer name in lower case
select lower(customer_name) from orders;

-- customere name left side 3 letter
select left(customer_name,3) from orders;

-- customer name right side 3 letter
select right(customer_name,3) from orders;

-- sub string in customere name 
select substr(customer_name,1,5) from orders;

-- customere name with their addresss using concatinating function
select customer_name,concat(city,",",state) as address from orders;

-- distinct method
select distinct(city) from orders;
select count(distinct(city)) from orders;



## Group by
-- we can groups multiple columns and perform  aggregation functions 

 --  single column group by 
-- city ke base grouping krna hai aur total sales niklna hai (single level)
select city , sum(sales) as citywise_totalsales from orders group by city ;

-- city k base par hum multiple columns par total sum , average , min , max operations kr shkte hai by using group by. 
select city,sum(sales) as citywise_total_sales , avg(sales) as average_sales , min(sales) as minimum_sales , max(sales) as maximum_sales 
from orders group by city ;

 --  multi column group by
--  By using multi column group by we can  used sum and max function in state_wise and region_wise  and order by in asceding order 
select region , state , sum(sales),max(sales) from orders group by region , state order by region ;
-- 

## Case Statement
-- we want customer name , sales , profit and also want a another column with sum conditon
select customer_name , sales, profit,
case
   when sales>=1200 then "High value order"
   when sales>=500 then "Normal value order"
   else "Low value order"
end as order_type
from orders;


## Sub Query
 -- Query inside the Query
 
--  1.single value sub-Query
select * from orders where sales>= (select avg(sales) from orders); 

--
select * from orders where sales>= (select max(sales) from orders);

-- 2.multi value sub-Query

-- city wise avg sales > 1300
/*
This query finds all orders
from cities where the average
sales are at least 1300.
*/
select * 
from orders where city in (
     select city
     from orders
     group by city having avg(sales)>=1300
     );



-- to understand the having method 
select city , sum(sales) as citywise_totalsales from orders group by city having sum(sales)>=70000;





