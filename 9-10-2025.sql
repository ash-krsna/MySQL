create database Practice;
use practice;
select * from customers;
/*so todays taks is like we have to create three tables as customers, orders, shppings
 and then we have top add its column and rows and then we have to make any one of the column 
 of each table i have to make foreign key to perform later operations like "joins" and other all.
... 
1)... 
2) Display all the shipping status along with their customer name(firstname) 
slect t1.first_name, t2.status
from customers as t1
inner join
shippings as t2
on t1.customer-id = 12.customer
3)Display customer_id, order_id, item name along with status(shippings)
for customers who ordered atleast one item.alter
select t1.customer_id, t2.order_id,t2.item, t3.status
from cutomers
inner join
orders as t2 on t1.customer_id = t2.customer_id
inner join
shipping as t3 on t1.customer_id = t3.customer
4)Display customers along with number of items they ordered and number of items got status 'shipped' / 1.
select count(customer_id) from customers
select t1.customer_id, count(t2.customer_id) as number_of_orders count(t3.customer) as no_of_deliverd from Customers left join orders as t2 on t1.customer_id = t2.customer_id
inner join shipping as t3
where t3.status="deliverd/peding/"-- we can use this also to sort the data.
group by t2.customer_id order by t1.customer_id -- I'll prefer this to use for to take 4th answer.

-- Is there is any condition called having and also tell me about the join because yesterday when sir is teaching i ywaling too much and want to take a samll nap and not even this my whole yesterday till eveningit spend like doing nothing and totally in tiredness so exaplain me some recent topics of it from tuesday ok chatgpt...

5) Show customers who havent't placed any order.
6) Find ordersthathave not been 'deliverd'.
7) Find customers who ordered more than one / (1).
8) Find all orders placed by customer who are from 'Braj,Barsana'
*/
/*this are the quereis which i perfrom in mysql command line client
-- 
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 17
Server version: 8.0.43 MySQL Community Server - GPL

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use practice;
Database changed
mysql> create table customers(customer_id int primary key auto_increment,First_name varchar(100) not null, Last_name varchar(100),age int, country varchar(100));
Query OK, 0 rows affected (0.07 sec)

mysql> create table orders(order_id int, item(varchar(100), amount int, customer_id int);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '(varchar(100), amount int, customer_id int)' at line 1
mysql> create table orders(order_id int, item varchar(100), amount int, customer_id int);
Query OK, 0 rows affected (0.05 sec)

mysql> create table shippings (shipping_id int, status int, customer int);
Query OK, 0 rows affected (0.05 sec)

mysql> alter table customers rename column country to city;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table orders
    -> ^C
mysql> alter table orders add column order_id int primary key;
ERROR 1060 (42S21): Duplicate column name 'order_id'
mysql> alter table orders add column orders_id int primary key;
Query OK, 0 rows affected (0.09 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table orders drop column order_id;
Query OK, 0 rows affected (0.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table orders rename column orderes_id to order_id;
ERROR 1054 (42S22): Unknown column 'orderes_id' in 'orders'
mysql> 
-- */