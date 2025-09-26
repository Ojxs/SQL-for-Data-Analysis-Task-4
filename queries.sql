-- SQL Queries for Data Analysis Task

-- Section 1: Basic Queries (SELECT, WHERE, ORDER BY, GROUP BY)

-- Query 1.1: SELECT
-- Select all columns from the 'products' table.
SELECT
  *
FROM
  products;

-- Query 1.2: SELECT with specific columns
-- Select the 'product_id' and 'product_category_name' from the 'products' table.
SELECT
  product_id,
  product_category_name
FROM
  products;

-- Query 1.3: WHERE
-- Find all orders that have a payment value greater than 500.
SELECT
  *
FROM
  order_payments
WHERE
  payment_value > 500;

-- Query 1.4: ORDER BY
-- List all products by their product name in alphabetical order.
SELECT
  product_id,
  product_category_name
FROM
  products
ORDER BY
  product_category_name ASC;

-- Query 1.5: GROUP BY
-- Calculate the total payment value for each type of payment.
SELECT
  payment_type,
  SUM(payment_value) AS TotalPaymentValue
FROM
  order_payments
GROUP BY
  payment_type;

-- Query 1.6: GROUP BY with HAVING
-- Find payment types that have a total payment value greater than 100,000.
SELECT
  payment_type,
  SUM(payment_value) AS TotalPaymentValue
FROM
  order_payments
GROUP BY
  payment_type
HAVING
  TotalPaymentValue > 100000;


--------------------------------------------------------------------------------
-- Section 2: Aggregate Functions (SUM, AVG, COUNT)

-- Query 2.1: SUM
-- Calculate the total revenue from all orders.
SELECT
  SUM(payment_value) AS TotalRevenue
FROM
  order_payments;

-- Query 2.2: AVG
-- Find the average review score for all products.
SELECT
  AVG(review_score) AS AverageReviewScore
FROM
  order_reviews;

-- Query 2.3: COUNT
-- Count the total number of orders.
SELECT
  COUNT(order_id) AS TotalOrders
FROM
  orders;


--------------------------------------------------------------------------------
-- Section 3: JOINS (INNER, LEFT, RIGHT)

-- Query 3.1: INNER JOIN
-- Join the 'orders' table with the 'order_reviews' table to find the review score for each order.
SELECT
  o.order_id,
  o.customer_id,
  r.review_score
FROM
  orders AS o
  INNER JOIN order_reviews AS r ON o.order_id = r.order_id;

-- Query 3.2: LEFT JOIN
-- Join the 'products' table with 'order_items' to see how many times each product has been sold.
-- This includes products that have not been sold yet.
SELECT
  p.product_id,
  p.product_category_name,
  COUNT(oi.order_item_id) AS TimesSold
FROM
  products AS p
  LEFT JOIN order_items AS oi ON p.product_id = oi.product_id
GROUP BY
  p.product_id,
  p.product_category_name
ORDER BY
  TimesSold DESC;


--------------------------------------------------------------------------------
-- Section 4: Subqueries

-- Query 4.1: Simpler Subquery
-- Find all customers who placed an order after January 1st, 2018.

SELECT
  customer_id,
  customer_unique_id,
  customer_city
FROM
  customers
WHERE
  customer_id IN (
    -- Subquery: Find the list of customer IDs that placed an order after a certain date
    SELECT DISTINCT
      customer_id
    FROM
      orders
    WHERE
      order_purchase_timestamp > '2018-01-01 00:00:00'
  )
LIMIT 10;


--------------------------------------------------------------------------------
-- Section 5: Creating a View for Analysis

-- Query 5.1: Create a VIEW
-- Create a view that combines customer and order information for future analysis.
CREATE VIEW CustomerOrderView AS
SELECT
  c.customer_unique_id,
  c.customer_city,
  c.customer_state,
  o.order_id,
  o.order_purchase_timestamp
FROM
  customers AS c
  INNER JOIN orders AS o ON c.customer_id = o.customer_id;

-- Now, you can query your new view just like a regular table.
SELECT
  *
FROM
  CustomerOrderView
WHERE
  customer_state = 'SP'
LIMIT 10;