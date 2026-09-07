CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
SHOW DATABASES;

-- ============================================
-- E-COMMERCE SALES & CUSTOMER ANALYTICS SYSTEM
-- Database: ecommerce_analytics
-- ============================================

USE ecommerce_analytics;


-- ============================================
-- 1. CATEGORIES TABLE
-- ============================================

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);


-- ============================================
-- 2. CUSTOMERS TABLE
-- ============================================

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50),
    state VARCHAR(50),
    registration_date DATE NOT NULL
);


-- ============================================
-- 3. PRODUCTS TABLE
-- ============================================

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,

    CONSTRAINT fk_product_category
        FOREIGN KEY (category_id)
        REFERENCES Categories(category_id),

    CONSTRAINT chk_product_price
        CHECK (price > 0),

    CONSTRAINT chk_product_stock
        CHECK (stock_quantity >= 0)
);


-- ============================================
-- 4. ORDERS TABLE
-- ============================================

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_order_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT chk_order_amount
        CHECK (total_amount >= 0),

    CONSTRAINT chk_order_status
        CHECK (order_status IN
        ('Pending', 'Shipped', 'Completed', 'Cancelled'))
);


-- ============================================
-- 5. ORDER_ITEMS TABLE
-- ============================================

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    CONSTRAINT fk_orderitem_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    CONSTRAINT fk_orderitem_product
        FOREIGN KEY (product_id)
        REFERENCES Products(product_id),

    CONSTRAINT chk_orderitem_quantity
        CHECK (quantity > 0),

    CONSTRAINT chk_orderitem_price
        CHECK (unit_price > 0)
);


-- ============================================
-- 6. PAYMENTS TABLE
-- ============================================

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(30) NOT NULL,
    payment_status VARCHAR(20) NOT NULL,
    payment_date DATE NOT NULL,

    CONSTRAINT fk_payment_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    CONSTRAINT chk_payment_method
        CHECK (payment_method IN
        ('UPI', 'Credit Card', 'Debit Card',
         'Net Banking', 'Cash on Delivery')),

    CONSTRAINT chk_payment_status
        CHECK (payment_status IN
        ('Success', 'Failed', 'Pending'))
);


-- ============================================
-- 7. REVIEWS TABLE
-- ============================================

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT NOT NULL,
    review_text VARCHAR(500),
    review_date DATE NOT NULL,

    CONSTRAINT fk_review_customer
        FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),

    CONSTRAINT fk_review_product
        FOREIGN KEY (product_id)
        REFERENCES Products(product_id),

    CONSTRAINT chk_review_rating
        CHECK (rating BETWEEN 1 AND 5)
);

SHOW TABLES;
DESCRIBE Customers;
DESCRIBE Products;

SELECT
    TABLE_NAME,
    COLUMN_NAME,
    CONSTRAINT_NAME,
    REFERENCED_TABLE_NAME,
    REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA = 'ecommerce_analytics'
AND REFERENCED_TABLE_NAME IS NOT NULL;

USE ecommerce_analytics;

