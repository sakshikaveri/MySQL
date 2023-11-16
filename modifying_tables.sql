USE coffee_store;

DESCRIBE products;

ALTER TABLE products
ADD COLUMN coffee_origin VARCHAR(30);

-- Now deleting the recently added column
ALTER TABLE products
DROP COLUMN coffee_origin;

-- Creating a dummy database and table for deleting the table
CREATE DATABASE example;
USE example;
CREATE TABLE dummy(
id INT auto_increment PRIMARY KEY,
name VARCHAR(30),
price DECIMAL(3,2)
);

DESCRIBE dummy;
SHOW TABLES;

DROP Table dummy;

INSERT INTO dummy (name,price) VALUES('Sakshi',2.54),('Simran',3.54),('Abhishek',4.54);
SELECT * FROM dummy;

TRUNCATE TABLE dummy;