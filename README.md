# eCommerce Data Analysis Project (MySQL + Power BI)

## 📖 Project Overview
This project demonstrates how to build a simple yet complete eCommerce database in MySQL, connect it to Power BI, and create interactive sales reports. It simulates a real-world workflow where business data is stored in a MySQL server and visualized through dashboards.

---

## 🧱 Database Structure
The project contains four main tables:

1. **customers** – Stores customer details (name, city, email)
2. **products** – Contains product details (name, category, price)
3. **orders** – Holds order-level information (order date, customer ID)
4. **order_details** – Maps orders to products and stores quantity purchased

A final view named `Sales_report_View_Final` is created to combine all tables using SQL joins.

---
![Output 1](https://github.com/kavikumaran555/Ecommerce-MySQL-to-PowerBI-Project/raw/main/MySQL%20view.png)

SQL DATABASE TABLE

![Output 2](https://github.com/kavikumaran555/Ecommerce-MySQL-to-PowerBI-Project/raw/main/SQL%20Output.png)

POWER BI 

![Output 3](https://github.com/kavikumaran555/Ecommerce-MySQL-to-PowerBI-Project/raw/main/created%20online%20database.png)

![Output 4](https://github.com/kavikumaran555/Ecommerce-MySQL-to-PowerBI-Project/raw/main/Importing%20Data%20from%20MySQL%20Server%20to%20PowerBI.png)

![Output 5](https://github.com/kavikumaran555/Ecommerce-MySQL-to-PowerBI-Project/raw/main/Data%20Imported%20from%20MySQL%20to%20Power%20BI.png)

## 🗃 SQL Schema

```sql
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(100),
  city VARCHAR(50),
  email VARCHAR(100)
);

CREATE TABLE products (
  product_id INT PRIMARY KEY AUTO_INCREMENT,
  product_name VARCHAR(100),
  category VARCHAR(50),
  price DECIMAL(10,2)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_id INT,
  order_date DATE,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_details (
  order_details_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

