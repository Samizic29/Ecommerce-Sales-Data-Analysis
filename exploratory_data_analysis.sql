/* KPI Metrics */
-- Total Customers
SELECT 
	  COUNT(customer_id) AS total_customers
FROM customers;

-- Total Products
SELECT 
	  COUNT(product_id) AS total_products
FROM products;

-- Total Orders
SELECT 
	  COUNT(order_id) AS total_orders
FROM orders;
-- Total revenue generated
SELECT
	   SUM(total_amount) AS total_revenue
FROM orders;

-- Highest Spending Customer
SELECT 
	   c.customer_id,
       c.name,
       SUM(o.total_amount) AS total_amount_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 1;

-- Best-Selling Product
SELECT 
	   p.product_id,
       p.product_name,
       SUM(o.total_amount) AS total_revenue
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 1;
       
-- Peak Order Month
SELECT 
	   MONTHNAME(order_date) as month_name,
       COUNT(order_id) as total_orders
FROM orders o
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

-- Peak Order Quarter
SELECT 
	   QUARTER(order_date) as quarter_no,
       COUNT(order_id) as total_orders
FROM orders o
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1;

/* Exploratory Data Analysis */
-- Who are the most valuable customers?
SELECT 
	   c.customer_id,
       c.name,
       COUNT(o.order_id) AS orders,
       SUM(o.total_amount) AS total_spent
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY 1,2
ORDER BY 4 DESC
LIMIT 5;

-- Top Revenue-Generating Products
SELECT 
	   p.product_id,
       p.product_name,
       COUNT(o.order_id) AS orders,
       SUM(o.total_amount) AS total_revenue
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY 1,2
ORDER BY 4 DESC
LIMIT 5;

-- Monthly Orders and Revenue Trends
SELECT 
	   MONTH(order_date) AS month_no,
	   MONTHNAME(order_date) AS month_name,
       COUNT(o.order_id) AS orders,
       SUM(o.total_amount) AS total_revenue
FROM orders o
GROUP BY 1,2
ORDER BY 1;

-- Customer with the Widest Product Variety
-- Create CTE (Common Table Expression)
WITH order_products AS (
	SELECT 
	   o.order_id,
       o.customer_id,
       p.product_id,
       p.product_name
	FROM orders o
	LEFT JOIN products p
	ON o.product_id = p.product_id
)

SELECT 
	   c.customer_id,
       c.name,
       COUNT(DISTINCT o.product_id) AS distinct_products
FROM customers c
INNER JOIN order_products o
ON c.customer_id = o.customer_id
GROUP BY 1,2
ORDER BY 3 DESC
LIMIT 3;

-- Top Category by Order and Revenue
SELECT 
       p.category,
       COUNT(o.order_id) AS orders,
       SUM(o.total_amount) AS total_revenue
FROM orders o
INNER JOIN products p
ON o.product_id = p.product_id
GROUP BY 1
ORDER BY 3 DESC;

-- Orders and Revenue by Age Group
SELECT 
	   c.age_group AS age,
       COUNT(o.order_id) AS total_orders,
       SUM(o.total_amount) AS total_revenue
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY 1
ORDER BY 2;

-- Orders and Revenue by Gender
SELECT 
	   c.gender AS gender,
       COUNT(o.order_id) AS orders,
       SUM(o.total_amount) AS total_revenue
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY 1;

-- Top 10 Country with the highest generated revenue and orders
SELECT 
	   c.country,
       COUNT(o.order_id) AS orders,
       SUM(o.total_amount) AS total_revenue
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY 1
ORDER BY 3 DESC
Limit 10;

-- Top Performing Quarter
SELECT 
	   QUARTER(order_date) AS quarter_no,
       COUNT(o.order_id) AS orders,
       SUM(o.total_amount) AS total_revenue
FROM orders o
GROUP BY 1
ORDER BY 1;

-- Customer with the Quickest First Order After Signup
SELECT
	   c.customer_id,
       c.name,
       c.country,
	   c.signup_date,
       o.order_date,
       DATEDIFF(o.order_date, c.signup_date) AS day_no
FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id AND c.signup_date < o.order_date
GROUP BY 1,2,3,4,5
ORDER BY 5,3
LIMIT 1;