INSERT INTO Categories (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Fashion'),
(3, 'Home & Kitchen'),
(4, 'Books'),
(5, 'Beauty'),
(6, 'Sports'),
(7, 'Grocery'),
(8, 'Footwear'),
(9, 'Accessories'),
(10, 'Toys');
SELECT * FROM Categories;

INSERT INTO Customers
(customer_id, first_name, last_name, email, phone, city, state, registration_date)
VALUES
(1, 'Arun', 'Kumar', 'arun.kumar1@gmail.com', '9876500001', 'Chennai', 'Tamil Nadu', '2025-01-15'),
(2, 'Priya', 'Sharma', 'priya.sharma2@gmail.com', '9876500002', 'Coimbatore', 'Tamil Nadu', '2025-01-20'),
(3, 'Rahul', 'Das', 'rahul.das3@gmail.com', '9876500003', 'Bangalore', 'Karnataka', '2025-02-05'),
(4, 'Divya', 'Rajan', 'divya.rajan4@gmail.com', '9876500004', 'Madurai', 'Tamil Nadu', '2025-02-18'),
(5, 'Karthik', 'Mohan', 'karthik.mohan5@gmail.com', '9876500005', 'Hyderabad', 'Telangana', '2025-03-02');
SELECT * FROM Customers;

USE ecommerce_analytics;

INSERT INTO Products
(product_id, product_name, category_id, price, stock_quantity)
VALUES
(1, 'Wireless Headphones', 1, 2499.00, 50),
(2, 'Bluetooth Speaker', 1, 1899.00, 35),
(3, 'Smart Watch', 1, 3999.00, 25),
(4, 'USB-C Charger', 1, 899.00, 80),
(5, 'Power Bank', 1, 1499.00, 60),
(6, 'Wireless Mouse', 1, 799.00, 100),
(7, 'Mechanical Keyboard', 1, 3499.00, 40),
(8, 'Laptop Stand', 1, 1299.00, 45),
(9, 'Webcam', 1, 2299.00, 30),
(10, 'Portable SSD', 1, 6499.00, 20),

(11, 'Cotton T-Shirt', 2, 699.00, 120),
(12, 'Formal Shirt', 2, 1299.00, 80),
(13, 'Denim Jeans', 2, 1999.00, 65),
(14, 'Kurti', 2, 999.00, 90),
(15, 'Casual Dress', 2, 1799.00, 55),
(16, 'Hoodie', 2, 1599.00, 70),
(17, 'Track Pants', 2, 1199.00, 75),
(18, 'Saree', 2, 2499.00, 45),
(19, 'Jacket', 2, 2999.00, 35),
(20, 'Ethnic Wear Set', 2, 2199.00, 40),

(21, 'Non-Stick Frying Pan', 3, 1499.00, 50),
(22, 'Electric Kettle', 3, 1799.00, 40),
(23, 'Mixer Grinder', 3, 3499.00, 30),
(24, 'Dinner Set', 3, 2499.00, 35),
(25, 'Water Bottle', 3, 599.00, 100),
(26, 'Storage Container Set', 3, 899.00, 70),
(27, 'Air Fryer', 3, 4999.00, 25),
(28, 'Cookware Set', 3, 3999.00, 20),
(29, 'Coffee Maker', 3, 2999.00, 30),
(30, 'Kitchen Scale', 3, 799.00, 60),

(31, 'The Alchemist', 4, 399.00, 80),
(32, 'Atomic Habits', 4, 599.00, 100),
(33, 'Rich Dad Poor Dad', 4, 499.00, 90),
(34, 'The Psychology of Money', 4, 549.00, 75),
(35, 'Ikigai', 4, 399.00, 85),
(36, 'Clean Code', 4, 899.00, 45),
(37, 'Java Programming', 4, 749.00, 60),
(38, 'Database System Concepts', 4, 999.00, 35),
(39, 'Computer Networks', 4, 699.00, 50),
(40, 'Operating System Concepts', 4, 1099.00, 30),

(41, 'Face Wash', 5, 349.00, 100),
(42, 'Moisturizer', 5, 499.00, 90),
(43, 'Sunscreen', 5, 599.00, 120),
(44, 'Lip Balm', 5, 199.00, 150),
(45, 'Face Serum', 5, 799.00, 75),
(46, 'Shampoo', 5, 449.00, 110),
(47, 'Conditioner', 5, 399.00, 95),
(48, 'Body Lotion', 5, 499.00, 85),
(49, 'Perfume', 5, 1299.00, 60),
(50, 'Makeup Kit', 5, 1599.00, 45),

(51, 'Running Shoes', 6, 2999.00, 55),
(52, 'Yoga Mat', 6, 899.00, 80),
(53, 'Cricket Bat', 6, 2499.00, 30),
(54, 'Football', 6, 999.00, 60),
(55, 'Badminton Racket', 6, 1799.00, 45),
(56, 'Dumbbells Set', 6, 1999.00, 40),
(57, 'Skipping Rope', 6, 399.00, 100),
(58, 'Tennis Ball Set', 6, 499.00, 75),
(59, 'Gym Gloves', 6, 699.00, 65),
(60, 'Sports Water Bottle', 6, 599.00, 90),

(61, 'Basmati Rice 5kg', 7, 699.00, 100),
(62, 'Wheat Flour 5kg', 7, 399.00, 120),
(63, 'Cooking Oil 1L', 7, 179.00, 150),
(64, 'Green Tea', 7, 299.00, 80),
(65, 'Coffee Powder', 7, 449.00, 90),
(66, 'Breakfast Cereal', 7, 349.00, 100),
(67, 'Organic Honey', 7, 499.00, 70),
(68, 'Dry Fruits Pack', 7, 799.00, 60),
(69, 'Pasta Pack', 7, 199.00, 130),
(70, 'Chocolate Box', 7, 499.00, 95),

(71, 'Running Sneakers', 8, 2799.00, 50),
(72, 'Formal Shoes', 8, 2499.00, 45),
(73, 'Casual Sneakers', 8, 2199.00, 60),
(74, 'Sandals', 8, 999.00, 80),
(75, 'Flip Flops', 8, 499.00, 120),
(76, 'Leather Shoes', 8, 3499.00, 30),
(77, 'Sports Shoes', 8, 2999.00, 40),
(78, 'Loafers', 8, 2299.00, 35),
(79, 'Heels', 8, 1999.00, 50),
(80, 'Ethnic Footwear', 8, 1299.00, 65),

(81, 'Leather Wallet', 9, 999.00, 70),
(82, 'Backpack', 9, 1599.00, 60),
(83, 'Sunglasses', 9, 1299.00, 80),
(84, 'Wrist Watch', 9, 2499.00, 45),
(85, 'Belt', 9, 799.00, 90),
(86, 'Travel Bag', 9, 1999.00, 40),
(87, 'Phone Case', 9, 499.00, 150),
(88, 'Keychain', 9, 199.00, 200),
(89, 'Card Holder', 9, 599.00, 100),
(90, 'Laptop Bag', 9, 1899.00, 50),

(91, 'Building Blocks', 10, 899.00, 70),
(92, 'Remote Control Car', 10, 1499.00, 50),
(93, 'Puzzle Set', 10, 599.00, 90),
(94, 'Board Game', 10, 1299.00, 60),
(95, 'Educational Robot', 10, 2499.00, 30),
(96, 'Toy Kitchen Set', 10, 999.00, 55),
(97, 'Stuffed Teddy Bear', 10, 799.00, 80),
(98, 'Art & Craft Kit', 10, 699.00, 100),
(99, 'Toy Train Set', 10, 1599.00, 40),
(100, 'Kids Musical Toy', 10, 1199.00, 65);
SELECT COUNT(*) AS total_products
FROM Products;
SELECT * FROM Products;

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.price,
    p.stock_quantity
FROM Products p
JOIN Categories c
    ON p.category_id = c.category_id
ORDER BY p.product_id;

#creation of 500 customers
USE ecommerce_analytics;
SET SESSION cte_max_recursion_depth = 1000;
INSERT INTO Customers
(customer_id, first_name, last_name, email, phone, city, state, registration_date)
WITH RECURSIVE numbers AS (
    SELECT 6 AS n
    UNION ALL
    SELECT n + 1
    FROM numbers
    WHERE n < 500
)
SELECT
    n,
    CASE
        WHEN n % 10 = 0 THEN 'Arun'
        WHEN n % 10 = 1 THEN 'Priya'
        WHEN n % 10 = 2 THEN 'Rahul'
        WHEN n % 10 = 3 THEN 'Divya'
        WHEN n % 10 = 4 THEN 'Karthik'
        WHEN n % 10 = 5 THEN 'Ananya'
        WHEN n % 10 = 6 THEN 'Vijay'
        WHEN n % 10 = 7 THEN 'Sneha'
        WHEN n % 10 = 8 THEN 'Aditya'
        ELSE 'Meena'
    END,
    CASE
        WHEN n % 10 = 0 THEN 'Kumar'
        WHEN n % 10 = 1 THEN 'Sharma'
        WHEN n % 10 = 2 THEN 'Das'
        WHEN n % 10 = 3 THEN 'Rajan'
        WHEN n % 10 = 4 THEN 'Mohan'
        WHEN n % 10 = 5 THEN 'Iyer'
        WHEN n % 10 = 6 THEN 'Reddy'
        WHEN n % 10 = 7 THEN 'Nair'
        WHEN n % 10 = 8 THEN 'Patel'
        ELSE 'Menon'
    END,
    CONCAT('customer', n, '@gmail.com'),
    CONCAT('90000', LPAD(n, 5, '0')),
    CASE
        WHEN n % 6 = 0 THEN 'Chennai'
        WHEN n % 6 = 1 THEN 'Coimbatore'
        WHEN n % 6 = 2 THEN 'Bangalore'
        WHEN n % 6 = 3 THEN 'Hyderabad'
        WHEN n % 6 = 4 THEN 'Madurai'
        ELSE 'Kochi'
    END,
    CASE
        WHEN n % 6 = 0 THEN 'Tamil Nadu'
        WHEN n % 6 = 1 THEN 'Tamil Nadu'
        WHEN n % 6 = 2 THEN 'Karnataka'
        WHEN n % 6 = 3 THEN 'Telangana'
        WHEN n % 6 = 4 THEN 'Tamil Nadu'
        ELSE 'Kerala'
    END,
    DATE_ADD('2025-01-01', INTERVAL (n % 365) DAY)
FROM numbers;
SELECT COUNT(*) AS total_customers
FROM Customers;
SELECT *
FROM Customers
LIMIT 10;
SELECT *
FROM Customers
ORDER BY customer_id DESC
LIMIT 10;
#creating 2000 orders
USE ecommerce_analytics;

SET SESSION cte_max_recursion_depth = 2500;

INSERT INTO Orders
(order_id, customer_id, order_date, order_status, total_amount)

WITH RECURSIVE numbers AS (
    SELECT 1001 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 3000
)

SELECT
    n,

    -- Assign customers
    1 + MOD((n * 37), 400),

    -- Order dates
    DATE_ADD(
        '2025-01-01',
        INTERVAL MOD(n * 11, 608) DAY
    ),

    -- Order status
    CASE MOD(n, 10)
        WHEN 0 THEN 'Cancelled'
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Shipped'
        ELSE 'Completed'
    END,

    0

FROM numbers;
SELECT COUNT(*) AS total_orders
FROM Orders;
SELECT *
FROM Orders
LIMIT 10;
SELECT
    order_status,
    COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status;
#creation of 5000 order
USE ecommerce_analytics;

SET SESSION cte_max_recursion_depth = 10000;

INSERT INTO Order_Items
(order_item_id, order_id, product_id, quantity, unit_price)

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 8000
)

