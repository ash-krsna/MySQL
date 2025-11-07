-- Create database office and use it 
-- create a table staff with details with details staff_id, staff_name, staff_age(should be >18),staff_salary, staff_role. perform following queries
-- 1) insert atleast 5 rows of data
-- 2) update staff_salary as 20000 whos age<25
-- 3) delete staff details whos role is  "developer"
-- create database soffice;
use soffice;
SET SQL_SAFE_UPDATES = 0;

/* create table staff 
(staff_id int Primary key auto_increment,
 staff_name varchar(20),
 staff_age int check(staff_age>18),
 staff_salary decimal(10,2),
 staff_role varchar(20));
 */
 select * from soffice.staff;
 -- inserting 5 rows -- 
 insert into staff values (1,"krsna",21,40000.00,"Creator");
 insert into staff (staff_name,gender, staff_age, staff_salary, staff_role) 
 values ("Akash",21,50000.00,"AI/ML Engineer"),
		("Kanha",21,60000.00,"Creator"),
        ("Radha",19,70000.00,"Supporter"),
        ("Parth",21,50000.00,"Defender"),
        ("Vidur",26,45000.00,"Manager");	
update staff
set staff_salary = 20000.00
where staff_age<25;

delete from staff
where staff_role = "manager";
