-- TASK -- 
-- 1) create a tbale named "employees" with eid, ename,role. use proper datatypes and eid is primary key and auto incremented. enmae should not be empty.alter
-- 2) add columns 'gender' and 'salary'. gender should be after ename. salary should be at last 
-- 3) change the name of 'role' to 'erole'
-- 4) delete the column "erole"
-- 5) change the name of table "employees" to "emp"
-- 6) delete the table "emmp"
-- PERFORM ALL THESE IN "office db" 
create database officedb;
use officedb;
create table employees (eid int primary key auto_increment, 
ename varchar(20) not null);
alter table employees
add column gender char(1) after ename;
alter table employees
add column salary int;
alter table employees
add column role varchar(20) after gender;
alter table employees
rename column role to erole;
alter table employees
drop column erole;

rename table employees to emp;
select * from emp;
drop table emp;
