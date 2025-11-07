🚀 SQL SELECT, Logical Operators, Sorting, LIMIT & OFFSET — With Examples & Common Mistakes

Learning SQL is all about practice. While working with a sample table called staff, I explored SELECT queries, logical operators, sorting, LIMIT, and OFFSET. In this blog, I’ll explain each concept with examples, highlight mistakes I made, and show the correct queries with output tables.

📌 Sample Data

Let’s start with a simple staff table:

CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(50),
    staff_role VARCHAR(50),
    staff_age INT,
    staff_salary DECIMAL(10,2)
);

INSERT INTO staff (staff_name, staff_role, staff_age, staff_salary)
VALUES
('Puja', 'Supporter', 21, 25000.00),
('Priti', 'Creator', 23, 31000.00),
('Sham', 'Defender', 30, 60000.00),
('John', 'Creator', 25, 14000.00),
('Bharti', 'Supporter', 22, NULL),
('Shekhar', 'AI/ML Engineer', 28, 28000.00),
('Neha', 'Designer', 20, 20000.00),
('Rahul', 'Creator', 19, 18000.00),
('Suhit', 'Supporter', 24, 22000.00);

🔹 Logical Operators

SQL provides logical operators to combine multiple conditions:

AND / && → True only if both conditions are true

OR / || → True if at least one condition is true

NOT / ! → True if condition is false

XOR → True if exactly one condition is true

✅ Example 1: Employees with role Creator or Defender
SELECT staff_name, staff_salary, staff_role 
FROM staff 
WHERE staff_role = "Creator" OR staff_role = "Defender";

staff_name	staff_salary	staff_role
Priti	31000.00	Creator
Sham	60000.00	Defender
John	14000.00	Creator
Rahul	18000.00	Creator
✅ Example 2: Salary > 40000 AND Age = 21
SELECT staff_name, staff_age, staff_salary 
FROM staff 
WHERE staff_salary > 40000.00 && staff_age = 21;

staff_name	staff_age	staff_salary
Puja	21	70000.00 (after update)

⚠️ Mistake I made:

UPDATE staff SET staff_salary = 70000.00 WHERE staff_name = 'k%';


❌ This doesn’t work because = doesn’t support wildcards.

✅ Correct way:

UPDATE staff SET staff_salary = 70000.00 WHERE staff_name LIKE 'k%';

🔹 Sorting with ORDER BY

We can sort results using ORDER BY.

✅ Example 3: Employees sorted by salary (ascending)
SELECT staff_name, staff_salary 
FROM staff 
WHERE staff_salary > 5000.00 
ORDER BY staff_salary ASC;

staff_name	staff_salary
John	14000.00
Rahul	18000.00
Neha	20000.00
Suhit	22000.00
Puja	25000.00
Shekhar	28000.00
Priti	31000.00
Sham	60000.00
✅ Example 4: Sort by salary (descending) & then name
SELECT staff_name, staff_salary 
FROM staff 
ORDER BY staff_salary DESC, staff_name;

staff_name	staff_salary
Sham	60000.00
Priti	31000.00
Shekhar	28000.00
Puja	25000.00
Suhit	22000.00
Neha	20000.00
Rahul	18000.00
John	14000.00
🔹 LIMIT — Top N Results
✅ Example 5: Top 3 highest-paid employees
SELECT staff_name, staff_salary, staff_role 
FROM staff 
ORDER BY staff_salary DESC 
LIMIT 3;

staff_name	staff_salary	staff_role
Sham	60000.00	Defender
Priti	31000.00	Creator
Shekhar	28000.00	AI/ML Eng.
✅ Example 6: Highest-paid employee
SELECT staff_name, staff_salary, staff_role 
FROM staff 
ORDER BY staff_salary DESC 
LIMIT 1;

staff_name	staff_salary	staff_role
Sham	60000.00	Defender
🔹 OFFSET — Skipping Rows

OFFSET helps skip certain rows before applying LIMIT.

✅ Example 7: Second lowest salary
SELECT staff_id, staff_name, staff_salary 
FROM staff 
ORDER BY staff_salary ASC 
LIMIT 1 OFFSET 1;


Or another syntax:

SELECT staff_id, staff_name, staff_salary 
FROM staff 
ORDER BY staff_salary ASC 
LIMIT 2,1;

staff_id	staff_name	staff_salary
8	Rahul	18000.00
🎯 Key Mistakes I Made

❌ Using = with wildcards ('k%') instead of LIKE.
✅ Fixed with WHERE staff_name LIKE 'k%'.

❌ Forgetting that string comparison in SQL is case-sensitive sometimes.
Always use consistent case in values ('Creator' vs 'creator').

❌ Updating without conditions (risk of updating all rows).
✅ Always use a safe WHERE clause.

📌 Takeaways

Use OR / AND / NOT to combine multiple conditions.

Use ORDER BY for sorting (ASC / DESC).

Use LIMIT to restrict rows and OFFSET to skip rows.

Always double-check UPDATE queries before running them.
