-- customers table
SELECT *
FROM customers;

-- products table
SELECT *
FROM products;

-- orders table
SELECT *
FROM orders;

/* Data Cleaning */
-- 1. Remove Duplicates
-- Remove duplicates rows based on customer id, product and order id
DELETE 
FROM customers
WHERE customer_id IN (
	SELECT customer_id
    FROM (
		SELECT customer_id, count(*) as count
        FROM customers
        GROUP BY customer_id
        HAVING count > 1
	) duplicates
);

-- Remove duplicates rows based on product id
DELETE 
FROM products
WHERE product_id IN (
	SELECT product_id
    FROM (
		SELECT product_id, count(*) as count
        FROM products
        GROUP BY product_id
        HAVING count > 1
	) dup
);

-- Remove duplicates rows based on order id
DELETE 
FROM orders
WHERE order_id IN (
	SELECT order_id
    FROM (
		SELECT order_id, count(*) as count
        FROM orders
        GROUP BY order_id
        HAVING count > 1
	) dup
);

-- 2. Handling Missing Values
-- Remove rows with missing customer_id, product_id, order_id
DELETE FROM customers WHERE customer_id IS NULL;

DELETE FROM products WHERE product_id IS NULL;

DELETE FROM orders WHERE order_id IS NULL;

-- Check for missing values in the gender, age column for customers table
SELECT count(*) as missing_value
FROM customers
WHERE gender IS NULL;

-- Check for distinct value in gender column
SELECT distinct(gender)
FROM customers;

-- Cleaned the inaccurate data values
UPDATE customers
SET gender = CASE
	WHEN gender = "Genderqueer" THEN "Female"
    WHEN gender = "Bigender" THEN "Male"
    WHEN gender = "Polygender" THEN "Male"
    WHEN gender = "Non-binary" THEN "Male"
    WHEN gender = "Agender" THEN "Female"
    WHEN gender = "Genderfluid" THEN "Female"
    ELSE gender
END; 
   
SELECT count(*) as missing_value
FROM customers
WHERE age IS NULL;

-- Perform Data Imputation using the average on the age column
-- Fill the null values with the average age

-- First, store the average age in a temporary variable
SET @avg_age := (
	SELECT ROUND(AVG(age),0)
    FROM customers
    WHERE age IS NOT NULL
);

-- Update the Nulls with the average age
UPDATE customers
SET age = @avg_age
WHERE age IS NULL;

-- Check the age column
SELECT count(*) as missing_value
FROM customers
WHERE age IS NULL;

-- Check for missing values in the price column for products table
SELECT COUNT(*) as missing_value
FROM products
WHERE price IS NULL;

-- Check for missing values in the total amount column for orders table
SELECT COUNT(*) as missing_value
FROM orders
WHERE total_amount IS NULL;

-- Perform Data Imputation using the average on the total amount column
-- Fill the null values with the total amount

-- First, store the average amount in a temporary variable
SET @avg_amount := (
	SELECT ROUND(AVG(total_amount),0)
    FROM orders
    WHERE total_amount IS NOT NULL
);

-- Update the Nulls with the average amount
UPDATE orders
SET total_amount = @avg_amount
WHERE total_amount IS NULL;

-- Check the total amount column
SELECT COUNT(*) AS missing_value
FROM orders
WHERE total_amount IS NULL;

/* Data Transformation */
-- Create age group from the age column in the customer table

-- Add the new column 'age group'
ALTER TABLE customers
ADD COLUMN age_group varchar(50);

-- Add values using update statement
UPDATE customers
SET age_group = CASE
	WHEN age >= 18 AND age <=30 THEN "Young (18-30)"
    WHEN age > 30 AND age <=50 THEN "Middle (31-50)"
    ELSE "Senior (51+)"
END;

-- Check the age group column
SELECT age, age_group
FROM customers
LIMIT 10;

-- Create name column from first name and last name in the customer table.
-- Add the new column 'name'
ALTER TABLE customers
ADD COLUMN name varchar(255);

-- Concatenate the first name and last name using update statement
UPDATE customers
SET name = CONCAT(first_name, " ", last_name);

-- Check the name column
SELECT name
FROM customers
limit 10;