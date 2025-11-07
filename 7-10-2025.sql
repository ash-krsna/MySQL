-- 7-10-2025
/*
Join:-
1) inner join
2) left join
3) right join
4) full outer joi
5) self join
----------------------------------------------------------
1) inner join; 

*/
use shop;
select t1.customer_name,group_concat(t2.item) from customers as t1 inner join orders as t2 ON t1.customer_id = t2.cust_id group by t1.customer_name;-- 08:00:39	select t1.customer_name,group_concat(t2.item) from customers as t1 inner join orders as t2 ON t1.cid = t2.cust_id group by t1.customer_name LIMIT 0, 1000	Error Code: 1054. Unknown column 't1.cid' in 'on clause'	0.000 sec
-- write a query to print customer names along with number of items they bought
select t1.customer_name, count(t2.item) from customers as t1 inner join orders as t2 on t1.customer_id = t2.cust_id group by t1.customer_id; -- 08:08:10	select t1.customer_name,group_concat(t2.item) from customers as t1 inner join orders as t2 ON t1.cid = t2.cust_id group by t1.customer_name LIMIT 0, 1000	Error Code: 1054. Unknown column 't1.cid' in 'on clause'	0.000 sec
select t1.customer_name, count(t2.item) from customers as t1 left join orders as t2 on t1.customer_id = t2.cust_id group by t1.customer_id;
select t1.customer_name, count(t2.item) from customers as t1 right join orders as t2 on t1.customer_id = t2.cust_id group by t1.customer_id;
-- Write a query to print customers country along with number of items
select t1.country, count(t2.item) from custoemrs as t1 right join orders as t2 on t1.customer_id = t2.custoemer_id group by t1.country;--08:24:55	select t1.country, count(t2.item) from custoemrs as t1 right join orders as t2 on t1.customer_id = t2.custoemer_id group by t1.country LIMIT 0, 1000	Error Code: 1146. Table 'shop.custoemrs' doesn't exist	0.000 sec

/*
2) left join: it is used to display the complete rows of left table and command data from right table. incase of values which are present only onleft table, it automatically fills null on result.
-- syntax same
3) right join: it is used to display the complete rows of the right table and common data from left table. Incase of values awhich are present only nright table, it automatically fills null onresult
-- syntax:-> #syntax are same just change the join name 
4) full outer join: it is not possible to do full outer join directly in MySQL. There is a way to achievee this using 'UNION' uniion is used to combine results of multiple queries 
	left join query
     union
    rifht join query

*/

