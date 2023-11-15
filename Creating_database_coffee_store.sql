
SHOW DATABASES;
CREATE DATABASE coffee_store;
USE coffee_store;

CREATE table products(
id INT auto_increment PRIMARY KEY,
name VARCHAR(30),
price DECIMAL(3,2)
);

SHOW databases;
SHOW TABLES;

CREATE TABLE customers(
id INT auto_increment PRIMARY KEY,
first_name VARCHAR(20),
gender CHAR(1),
last_name VARCHAR(20),
phone_number INT
);
SHOW TABLES;

CREATE TABLE orders(
id INT auto_increment PRIMARY KEY,
product_id INT,
customer_id INT,
order_time DATETIME,
FOREIGN KEY(product_id) REFERENCES products(id),
FOREIGN KEY(customer_id) REFERENCES customers(id)
);