# 🔗 Aggregate Functions (MAX, MIN, GROUP_CONCAT) and JOINS in MySQL

In our previous article, we learned about `GROUP BY`, `HAVING`, and basic aggregate functions (`COUNT`, `SUM`, `AVG`).

Today, we’ll move forward with:

* More **aggregate functions**: `MAX`, `MIN`, `GROUP_CONCAT`
* An introduction to **JOINS**

Let’s explore with practical examples.

---

## 🔹 MAX() – Find the Highest Value

The `MAX()` function returns the **largest value** in a column.

📌 Example: Find the highest salary paid, grouped by gender.

```sql
SELECT gender, MAX(staff_salary) AS highest_salary
FROM staff
GROUP BY gender;
```

🔎 Output (sample):

| gender | highest_salary |
| ------ | -------------- |
| M      | 70000          |
| F      | 100000         |

---

## 🔹 MIN() – Find the Lowest Value

The `MIN()` function returns the **lowest value** in a column.

📌 Example: Find the lowest salary grouped by gender.

```sql
SELECT gender, MIN(staff_salary) AS lowest_salary
FROM staff
GROUP BY gender;
```

🔎 Output:

| gender | lowest_salary |
| ------ | ------------- |
| M      | 20000         |
| F      | 50000         |

---

## 🔹 GROUP_CONCAT() – Combine Values in a Group

The `GROUP_CONCAT()` function returns a **concatenated string of values** in a group.

📌 Example: Display number of people based on gender, along with their names.

```sql
SELECT gender, COUNT(staff_id) AS total_people, GROUP_CONCAT(staff_name) AS names
FROM staff
GROUP BY gender;
```

🔎 Output:

| gender | total_people | names            |
| ------ | ------------ | ---------------- |
| M      | 3            | Parth,Kanha,Ravi |
| F      | 2            | Radha,Radhika    |

---

## 🔹 JOINS in MySQL

Real-world databases are not limited to a single table. Data is often spread across multiple related tables.

👉 **JOINs** allow us to combine data from two or more tables.

📌 Types of Joins in MySQL:

1. **INNER JOIN** – shows only rows common in both tables.
2. **LEFT JOIN** – shows all rows from left table + matched rows from right table.
3. **RIGHT JOIN** – shows all rows from right table + matched rows from left table.
4. **FULL OUTER JOIN** – shows all rows from both tables (not directly supported in MySQL, but can be emulated).
5. **SELF JOIN** – joining a table with itself.

---

### 🏪 Example Database: `shop`

We created two tables: **customers** and **orders**.

```sql
CREATE DATABASE shop;
USE shop;

CREATE TABLE customers(
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(20) NOT NULL,
  age INT CHECK(age>=12),
  country VARCHAR(20) NOT NULL DEFAULT "India"
);

CREATE TABLE orders(
  order_id INT PRIMARY KEY,
  item VARCHAR(20) NOT NULL,
  amount INT NOT NULL,
  cust_id INT,
  FOREIGN KEY(cust_id) REFERENCES customers(customer_id)
);
```

📌 Inserted data:

```sql
-- Customers
INSERT INTO customers VALUES
(101,'Kanha',21,'India'),
(102,'Govind',20,'Vrindavan'),
(103,'Radha',19,'Braj'),
(104,'Himalya',30,'Himalaya'),
(105,'Krishn',21,'Dwarka'),
(106,'Bhishm',25,'Hastinapur'),
(107,'Radhika',18,'Barsana');

-- Orders
INSERT INTO orders VALUES
(11,'iPhone',129000,101),
(12,'MacBook',250000,102),
(13,'Camera',300000,103),
(14,'Osmo',35000,104),
(15,'GoPro',18700,105),
(16,'iPad',90000,106),
(17,'Osmo Pocket 3',45000,107);
```

---

### ✅ INNER JOIN Example

**Task**: Retrieve customer ID, name, purchased item, and amount.

```sql
SELECT cust.customer_id,
       cust.customer_name,
       ord.item,
       ord.amount
FROM customers AS cust
INNER JOIN orders AS ord
ON cust.customer_id = ord.cust_id;
```

🔎 Output (with our sample data):

| customer_id | customer_name | item          | amount |
| ----------- | ------------- | ------------- | ------ |
| 101         | Kanha         | iPhone        | 129000 |
| 102         | Govind        | MacBook       | 250000 |
| 103         | Radha         | Camera        | 300000 |
| 104         | Himalya       | Osmo          | 35000  |
| 105         | Krishn        | GoPro         | 18700  |
| 106         | Bhishm        | iPad          | 90000  |
| 107         | Radhika       | Osmo Pocket 3 | 45000  |

💡 This shows only the customers who have **placed an order** (matched rows).

---

## 🔑 Key Takeaways

* `MAX()` → highest value
* `MIN()` → lowest value
* `GROUP_CONCAT()` → combine values from multiple rows
* **JOINs** allow combining multiple related tables
* `INNER JOIN` returns only the matching rows

---

## 📝 Practice Tasks

1. Find the **highest salary** among staff.
2. Find the **minimum salary** for each role.
3. List all employees with the **same gender**, grouped together.
4. Insert sample customers and orders, then:

   * Display customers and their orders using **INNER JOIN**.
   * Find customers who spent more than `40000`.
   * Count how many orders each customer placed.

---

👉 In the next part, we’ll cover **LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN** with practical use cases 🚀
