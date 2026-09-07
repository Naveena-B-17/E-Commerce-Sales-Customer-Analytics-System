# 🛒 E-Commerce Sales & Customer Analytics System

## 📌 Project Overview

This project is a simulated **e-commerce database built with MySQL**. It contains customer, product, order, payment and review data and uses SQL queries to analyze sales performance, customer behavior, product performance and order patterns.

The main purpose of this project is to practice SQL through a realistic business scenario and understand how relational databases can be used to answer practical business questions.

---

## ⭐ Project Highlights

* 7 interconnected relational tables
* 500 customers
* 100 products
* 2,000 orders
* 8,000 order items
* 2,000 payment records
* 500 customer reviews
* 1,220+ lines of SQL
* 30+ analytical queries
* MySQL database design with primary and foreign keys
* SQL analysis using CTEs and window functions
* Data validation and query optimization

---

## 🎯 Objectives

* Build a well-structured relational database for an e-commerce business.
* Store and manage customer, product, order, payment and review data.
* Analyze sales and revenue trends.
* Identify repeat and high-value customers.
* Analyze product and category performance.
* Study order cancellation and payment patterns.
* Apply different SQL concepts to practical business problems.
* Understand the basics of query optimization using indexes and `EXPLAIN`.

---

## 🛠️ Technologies Used

* **Database:** MySQL
* **IDE:** MySQL Workbench
* **Query Language:** SQL
* **Version Control:** Git & GitHub

---

## 🗄️ Database Design

The database contains **7 interconnected tables**:

| Table         | Description                                               |
| ------------- | --------------------------------------------------------- |
| `Categories`  | Stores product category information                       |
| `Customers`   | Stores customer details                                   |
| `Products`    | Stores product information including price and stock      |
| `Orders`      | Stores customer order details                             |
| `Order_Items` | Stores the products and quantities included in each order |
| `Payments`    | Stores payment method and payment status                  |
| `Reviews`     | Stores customer ratings and product reviews               |

### 🔗 Database Relationships

```text
Categories
    │
    └── Products
           │
           └── Order_Items ─── Orders ─── Customers
                                │
                                └── Payments

Customers ─── Reviews ─── Products
```

---

## 📊 Dataset

The project uses a **simulated e-commerce dataset** containing:

| Entity      | Records |
| ----------- | ------: |
| Categories  |      10 |
| Customers   |     500 |
| Products    |     100 |
| Orders      |   2,000 |
| Order Items |   8,000 |
| Payments    |   2,000 |
| Reviews     |     500 |

The dataset was created specifically for learning and portfolio purposes and provides enough records to perform meaningful SQL analysis.

---

## 🔍 SQL Concepts Used

The project covers SQL concepts ranging from basic queries to advanced analytical techniques:

* `SELECT`
* `WHERE`
* `ORDER BY`
* `GROUP BY`
* Aggregate Functions
* `HAVING`
* `INNER JOIN`
* `LEFT JOIN`
* Subqueries
* Common Table Expressions (CTEs)
* `CASE` expressions
* Date Functions
* String Functions
* `NULLIF`
* `LAG()`
* `DENSE_RANK()`
* `PARTITION BY`
* Window Functions
* Views
* Indexes
* `EXPLAIN`
* Data Validation

---

## 📈 Business Analysis

The project uses SQL to answer practical questions that an e-commerce business may need to understand.

### 💰 Sales Analysis

* What is the total sales revenue?
* What is the average order value?
* How do sales change month by month?
* Which month generated the highest sales?
* Which categories generate the most revenue?
* How much revenue comes from different payment methods?
* How does monthly sales growth change over time?

### 👥 Customer Analysis

* How many customers are repeat customers?
* Which customers spend more than the average?
* How can customers be grouped based on their spending?
* Who are the highest-spending customers?
* Who are the top customers in each city?
* How frequently do customers place orders?
* When did customers place their first and most recent orders?

### 📦 Product Analysis

* Which products generate the highest revenue?
* Which products generate the lowest revenue?
* What are the top products in each category?
* Which products have low stock?
* Which products have the highest ratings?
* Which products have poor customer ratings?

### 💳 Payment Analysis

* Which payment methods generate the most revenue?
* What is the payment success rate?
* How are payments distributed by status?
* Which payment method is used most frequently?

### 📋 Order Analysis

* What percentage of orders are cancelled?
* How many orders does each customer place?
* What is the average number of items in an order?
* How are orders distributed by status?
* How does the number of orders change each month?

---

## 📌 Key Insights

The analysis can be used to identify:

* Categories that generate higher revenue.
* Customers who contribute significantly to sales.
* The percentage of cancelled orders.
* Monthly sales trends and growth.
* Products that may need to be restocked.
* Payment methods that contribute to successful sales.
* High-value customers based on their spending.
* Products with good and poor customer ratings.

> **Note:** The dataset used in this project is synthetic and was created for learning and portfolio purposes. The results therefore represent the generated dataset rather than the performance of a real company.

---

## 📁 Project Structure

The complete SQL implementation is maintained in a single SQL file.

```text
ecommerce-sales-customer-analytics/
│
├── README.md
│
└── ecommerce_sales_customer_analytics.sql
```

The SQL file contains:

* Database creation
* Table creation
* Data insertion
* Data validation
* Sales analysis
* Customer analysis
* Product analysis
* Payment analysis
* Order analysis
* Advanced SQL queries
* Views
* Query optimization

---

## ▶️ How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/NAVEENA-B-17/ecommerce-sales-customer-analytics.git
```

Replace `NAVEENA-B-17` with your GitHub username.

### 2. Open MySQL Workbench

Open the `ecommerce_sales_customer_analytics.sql` file in **MySQL Workbench**.

### 3. Execute the SQL File

Run the SQL statements in order from the beginning of the file.

The script will:

1. Create the database.
2. Create the required tables.
3. Insert the simulated dataset.
4. Perform data validation.
5. Run the analysis queries.

---

## 🧪 Data Validation

The database was checked using:

* Record count checks
* Primary key validation
* Foreign key validation
* Join validation
* Order total verification
* Payment and order status checks
* NULL value checks
* Duplicate value checks

These checks were used to make sure the tables and their relationships were working correctly before performing the analysis.

---

## 🚀 Future Enhancements

Some possible extensions for this project are:

* Integrating the database with **Java using JDBC**
* Building REST APIs using **Spring Boot**
* Creating an interactive dashboard using **Power BI**
* Adding stored procedures and triggers
* Adding customer churn analysis
* Adding sales forecasting
* Building a product recommendation system

---

## 📚 What I Learned

Working on this project helped me improve my understanding of:

* Relational database design
* Primary and foreign keys
* Table relationships
* SQL querying
* Joins
* Data aggregation
* Subqueries
* CTEs
* Window functions
* Business-oriented data analysis
* Query optimization
* Git and GitHub

---

## 👩‍💻 About Me

**Naveena**

B.E. Electronics and Communication Engineering
Aspiring Software Developer | Java | SQL | DSA

---

## 📎 Project Information

|                   |                            |
| ----------------- | -------------------------- |
| **Database**      | MySQL                      |
| **Tables**        | 7                          |
| **Customers**     | 500                        |
| **Products**      | 100                        |
| **Orders**        | 2,000                      |
| **Order Items**   | 8,000                      |
| **Payments**      | 2,000                      |
| **Reviews**       | 500                        |
| **SQL Code**      | 1,220+ lines               |
| **Project Focus** | Sales & Customer Analytics |
