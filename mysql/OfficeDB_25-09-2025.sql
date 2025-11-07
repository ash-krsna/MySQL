-- 25 / 09 / 2025
-- DML: (Data Manipulation Language)-
-- It is used to manipulate the data such as inserting the data, updating the data and deleting the data.
-- -------------------------------------------------------------------------------------- --
-- DROP DATABASE OFFICEDB
-- CREATE DATABASE OFFICE;
use office;
SET SQL_SAFE_UPDATES = 0;

/* create table employees
(eid int primary key auto_increment,ename varchar(20) not null, gender char(1), salary decimal(10,2),
country varchar(10) default "INDIA"); -- decimal takes max digits of 10 and only TWO decimal point like this ex, (.00)\
-- 1) Insert the data: To insert data into table we can use below syntax like
--      -insert into tableName values(col1 value, col2 value...)
-- 	  #for multi row insert
-- 		-insert into tableName values(col1 value, col2 value,...),(col1 value, col2 value,...),(col1 value, col2 value,...)...
--    #for specific column insert 
-- 		-insert into tableName(col1, col3, col5) values(col1, col3, value, col5 value)

-- insert into single row
insert into employees values(101, "shekhar","M",28000.00,"UK");
-- insert into single row with specific columns
insert into employees(ename,gender,salary) values("John","M",14000.00);
insert into employees(ename,gender) values("Bharti","F");
-- insert into multi rows
insert into employees(ename, gender, salary, country)
values("Puja","F",25000.00,"Canada"),
("Priti","F",31000.00,"India"),
("Sham","M",60000.00,"India"); -- i got this error here while I'm typing "0	16	08:20:19	insert into employees(ename, gender, salary, country) values("Puja","F",25000.00,"Canada"),("Priti","F",31000.00),("Sham","M",60000.00)	Error Code: 1136. Column count doesn't match value count at row 2	0.000 sec"
-- -------------------------------------------------------------------------------------- --
-- 2) Update the DATA: It is used to modify/update the existing data but we neeed to specify WHERE clause to detect which row should be updated.
-- 	  If there no WHERE, it updates in complete table(all rows).
-- syntax:-> UPDATE tablename
-- 		     SET columnName = values
-- 		   	 WHERE CONDITION;
-- Change salary of "john" to 10000.00
-- 			 UPDATE employees
-- 			 SET salary = 10000.00
-- 			 WHERE ename = "john" */
UPDATE employees
set salary = 10000.00
where ename = "John"; /* -- I GOT THIS ERROR HERE-- 0	22	08:31:22 UPDATE employees
 set salary = 10000.00	Error Code: 1175. You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
 To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.	0.000 sec */
 -- UPDATE EMPLOYEES
 -- SET salary = 10000.00 -- still not working, i think I'm missing something somewhere it should be SYNTAX also.
 -- WHERE country="India";
 
 
-- 3) DELETE the DATA: It is used to delete the existing data but we need to specify WHERE clause to detect whhich row should be deleted. If there is no WHERE, it deletes complete tabale data(all rows).
-- syntax:-> DELETE FROM tableName;
-- 			 WHERE condition;
-- delete details of people whose country is "US"

DELETE FROM employees
WHERE country="India";

select * from employees;
		


