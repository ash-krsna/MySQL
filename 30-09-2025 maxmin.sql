-- 30 / 09 / 2025 -- 
-- 4) MAX : It is used to return the maximum value(largest value)in the column 
--  find the highest salary paid through on gender from staff table in
select gender, max(staff_salary) from staff group by gender; -- here I use ';' semicolon but it work without semicolon also.

-- 5) MIN: It is used to minimum value lowest value in the column
-- Find the lowest salary based on geder in staff table
select gender, min(staff_salary) from staff group by gender;
-- 6) GROUP_CONCAT():It is used to return a concatenated string of values from the group
-- Display number of people based on gender along with their names in employees table
select gender, count(staff_id), group_concat(staff_name) from staff group by gender;
/* JOINS : JOINS are used to get data by combining multiple tables.
			Each table will have a relation with another table.
			Primary keyws in one tbale becomes foreign keys in another tbale
*/

-- ----------------------------------------------------------------------------- --
create database shop;
 use shop;
 create table Customers(customer_id int primary key auto_increment, customer_name varchar(20) not null, age int check(age>=12), country varchar(20) not null default "India");
 create table orders(order_id int primary key auto_increment, item varchar(20) not null, amount int not null, cust_id int, foreign key(cust_id) references customers(customer_id));
 /* JOIN are divided as multiple types such as 
	1) inner join
    2) left join
    3) right join
    4) full outer join
    5) self join
*/
-- 1) inner join: It is is used to display the rows which are common in both tables.
-- 	  			  It matches values between tables and only matched results will be on display.
-- Q. Write a Query to retrive customer_name, customer_id and along with the total amount spent by each customer.
select cust.customer_id,
	   cust.customer_name,
	   ord.item,
	   ord.amount
 from customers as cust 
 inner join orders as ord
 ON cust.customer_id = ord.cust_id;
 select * from orders;
 select * from customers;
 
 
 


