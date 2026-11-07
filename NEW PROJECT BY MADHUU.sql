   -- DATABASE PORTFOLIO --
CREATE DATABASE techenova_e_commerce;
USE techenova_e_commerce;

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    city VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock_count INT NOT NULL
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    product_id INT,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    quantity INT NOT NULL,
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- ==========================================
-- DUMMY DATA INSERTION (Testing ke liye)
-- ==========================================

INSERT INTO users (user_name, email, city) VALUES
('Aayush Sharma', 'aayush@gmail.com', 'Indore'),
('Neha Verma', 'neha@gmail.com', 'Nagpur'),
('Rahul Gupta', 'rahul@gmail.com', 'Bhopal'),
('Priya Patel', 'priya@gmail.com', 'Indore'),
('Amit Mishra', 'amit@gmail.com', 'Nagpur');

INSERT INTO products (product_name, category, price, stock_count) VALUES
('Wireless Mouse', 'Electronics', 650.00, 50),
('Mechanical Keyboard', 'Electronics', 2500.00, 20),
('Water Bottle 1L', 'Home & Kitchen', 400.00, 100),
('Running Shoes', 'Footwear', 3200.00, 15),
('Coffee Mug', 'Home & Kitchen', 300.00, 60);


INSERT INTO orders (user_id, product_id, quantity, status) VALUES
(1, 1, 2, 'Delivered'),          -- Aayush ordered 2 Mice
(1, 2, 1, 'Delivered'),          -- Aayush ordered 1 Keyboard
(2, 3, 3, 'Shipped'),            -- Neha ordered 3 Bottles
(3, 4, 1, 'Pending'),            -- Rahul ordered 1 Shoes
(4, 1, 1, 'Delivered'),          -- Priya ordered 1 Mouse
(5, 5, 2, 'Delivered'),          -- Amit ordered 2 Mugs
(2, 4, 1, 'Delivered');          -- Neha ordered 1 Shoes
SELECT 
    o.order_id,
    u.user_name AS customer_name,
    p.product_name,
    p.price,
    o.quantity,
    (o.quantity * p.price) AS total_bill,
    o.status AS order_status
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN products p ON o.product_id = p.product_id;

SELECT 
    u.city,
    COUNT(o.order_id) AS total_orders_placed,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN users u ON o.user_id = u.user_id
JOIN products p ON o.product_id = p.product_id
GROUP BY u.city
HAVING total_revenue > 2000;

WITH Product_Sal AS (
    SELECT 
        product_id, 
        SUM(quantity) AS total_sold
    FROM orders
    GROUP BY product_id
),
Ave_age_Sales AS (
    SELECT AVG(total_sold) AS avg_sold 
    FROM Product_Sal
)
SELECT 
    p.product_name,
    p.category,
    ps.total_sold
FROM Product_Sal ps
JOIN products p ON ps.product_id = p.product_id
CROSS JOIN Ave_age_Sales aag
WHERE ps.total_sold > aag.avg_sold;

WITH Customer_Spending AS (
    SELECT 
        user_id, 
        SUM(quantity * price) AS total_spent
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY user_id
    HAVING total_spent > 4000
)
SELECT 
    u.user_name, 
    u.email, 
    cs.total_spent
FROM Customer_Spending cs
JOIN users u ON cs.user_id = u.user_id;

SELECT 
    product_name, 
    category, 
    stock_count
FROM products
WHERE stock_count < 20;

SELECT 
    order_id,
    quantity,
    status,
    CASE 
        WHEN status = 'Delivered' THEN 'Action Completed'
        WHEN status = 'Shipped' THEN 'In Transit'
        ELSE 'Action Required (Pending)'
    END AS logistics_priority
FROM orders;

SELECT 
    p.category,
    COUNT(o.order_id) AS total_items_sold,
    SUM(o.quantity * p.price) AS category_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue DESC;

SELECT 
    p.category,
    COUNT(o.order_id) AS total_items_sold,
    SUM(o.quantity * p.price) AS category_revenue
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY category_revenue ASC;

SELECT 
 UPPER(user_name) AS user_name FROM users;
 SELECT 
 LOWER(email)AS EMAIL FROM users;
 
 
 WITH Customer_AVG_Spending AS (
    SELECT 
        user_id, 
        AVG(price) AS AVG_PRICE
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY user_id
    HAVING AVG_PRICE >3000
   )
SELECT 
    u.user_name, 
    u.email, 
    cs.AVG_PRICE
FROM Customer_AVG_Spending cs
JOIN users u ON cs.user_id = u.user_id;


WITH Customer_AVG_Spending AS (
    SELECT 
        user_id, 
        MAX(price) AS HIGH_PRICE
    FROM orders o
    JOIN products p ON o.product_id = p.product_id
    GROUP BY user_id
    HAVING HIGH_PRICE >=2000
   )
SELECT 
    u.user_name, 
    u.email, 
    cs.HIGH_PRICE
FROM Customer_AVG_Spending cs
JOIN users u ON cs.user_id = u.user_id;
-- % / 0.25 =!= -- 
 