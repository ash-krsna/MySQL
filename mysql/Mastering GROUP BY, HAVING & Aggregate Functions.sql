# 📊 Mastering GROUP BY, HAVING & Aggregate Functions in MySQL

When working with databases, we often need to **summarize data**—like counting employees in each department, finding the total salary paid, or checking which age group has the most employees.

In MySQL, this is achieved with:

* **GROUP BY** → groups rows with the same values into summary rows.
* **HAVING** → filters groups after grouping.
* **Aggregate Functions** → perform calculations on groups (`COUNT`, `SUM`, `AVG`, `MAX`, `MIN`).

Let’s explore these step by step with examples on a `staff` table.

---

## 🔹 GROUP BY Clause

The **GROUP BY** clause arranges identical data into groups. It is most powerful when combined with aggregate functions.

📌 **Syntax**:

```sql
SELECT column1, AGGREGATE_FUNCTION(column2)
FROM table_name
GROUP BY column1;
```

---

### ✅ Example 1: Count how many employees exist for each role

```sql
SELECT staff_role, COUNT(staff_id) 
FROM staff 
GROUP BY staff_role;
```

🔎 Output (sample):

| staff_role | count(staff_id) |
| ---------- | --------------- |
| Creator    | 3               |
| Defender   | 2               |
| Supporter  | 1               |

---

### ✅ Example 2: Count employees by age

```sql
SELECT staff_age, COUNT(staff_id) AS count_of_age 
FROM staff 
GROUP BY staff_age;
```

🔎 Output:

| staff_age | count_of_age |
| --------- | ------------ |
| 21        | 2            |
| 25        | 1            |
| 27        | 3            |

---

### ✅ Example 3: Count employees by role with salary > 20000

```sql
SELECT staff_role, COUNT(staff_id) AS count_of_people 
FROM staff 
WHERE staff_salary > 20000.00 
GROUP BY staff_role;
```

---

## 🔹 HAVING Clause

The **HAVING** clause is like `WHERE`, but it is used for **groups**, not rows.

📌 Example:

```sql
SELECT staff_role, COUNT(staff_id) AS count_of_people 
FROM staff 
GROUP BY staff_role 
HAVING count_of_people > 1;
```

🔎 Output:

| staff_role | count_of_people |
| ---------- | --------------- |
| Creator    | 3               |
| Defender   | 2               |

💡 **Mistake Fixed**: Earlier you wrote `having count_of_people;` which is incomplete. The correct form is `HAVING count_of_people > 1`.

---

### ✅ Example 4: Group creators by gender

```sql
SELECT gender, COUNT(staff_id) AS count_of_people 
FROM staff 
WHERE staff_role = "creator" 
GROUP BY gender 
HAVING count_of_people > 0;
```

---

## 🔹 Aggregate Functions

Aggregate functions help in calculations over groups.

---

### 1) **COUNT** → Count rows

```sql
SELECT COUNT(*) AS total_employees 
FROM staff;
```

Output:

| total_employees |
| --------------- |
| 6               |

---

### 2) **SUM** → Total salary

```sql
SELECT SUM(staff_salary) AS total_salary 
FROM staff;
```

Output:

| total_salary |
| ------------ |
| 250000       |

---

### 3) **AVG** → Average salary by role

```sql
SELECT staff_role, COUNT(staff_salary), SUM(staff_salary), AVG(staff_salary) 
FROM staff 
GROUP BY staff_role;
```

Output:

| staff_role | count | sum   | avg   |
| ---------- | ----- | ----- | ----- |
| Creator    | 3     | 90000 | 30000 |
| Defender   | 2     | 70000 | 35000 |
| Supporter  | 1     | 30000 | 30000 |

---

## 🔹 INSERT and UPDATE Reminders

* Add a new gender column:

```sql
ALTER TABLE staff ADD COLUMN gender CHAR(1) AFTER staff_name;
```

* Update rows with gender:

```sql
UPDATE staff SET gender = 'M' WHERE staff_name = "Parth";
UPDATE staff SET gender = 'F' WHERE staff_name = "Radha";
```

* Insert a new row:

```sql
INSERT INTO staff (staff_name, gender, staff_age, staff_salary, staff_role)  
VALUES ("Radhika",'F',21,50000.00,"AI Engineer");
```

---

## 🔑 Key Takeaways

* `GROUP BY` groups similar data together.
* `HAVING` is used for filtering after grouping.
* `COUNT`, `SUM`, `AVG`, `MAX`, `MIN` are powerful tools for summarizing data.
* Always use **`HAVING`** with aggregate functions, not `WHERE`.

---

## 📝 Practice Tasks for You

1. Find how many employees exist for each gender.
2. Find average salary of employees grouped by age.
3. Find roles where more than 2 employees exist.
4. Find the highest salary among creators.
5. Count total employees who earn more than 40000.

---

👉 With these, you’re one step closer to mastering **data analysis with MySQL** 🚀
