-- SALES ANALYSIS PROJECT --
CREATE DATABASE SALES_ANALYSIS;


-- CREATING FIRST TABLE OF CUSTOMERS--
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30)
);

-- CREATING SECOND TABLE OF PRODUCTS --
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2)
);

-- CREATING THIRD TABLE SALES --
CREATE TABLE sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


-- INSERTING DATA INTO CUSTOMERS --
INSERT INTO customers VALUES
(1, 'Amit', 'Mumbai'),
(2, 'Sneha', 'Pune'),
(3, 'Rahul', 'Delhi');

-- INSERTING DATA INTO PRODUCTS --
INSERT INTO products VALUES
(101, 'Laptop', 'Electronics', 55000),
(102, 'Mouse', 'Electronics', 500),
(103, 'Chair', 'Furniture', 2500);

-- INSERT DATA INTO SALES --
INSERT INTO sales VALUES
(1, 1, 101, 1, '2025-01-01'),
(2, 1, 102, 2, '2025-01-02'),
(3, 2, 103, 1, '2025-01-03'),
(4, 3, 101, 1, '2025-01-05'),
(5, 2, 102, 3, '2025-01-07');

-- TOTAL REVENUE --
SELECT SUM(p.price * s.quantity) AS total_revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id;

-- REVENUE BY PRODUCT --
SELECT p.product_name,
       SUM(p.price * s.quantity) AS revenue
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.product_name;

-- TOP CUSTOMER BY SPENDING --
SELECT c.customer_name,
       SUM(p.price * s.quantity) AS total_spent
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 1;