SELECT
    n AS order_item_id,

    1001 + FLOOR((n - 1) / 4) AS order_id,

    MOD(n * 17, 100) + 1 AS product_id,

    MOD(n * 7, 4) + 1 AS quantity,

    p.price AS unit_price

FROM numbers
JOIN Products p
    ON p.product_id = MOD(n * 17, 100) + 1;
    SELECT COUNT(*) AS total_order_items
FROM Order_Items;
SELECT *
FROM Order_Items
LIMIT 10;
SELECT
    order_id,
    COUNT(*) AS items_per_order
FROM Order_Items
GROUP BY order_id
ORDER BY order_id
LIMIT 10;

USE ecommerce_analytics;

UPDATE Orders o
JOIN (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS calculated_total
    FROM Order_Items
    GROUP BY order_id
) oi
ON o.order_id = oi.order_id
SET o.total_amount = oi.calculated_total;

SELECT
    order_id,
    customer_id,
    order_date,
    order_status,
    total_amount
FROM Orders
LIMIT 10;

SELECT
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS average_order_value
FROM Orders;

SELECT
    o.order_id,
    c.first_name,
    c.last_name,
    o.total_amount
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
LIMIT 10;

USE ecommerce_analytics;

INSERT INTO Payments
(payment_id, order_id, payment_method, payment_status, payment_date)

