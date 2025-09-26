# SQL-for-Data-Analysis-Task-4
dataset  link (sqlite) - https://www.kaggle.com/datasets/terencicp/e-commerce-dataset-by-olist-as-an-sqlite-database
# Task 4: SQL for Data Analysis

## Objective
To use SQL queries to extract, analyze, and manipulate data from an E-commerce database, demonstrating proficiency in core SQL commands required for data analysis.

## Tools and Environment
* **Database System:** SQLite
* **GUI Tool:** DB Browser for SQLite
* **Deliverables:** queries.sql file and output screenshots.

## Queries & Analysis Summary

This task required writing and executing SQL queries based on the provided guide. All queries are contained in the `queries.sql` file.

| Task Hint | Description | Example Query Used |
| :--- | :--- | :--- |
| **SELECT, WHERE, ORDER BY** | Basic data retrieval, filtering, and sorting results (e.g., finding orders over a specific value, or listing products alphabetically). | Queries 1.1 - 1.4 |
| **GROUP BY** | Used to aggregate data, such as calculating the total revenue for each payment type to determine the most common method. | Query 1.5 |
| **JOINS** (INNER, LEFT) | Combined related tables (`orders` and `order_reviews`, or `products` and `order_items`) to link information and perform analysis across the database. | Queries 3.1 - 3.2 |
| **Aggregate Functions** | Used `SUM()`, `AVG()`, and `COUNT()` to summarize large datasets into KPIs like Total Revenue and Average Review Score. | Queries 2.1 - 2.3 |
| **Subqueries** | Used a simple subquery to identify a specific group of customers (e.g., those who placed an order after a certain date). | Query 4.1 |
| **VIEWS** | Created a reusable virtual table (`CustomerOrderView`) to simplify future analysis that requires both customer and order details. | Query 5.1 |
| **Optimization** | *(Note: Optimization techniques like adding indexes were considered but not executable as queries, as this is a database administration task.)* | N/A |

## Submission
The final submission includes the SQL query file, the database file used for testing, and a PDF document containing the output screenshots for each executed query.
