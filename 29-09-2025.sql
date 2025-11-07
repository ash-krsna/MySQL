/*  Group By: The Group By clause is used to arange the identical data in groups. 
    It can be used with agreegate functions like count(), sum(), max(), min(), avg() etc...
    These function allows us to perform calculation on groups
		syntax :-> 
				SELECT column1, agreegate_function(column2)
                FROM tabble_Name
                GROUP BY column1
*/
-- 	1) Using GROUP BY, print how many defender or creator are existed in staff table.
use soffice;
select staff_role, count(staff_id) from staff group by staff_role;
select staff_role, count(staff_id) as no_of_people from staff group by staff_role; -- with alias name
-- 2) Using GROUP BY, print how many people are have same age.
select staff_age, count(staff_id) as count_of_age from staff group by staff_age;
-- 3) Using GROUP BY, print how many creators and defender in employees table whose salary is greater than 20000
select staff_role, count(staff_id) as count_of_people from staff where staff_salary > 20000.00 group by staff_role;
/* HAVING : Having is the condition that is applied after GROUP BY.
			It is used to filter groups.
*/
-- 4) Print the role whose number of people count is greater than 1
select staff_role as Karya, count(staff_id) as count_of_people from staff group by staff_role having count_of_people > 1; -- here I add alias name to staff_role also as "Karya".
alter table staff add column gender char(1)after staff_name;
UPDATE staff set gender = 'M' where staff_name = "parth";
UPDATE staff set gender = 'F' where staff_name = "radha";

select gender, count(staff_id) as count_of_people from staff where staff_role = "creator" group by gender having count_of_people;
insert into staff (staff_name,gender, staff_age, staff_salary, staff_role) 
 values ("Radhika",'F',21,50000.00,"AI Engineer"); -- i can add multiple rows with this syntax also
 /* Aggregate Functions: These functions are used to perform calculatioins on multiple rows and return a single value per group or per table
	1) COUNT: count is used to count the number of rowws find total how many employees are in ofice
    syntax:-> count(*) as total_employees
    
*/ 
-- find total how many employees are in office
select count(*) as total_employees from staff;
-- 2)SUM: sum is used to return total of numerical column.
-- 	Find the total salary give to all employees.
select sum(staff_salary) from staff;
select staff_role, count(staff_salary), sum(staff_salary) from staff group by staff_role;
-- 3) AVG: avg is used to returns average of a numerical column.
select staff_role, count(staff_salary), sum(staff_salary), avg(staff_salary) from staff group by staff_role;
-- find average salary based on role in staff table
select staff_role, count(gender), avg(staff_salary) from staff where staff_role = "creator" group by staff_role;


select * from staff; 

    