SELECT
    order_id - 1000 AS payment_id,
    order_id,

    CASE MOD(order_id, 5)
        WHEN 0 THEN 'UPI'
        WHEN 1 THEN 'Credit Card'
        WHEN 2 THEN 'Debit Card'
        WHEN 3 THEN 'Net Banking'
        ELSE 'Cash on Delivery'
    END AS payment_method,

    CASE
        WHEN order_status = 'Cancelled' THEN 'Failed'
        WHEN order_status = 'Pending' THEN 'Pending'
        ELSE 'Success'
    END AS payment_status,

    order_date AS payment_date

FROM Orders;
SELECT COUNT(*) AS total_payments
FROM Payments;

SELECT
    payment_method,
    COUNT(*) AS total_payments
FROM Payments
GROUP BY payment_method;

SELECT
    payment_status,
    COUNT(*) AS total_payments
FROM Payments
GROUP BY payment_status;

SELECT
    o.order_id,
    o.order_status,
    o.total_amount,
    p.payment_method,
    p.payment_status
FROM Orders o
JOIN Payments p
    ON o.order_id = p.order_id
LIMIT 10;

#creation of 500 reviews 
USE ecommerce_analytics;

SET SESSION cte_max_recursion_depth = 1000;

INSERT INTO Reviews
(review_id, customer_id, product_id, rating, review_text, review_date)

