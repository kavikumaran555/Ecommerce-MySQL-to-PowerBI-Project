create database ecommerce_db;
use ecommerce_db;

create table customers(
customer_id int primary key auto_increment,
customer_name varchar(100),
city varchar(50),
email varchar(100));

create table products(
product_id int primary key auto_increment,
product_name varchar(100),
category varchar(50),
price decimal(10,2));

create table orders(
order_id int primary key auto_increment,
customer_id int,
order_date date,
foreign key (customer_id) references customers(customer_id));

create table order_details (
  order_details_id INT PRIMARY KEY AUTO_INCREMENT,
  order_id INT,
  product_id INT,
  quantity INT,
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT into customers (customer_name, city, email) VALUES
('Ravi Kumar', 'Chennai', 'ravi@example.com'),
('Meena Devi', 'Madurai', 'meena@example.com'),
('Arun Raj', 'Coimbatore', 'arun@example.com'),
('Kavi Kumaran', 'Ramanathapuram', 'kavi@example.com');

select * from customers;

INSERT INTO products (product_name, category, price) VALUES
('Laptop', 'Electronics', 60000),
('Mobile Phone', 'Electronics', 15000),
('Headphones', 'Accessories', 2000),
('Office Chair', 'Furniture', 7000),
('Study Table', 'Furniture', 9000);

select * from products;

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2025-10-20'),
(2, '2025-10-21'),
(3, '2025-10-22'),
(4, '2025-10-23');

Select * from orders;

insert into order_details (order_id, product_id, quantity) values
(1, 1, 1),
(1, 3, 2),
(2, 2, 1),
(3, 4, 1),
(3, 5, 1),
(4, 2, 2);

select * from order_details;

Create View Sales_report_View_Final as
Select orders.order_id, orders.order_date, customers.customer_name, customers.city, products.product_name, products.category, products.price, order_details.quantity,
(products.price * order_details.quantity) as total_amount
FROM orders JOIN customers ON orders.customer_id = customers.customer_id
JOIN order_details ON orders.order_id = order_details.order_id
JOIN products ON order_details.product_id = products.product_id;

select * from Sales_report_View_Final;
