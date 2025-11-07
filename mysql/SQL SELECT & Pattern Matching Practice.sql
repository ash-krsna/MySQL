SQL SELECT & Pattern Matching Practice

This repository contains examples, explanations, and practice tasks for learning SQL SELECT statements, operators, and pattern matching in MySQL.

1. What is SELECT?

The SELECT statement is part of DQL (Data Query Language).
It is used to query and display data from tables.

Think of it like a “search engine” for your database.
It does not modify data, it only retrieves it.

Basic syntax:

SELECT column1, column2, ...
FROM table_name
WHERE condition;

2. Operators in SQL

Operators are symbols or keywords used to perform operations in queries.

🔢 Arithmetic Operators
Operator	Description
+	Addition
-	Subtraction
*	Multiplication
/	Division
%	Remainder (modulus)
🔍 Relational / Comparison Operators
Operator	Description
>	Greater than
<	Less than
>=	Greater or equal
<=	Less or equal
=	Equal
!=, <>	Not equal
🎯 Special Conditions

BETWEEN … AND → match values in a specific range

IN (…) → match values in a list

NOT IN (…) → exclude values in a list

LIKE → pattern matching with wildcards (% and _)

IS NULL → checks if a column is NULL

IS NOT NULL → checks if a column is not NULL

3. Example: Staff Table

Select all rows:

USE soffice;

SELECT * FROM staff;


Select only specific columns:

SELECT staff_name, staff_role
FROM staff;

4. Common Queries with Explanations
Display name and salary:
SELECT staff_name, staff_salary FROM staff;

Employees with age > 20:
SELECT staff_name, staff_salary
FROM staff
WHERE staff_age > 20;

Salary <= 20000:
SELECT staff_name, staff_salary
FROM staff
WHERE staff_salary <= 20000.00;

Employees role not “Creator”:
-- Using !=
SELECT staff_name, staff_age, staff_salary
FROM staff
WHERE staff_role != 'Creator';

-- Using <>
SELECT staff_name, staff_age, staff_salary
FROM staff
WHERE staff_role <> 'Creator';

Age between 18 and 21 (inclusive):
SELECT staff_name, staff_age
FROM staff
WHERE staff_age BETWEEN 18 AND 21;

Role in a list:
-- Using OR
SELECT staff_name, staff_salary, staff_role
FROM staff
WHERE staff_role = 'Creator' OR staff_role = 'Supporter';

-- Using IN
SELECT staff_name, staff_salary, staff_role
FROM staff
WHERE staff_role IN ('Creator', 'Supporter');

-- Exclude certain roles
SELECT staff_name, staff_salary, staff_role
FROM staff
WHERE staff_role NOT IN ('Defender', 'AI/ML Engineer');

Salary is NOT NULL:
SELECT staff_name, staff_salary
FROM staff
WHERE staff_salary IS NOT NULL;

Name starts with “P”:
SELECT staff_name, staff_salary
FROM staff
WHERE staff_name LIKE 'P%';

Name ends with “a”:
SELECT staff_name, staff_salary
FROM staff
WHERE staff_name LIKE '%a';

Second letter is “K”:
SELECT staff_name, staff_salary
FROM staff
WHERE staff_name LIKE '_k%';


Tip: _ matches exactly one character, % matches any number of characters.

Second-last letter is “h”:
SELECT staff_name, staff_salary
FROM staff
WHERE staff_name LIKE '%h_';

5. Common Mistakes

Using multiple LIKE patterns with AND may return zero rows if no single row satisfies both conditions.

Using > 18 AND < 21 excludes boundary values; prefer BETWEEN 18 AND 21.

Writing UPDATE statements without a value results in syntax errors.

Example Correction:

UPDATE staff
SET staff_salary = 20000
WHERE staff_age < 25;

6. Key Takeaways

SELECT → only retrieves data (no modifications).

Operators are filters inside WHERE.

Start simple (SELECT *) → then filter and use patterns.

Test patterns individually before combining conditions.

Use _ and % carefully for string pattern matching.

7. Practice Tasks

Select all columns and specific columns from staff.

Filter by salary, age, and role.

Use BETWEEN, IN, NOT IN for conditions.

Test IS NULL and IS NOT NULL.

Use LIKE patterns for names: starts with, ends with, second letter, second-last letter.

Combine conditions using AND / OR.

This README is ready for GitHub. You can create a repo like sql-select-pattern-practice, add this README, and push your SQL queries along with sample data for readers to try.

If you want, I can also create a final GitHub repo structure with:

README.md (this content)

queries.sql (all 12 tasks + explanations)

sample_data.sql (example staff table)


------------------------------------(OR)-----------------------------------------------------------

1️⃣ Repository Structure
sql-select-pattern-practice/
│
├── README.md           # Your blog-style explanation, learning notes, and practice tasks
├── queries.sql         # All SQL queries with explanations
└── sample_data.sql     # Sample table creation and data for testing

2️⃣ README.md

Use the GitHub-ready Markdown I created for you in the previous message. It explains concepts, examples, mistakes, key takeaways, and practice tasks.

3️⃣ sample_data.sql
-- Use or create database
CREATE DATABASE IF NOT EXISTS soffice;
USE soffice;

-- Drop table if it already exists
DROP TABLE IF EXISTS staff;

-- Create staff table
CREATE TABLE staff (
    staff_id INT PRIMARY KEY AUTO_INCREMENT,
    staff_name VARCHAR(50) NOT NULL,
    staff_role VARCHAR(50),
    staff_age INT,
    staff_salary DECIMAL(10,2)
);

-- Insert sample data
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

4️⃣ queries.sql
USE soffice;

-- 1. Display all rows
SELECT * FROM staff;

-- 2. Display specific columns
SELECT staff_name, staff_role FROM staff;
SELECT staff_name, staff_salary FROM staff;

-- 3. Employees with age > 20
SELECT staff_name, staff_salary FROM staff WHERE staff_age > 20;

-- 4. Salary <= 20000
SELECT staff_name, staff_salary FROM staff WHERE staff_salary <= 20000.00;

-- 5. Role not 'Creator'
SELECT staff_name, staff_age, staff_salary FROM staff WHERE staff_role != 'Creator';
SELECT staff_name, staff_age, staff_salary FROM staff WHERE staff_role <> 'Creator';

-- 6. Age between 18 and 21
SELECT staff_name, staff_age FROM staff WHERE staff_age BETWEEN 18 AND 21;

-- 7. Role in list
SELECT staff_name, staff_salary, staff_role FROM staff WHERE staff_role = 'Creator' OR staff_role = 'Supporter';
SELECT staff_name, staff_salary, staff_role FROM staff WHERE staff_role IN ('Creator', 'Supporter');
SELECT staff_name, staff_salary, staff_role FROM staff WHERE staff_role NOT IN ('Defender', 'AI/ML Engineer');

-- 8. Salary IS NOT NULL
SELECT staff_name, staff_salary FROM staff WHERE staff_salary IS NOT NULL;

-- 9. Name starts with 'P'
SELECT staff_name, staff_salary FROM staff WHERE staff_name LIKE 'P%';

-- 10. Name ends with 'a'
SELECT staff_name, staff_salary FROM staff WHERE staff_name LIKE '%a';

-- 11. Second letter 'K'
SELECT staff_name, staff_salary FROM staff WHERE staff_name LIKE '_k%';

-- 12. Second-last letter 'h'
SELECT staff_name, staff_salary FROM staff WHERE staff_name LIKE '%h_';