WITH RECURSIVE numbers AS (
    SELECT 1 AS n

    UNION ALL

    SELECT n + 1
    FROM numbers
    WHERE n < 500
)

SELECT
    n AS review_id,

    MOD(n * 37, 500) + 1 AS customer_id,

    MOD(n * 17, 100) + 1 AS product_id,

    MOD(n * 13, 5) + 1 AS rating,

    CASE MOD(n, 5)
        WHEN 0 THEN 'Excellent product and good quality.'
        WHEN 1 THEN 'Good value for money.'
        WHEN 2 THEN 'Product quality is satisfactory.'
        WHEN 3 THEN 'Delivery was good and product was useful.'
        ELSE 'Average product but overall satisfied.'
    END AS review_text,

    DATE_ADD(
        '2025-01-01',
        INTERVAL MOD(n * 7, 600) DAY
    ) AS review_date

FROM numbers;
SELECT COUNT(*) AS total_reviews
FROM Reviews;
SELECT
    rating,
    COUNT(*) AS number_of_reviews
FROM Reviews
GROUP BY rating
ORDER BY rating;

#complete 7rows analysis
USE ecommerce_analytics;

SELECT 'Categories' AS table_name, COUNT(*) AS record_count FROM Categories
UNION ALL
SELECT 'Customers', COUNT(*) FROM Customers
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'Order_Items', COUNT(*) FROM Order_Items
UNION ALL
SELECT 'Payments', COUNT(*) FROM Payments
UNION ALL
SELECT 'Reviews', COUNT(*) FROM Reviews;
#testing complete relationship 
SELECT
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    p.product_name,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS item_total,
    o.order_status,
    pay.payment_method,
    pay.payment_status
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
JOIN Order_Items oi
    ON o.order_id = oi.order_id
JOIN Products p
    ON oi.product_id = p.product_id
JOIN Payments pay
    ON o.order_id = pay.order_id
LIMIT 10;

SELECT
    SUM(total_amount) AS total_sales
FROM Orders;

SELECT
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS average_order_value
FROM Orders;

SELECT
    order_status,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS average_order_value
FROM Orders
GROUP BY order_status
ORDER BY total_sales DESC;

#monthly sales analysis
SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    COUNT(*) AS total_orders,
    SUM(total_amount) AS total_sales,
    AVG(total_amount) AS average_order_value
FROM Orders
WHERE order_status <> 'Cancelled'
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;
    
#category wise data analysis
SELECT
    c.category_name,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_sales,
    AVG(oi.unit_price) AS average_product_price
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
JOIN Categories c
    ON p.category_id = c.category_id
JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY c.category_name
ORDER BY total_sales DESC;

#top 10 selling products
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
JOIN Categories c
    ON p.category_id = c.category_id
JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    p.product_id,
    p.product_name,
    c.category_name
ORDER BY units_sold DESC
LIMIT 10;

#top 10 products by revenue
SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_sales
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
JOIN Categories c
    ON p.category_id = c.category_id
JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    p.product_id,
    p.product_name,
    c.category_name
