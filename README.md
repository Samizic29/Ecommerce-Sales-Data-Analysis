# Ecommerce-Sales-Data-Analysis-Using-SQL

## By Oyedele Samuel

## Introduction
> In today’s digital era, e-commerce has revolutionized the way people buy and sell products. With just a few clicks, customers from across the globe can shop online from the comfort of their homes, making online retail one of the fastest-growing industries worldwide.
> As the volume of online transactions continues to grow, businesses are generating vast amounts of data daily. Analyzing this data is crucial for understanding customer behavior, optimizing marketing strategies, improving operational efficiency, and ultimately driving sales growth.

## Objective
> To uncover key trends, patterns, and insights in e-commerce sales performance over the past year.

## Data Model
> This is the first crucial step. It’s important to define and organize the tables before importing data. Relationships created between the tables based on key column id.
>  Using **SQL Workbench**, entity relationship diagram was created between customers, products and orders tables.

## Data Preparation
> After data modeling,
- **Forward Engineer** is performed on the data model which convert the data model into an actual database schema.
- **Import Data**: The SQL files are imported and executed to the tables created.

## Data Cleaning
> This process involves removing duplicates, handling missing values, inaccurate and inconsistent data.
-	Check and Remove duplicates
-	Handling Missing Values: perform data imputation where necessary.

## EXPLORATORY DATA ANALYSIS
> To identity trends and pattern in the customer performance behavior, product performance, revenue trends across time.

### Customers and Products Analysis
-	Who are the most valuable customers?
-	Top Revenue-Generating Products.
-	Customers with the Widest Product Variety.
-	Customer with the Quickest First Order After Signup.
-	Top Product Category by Orders and Revenue.
  
### Demographics Analysis
-	Orders and Revenue by Age Group.
-	Orders and Revenue by Gender.
-	Top 10 Country with the highest generated revenue and orders.
  
### Time-Based Trends
-	Monthly Orders and Revenue Trends.
-	Top Performing Quarter.

## Key Insights
💼 Customer Base: The platform has a total of 5,000 customers.
💰 Revenue Overview: A total of $17 million was generated from 7,000 orders.
🏆 Top Spending Customer: Anne-Corinne Mearns is the most valuable customer, spending a total of $23,017.
📦 Top Product & Category: The Monitor is the highest revenue-generating product. Accessories is the top-performing product category in both orders and total revenue.
👥 Demographics of High-Spenders: Most of the top-spending customers are aged above 30, suggesting a strong purchasing power within this demographic.
📅 Time-Based Trends: March recorded the highest number of orders and revenue.

## Conclusion
The uncovered valuable data insights will help the stakeholders to make informed data-driven decisions that can improve marketing strategies, optimize inventory, and enhance customer retention.

### SQL FUNCTIONS USED
- Aggregate functions
- Join functions
- Sub Query / Common Table Expressions (CTE)
- Filter functions
- Date functions

> You can check out the full project documentation here: <a href='###'>Ecommerce Sales Data Analysis</a>

