-- select is used for displaying a specific columns or data --
-- OPERATORS :- 
	-- OPERATORS are used to perform operations. Based on operatio, we can divide them as:
    -- 1)Arithmetic Operators: +, -, *, /, %(reminder)
    -- 2)Relational or comparison operators: > , <, >=, <=, =, !=(<>) | SET is also a part of this kind of conditions
		-- betwen... "AND" ----- used for a specific range
        -- "IN"  -- it will matches any value in a list
        -- "LIKE" -- it is used for a pattern
        -- "IS NULL" --  checks for null values 
        -- "IS NOT NULL" -- checks for NOT NULL values
	
    -- DQL(Data Query Language): This commands are used for perform Queries 
		-- Eg. SELECT
		-- SELECT used to select specific columns or data from given table and displays it 
	-- 1) Display all the rows from staff table
	use soffice;
    -- select * from staff; -- # to print whole table
    select staff_name,staff_role from staff; -- # to print particular column from table
    
    -- 2) Display only name and salary columns from employees table
    select * from staff;
    select staff_name,staff_salary from staff;
    -- 3) Display all employees name and salary whose age is greater than 20
    select staff_name,staff_salary from staff where staff_age >20;
    -- 4) Display empoloyees name and salary whos salary is less than or equal to 20000
    select staff_name,staff_salary from staff where staff_salary <= 20000.00;
    -- 5) Display employees name, age and salary whos role is not creator
    select staff_name,staff_salary,staff_age from staff where staff_role != "Creator"; -- we can use != and <> for not equal to condition.
	select staff_name,staff_salary,staff_age from staff where staff_role <> "Creator"; -- also a <> for checking this condition "is not".
    -- 6) Display name and age whose age is between 18 and 21
    select staff_name,staff_age from staff where staff_age > 18 and staff_age < 21;
    -- 7) Display name and salary whose role is in the list of "Creator" or "Supporter"
    select staff_name,staff_salary,staff_role from staff where staff_role ="Creator" or staff_role = "supporter";
    select staff_name,staff_salary,staff_role from staff where staff_role not in ("Defender", "AI/ML Engineer");
    -- 8) Display name, salary whose salary is not null
    -- update staff set staff_salary = where staff_age<25; -- i put it for to update not null salary
    select staff_name,staff_salary from staff where staff_salary is not null;
    -- 9) Display name and salary whose name starts with "P". 
    select staff_name,staff_salary from staff where staff_name like 'p%'; -- it does not matter other letter from the word
    -- 10) Display name and salary whose name ends with "a".
	select staff_name,staff_salary from staff where staff_name like '%a';
    -- 11) Display name and salary whose name second letter should be with "K".
	-- select staff_name,staff_salary from staff where staff_name like '%k%' -- i tried with this condition but it also print a word which starts with letter k also 
    select staff_name,staff_salary from staff where staff_name like '_k%';
    -- select staff_name,staff_salary from staff where staff_name like '_k%' and staff_name like '%h_'; -- here i get only column but why i don't know --> 
    -- 12) Display name and salary whose second last letter is "h".
    select staff_name,staff_salary from staff where staff_name like '%h_';
    


    
    
    
    
    