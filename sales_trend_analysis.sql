-- Task 6: Sales Trend Analysis
-- Dataset: online_sales_large

-- 1️⃣ Monthly Revenue & Order Volume
SELECT
    STRFTIME('%Y', order_date) AS year,
    STRFTIME('%m', order_date) AS month,
    SUM(amount) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales_large
GROUP BY year, month
ORDER BY year, month;

-- 2️⃣ Top 3 Months by Sales
SELECT
    STRFTIME('%Y-%m', order_date) AS month_year,
    SUM(amount) AS monthly_revenue
FROM online_sales_large
GROUP BY month_year
ORDER BY monthly_revenue DESC
LIMIT 3;
