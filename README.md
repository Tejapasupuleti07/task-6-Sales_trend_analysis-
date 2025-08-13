# 📊 Sales Trend Analysis (Task 6 - Data Analyst Internship)

## 📌 Objective
Analyze **monthly revenue** and **order volume** from the `online_sales_large` dataset using SQL aggregation functions.

---

## 🛠 Tools Used
- **SQLite (In-Memory)** via Python
- **Pandas** for CSV handling
- **SQL** for data aggregation and trend analysis

---

## 📂 Dataset
**File:** `online_sales_large.csv`  
**Columns:**
- `order_date` → Date of order (YYYY-MM-DD)
- `amount` → Revenue amount for the order
- `product_id` → Product identifier
- `order_id` → Unique order ID

---

## 🔍 SQL Queries

**1️ Monthly Revenue & Order Volume**
```sql
SELECT 
    STRFTIME('%Y', order_date) AS year,
    STRFTIME('%m', order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales_large
GROUP BY year, month
ORDER BY year, month;


 2. Top 3 Months by Sales

sql
Copy
Edit
SELECT 
    STRFTIME('%Y-%m', order_date) AS month_year,
    SUM(amount) AS monthly_revenue
FROM online_sales_large
GROUP BY month_year
ORDER BY monthly_revenue DESC
LIMIT 3;


 Interview Questions & Answers:
1️.How do you group data by month and year?
Use SQL date functions to extract month and year, then GROUP BY:

sql
Copy
Edit
SELECT 
    STRFTIME('%Y', order_date) AS year,
    STRFTIME('%m', order_date) AS month
FROM table
GROUP BY year, month;

2️.What's the difference between COUNT(*) and COUNT(DISTINCT col)?

COUNT(*) → Counts all rows, including duplicates and NULLs.

COUNT(DISTINCT col) → Counts only unique, non-NULL values in that column.

3️.How do you calculate monthly revenue?
Use SUM() on the revenue column grouped by month and year:

sql
Copy
Edit
SELECT 
    SUM(amount) AS monthly_revenue
FROM table
GROUP BY year, month;

4️.What are aggregate functions in SQL?
Functions that operate on a set of rows and return a single value:

SUM() → Total sum of values

AVG() → Average value

COUNT() → Number of rows

MIN() → Smallest value

MAX() → Largest value

5️.How to handle NULLs in aggregates?

Most aggregate functions ignore NULLs by default.

Use COALESCE(column, 0) to replace NULLs with 0 before aggregation.

6️.What’s the role of ORDER BY and GROUP BY?

GROUP BY → Combines rows with the same values into summary rows.

ORDER BY → Sorts the output in ascending (ASC) or descending (DESC) order.

7️.How do you get the top 3 months by sales?
Sort by total revenue in descending order and limit to 3 rows:

SELECT 
    STRFTIME('%Y-%m', order_date) AS month_year,
    SUM(amount) AS monthly_revenue
FROM table
GROUP BY month_year
ORDER BY monthly_revenue DESC
LIMIT 3;
