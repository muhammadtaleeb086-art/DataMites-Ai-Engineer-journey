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