ORDER BY total_sales DESC
LIMIT 10;

#customer analysis
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    AVG(o.total_amount) AS average_order_value
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name,
    c.city
ORDER BY total_spent DESC
LIMIT 10;

#customer who never placed an order 
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    c.city,
    c.registration_date
FROM Customers c
LEFT JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL
ORDER BY c.customer_id;

#identify repeat customers
SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(o.order_id) > 1
ORDER BY total_orders DESC, total_spent DESC;

#Calculate the Repeat Customer Rate
SELECT
    COUNT(*) AS total_customers_with_orders,
    SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    ROUND(
        100.0 * SUM(CASE WHEN order_count > 1 THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS repeat_customer_rate
FROM (
    SELECT
        c.customer_id,
        COUNT(o.order_id) AS order_count
    FROM Customers c
    JOIN Orders o
        ON c.customer_id = o.customer_id
    WHERE o.order_status <> 'Cancelled'
    GROUP BY c.customer_id
) x;

--  Calculate the average spending of each customer

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent,
    ROUND(AVG(o.total_amount), 2) AS average_order_value
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spent DESC;

-- Find customers whose total spending is greater than the average customer spending

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
HAVING SUM(o.total_amount) > (
    SELECT AVG(customer_total)
    FROM (
        SELECT
            customer_id,
            SUM(total_amount) AS customer_total
        FROM Orders
        WHERE order_status <> 'Cancelled'
        GROUP BY customer_id
    ) AS customer_spending
)
ORDER BY total_spent DESC;

-- Segment customers based on their total spending

SELECT
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    SUM(o.total_amount) AS total_spent,
    CASE
        WHEN SUM(o.total_amount) >= 50000 THEN 'High Value'
        WHEN SUM(o.total_amount) >= 20000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_segment
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY total_spent DESC;

-- Identify products with low inventory levels

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    p.stock_quantity,
    p.price
FROM Products p
JOIN Categories c
    ON p.category_id = c.category_id
WHERE p.stock_quantity < 50
ORDER BY p.stock_quantity ASC;

-- Find the top 10 products based on total revenue

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM Order_Items oi
JOIN Products p
    ON oi.product_id = p.product_id
JOIN Categories c
    ON p.category_id = c.category_id
JOIN Orders o
    ON oi.order_id = o.order_id
WHERE o.order_status <> 'Cancelled'
GROUP BY
    p.product_id,
    p.product_name,
    c.category_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Find the 10 products generating the lowest revenue

SELECT
    p.product_id,
    p.product_name,
    c.category_name,
    COALESCE(SUM(oi.quantity), 0) AS units_sold,
    COALESCE(SUM(oi.quantity * oi.unit_price), 0) AS total_revenue
FROM Products p
JOIN Categories c
    ON p.category_id = c.category_id
LEFT JOIN Order_Items oi
    ON p.product_id = oi.product_id
LEFT JOIN Orders o
    ON oi.order_id = o.order_id
    AND o.order_status <> 'Cancelled'
GROUP BY
    p.product_id,
    p.product_name,
    c.category_name
ORDER BY total_revenue ASC
LIMIT 10;

-- Rank products within each category based on total revenue

WITH product_sales AS (
    SELECT
        p.product_id,
        p.product_name,
        c.category_name,
        SUM(oi.quantity * oi.unit_price) AS total_revenue
    FROM Order_Items oi
    JOIN Products p
        ON oi.product_id = p.product_id
    JOIN Categories c
        ON p.category_id = c.category_id
    JOIN Orders o
        ON oi.order_id = o.order_id
    WHERE o.order_status <> 'Cancelled'
    GROUP BY
        p.product_id,
        p.product_name,
        c.category_name
),
ranked_products AS (
    SELECT
        product_id,
        product_name,
        category_name,
        total_revenue,
        DENSE_RANK() OVER (
            PARTITION BY category_name
            ORDER BY total_revenue DESC
        ) AS category_rank
    FROM product_sales
)
SELECT
    product_id,
    product_name,
    category_name,
    total_revenue,
    category_rank
FROM ranked_products
WHERE category_rank <= 3
ORDER BY category_name, category_rank;

