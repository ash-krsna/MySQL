use soffice;
select * from staff;
select staff_name,staff_age from staff where staff_role = "Creator" or staff_role = "defender"; -- we can use (OR) and (||) also
select staff_name,staff_age from staff where staff_salary<>20000.00;
UPDATE staff set staff_salary = 70000.00 where staff_name = 'k%';
UPDATE staff set staff_salary = 80000.00 where staff_name = 'kanha';
UPDATE staff set staff_salary = 100000.00 where staff_name = 'radha';
-- ------------------------------------------------------------------------------------------------ --
-- LOGICAL OPERATORS:- This operators are used to combine multiple conditions such as_
	-- Logical and(AND / &&) -> True only if both conditions are true 
    -- or 
    -- NOT(!) -> True if condition results false
    -- XOR -> Ture if exaclty one condition is true
-- Write a Query to retive/get name and salary and role who role is creator or defender.
select staff_name,staff_salary,staff_role from staff where staff_role = "creator" or staff_role= "defender";

-- Write a Query to retrive/get name, age, salary whose salary is greater than 40000 and age is 21
select staff_name,staff_age,staff_salary from staff where staff_salary > 40000.00 && staff_age = 21;

-- Sort :- sort is used to sort out the results either in ascending order or descending order.
		-- For sorting in MySQL we will use "ORDER BY".
	-- syntax :- select columns from table_name where condition ORDER BY column asc/desc
    -- 14) Print/Display employees details according to their salaries in increasing order.
    select staff_name from staff where staff_salary > 5000.00 order by staff_salary desc;
	select staff_name,staff_salary from staff where staff_salary > 5000.00 order by staff_salary asc;
	select staff_name,staff_salary from staff where staff_salary > 5000.00 order by staff_salary desc;
	select staff_name,staff_salary from staff where staff_salary > 5000.00 order by staff_salary desc, staff_name;	
    -- 15) Display employees details whose role is creator or defender with their names in aplhabetical order
	select staff_name from staff where staff_role = "creator" or staff_role = "defender" order by staff_name asc;
   -- LIMIT: It is used to restrict number of rows in the result
   -- syntax:-> LIMIT numberr
   -- 16) Display top three highest paid employees names and salary
	select staff_name,staff_salary,staff_role from staff where staff_salary order by staff_salary desc limit 3;
    -- 17) Display the highest paid employee name and salary.
	select staff_name,staff_salary,staff_role from staff where staff_salary order by staff_salary desc limit 1;
	select staff_name,staff_salary,staff_role from staff where staff_salary order by staff_salary desc limit 3;
    
    -- OFFSET : It is used to skip certain rows before LIMIT
    -- syntax:-> OFFSET number;
    -- 18) Display employees name, id and salary whose salary is second lowest
    select staff_id,staff_name,staff_salary from staff where staff_salary order by staff_salary asc limit 1 offset 1 -- here offset is skipping first lowest and limit is printing remember one who is second lowest in list or table 
    select staff_id,staff_name,staff_salary from staff where staff_salary order by staff_salary limit 2,1;
    
    
        

