👉 “MySQL DML Basics (INSERT, UPDATE, DELETE) – Common Mistakes I Made & How You Can Avoid Them”

# MySQL DML Practice – Employees Table

This repo demonstrates **Data Manipulation Language (DML)** commands in MySQL using an `employees` table.

## 📌 Table Structure
```sql
CREATE TABLE employees (
  eid INT PRIMARY KEY AUTO_INCREMENT,
  ename VARCHAR(20) NOT NULL,
  gender CHAR(1),
  salary DECIMAL(10,2),
  country VARCHAR(10) DEFAULT "INDIA"
);

🚀 Commands Demonstrated

INSERT

Single row

Specific columns

Multi-row insert

UPDATE

Updating specific rows

Using WHERE with safe update mode

DELETE

Deleting rows with conditions

Warning about deleting all rows

❌ Common Errors I Encountered

Error Code: 1136 → Column count mismatch in INSERT

Error Code: 1175 → Safe update mode requires key column in WHERE

✅ Correct Examples
-- Insert Multi-row
INSERT INTO employees (ename, gender, salary, country)
VALUES
  ("Puja", "F", 25000.00, "Canada"),
  ("Priti", "F", 31000.00, "India"),
  ("Sham", "M", 60000.00, "India");

-- Update safely
UPDATE employees
SET salary = 10000.00
WHERE eid = 2;

-- Delete with condition
DELETE FROM employees
WHERE country = "India";


📖 Learnings documented on Hashnode
.


---

👉 So now you have **two versions**:  
- **Hashnode blog**: conversational, with mistakes + lessons.  
- **GitHub README**: clean, structured, with examples + errors noted.  

Do you want me to also **make a polished GitHub repo structure (with SQL files + README)** so you can just push it?
