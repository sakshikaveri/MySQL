USE coffee_store;

SELECT * FROM customers;
SELECT * FROM products;
SELECT * FROM orders;

SELECT products.name,orders.order_time FROM orders
INNER JOIN products ON orders.product_id=products.id;
-- jo jo same values in orders ka product id and products ka id columns me voh print hogi

-- short hand version using table name aliases
SELECT p.name, o.order_time FROM orders AS o
INNER JOIN products p ON o.product_id=p.id;
-- AS can be left out while wrting table name aliases

-- INNER JOIN CAN ALSO BE WRITTEN ONLY AS JOIN (AS IT IS MOST POPULAR)
SELECT p.name, o.order_time FROM orders AS o
JOIN products p ON o.product_id=p.id
ORDER BY order_time;

-- also using WHERE clause
SELECT p.name, o.order_time FROM orders AS o
JOIN products p ON o.product_id=p.id
WHERE p.id=7
ORDER BY order_time;

/*
INNER JOIN SYNTAX
SELECT <table1>.<column name>,<table2>.<column name> FROM <table1>
JOIN <table2> ON <table1>.<column>=,<table 2>.<column> */

-- LEFT JOIN (saari values from left and uska matching values in right)

SELECT * FROM customers;
SELECT * FROM orders;

SELECT o.*,c.* FROM orders o
LEFT JOIN customers c ON c.id=o.customer_id
ORDER BY c.id;
-- jo jo orders me customer id hai vo saari values print hogi from customers ka table

-- other way round
UPDATE orders
SET customer_id=null
WHERE id IN (1,3,5);

SELECT o.*,c.* FROM customers c
left JOIN orders o ON c.id=o.customer_id
ORDER BY c.id;
-- jo jo customers me id hai vo saari values print hogi from customer_id- orders ka table


-- RIGHT JOIN (saari values from right and uska matching values in left)
SELECT o.*,c.* FROM customers c
right JOIN orders o ON c.id=o.customer_id
ORDER BY c.id;
-- jo jo orders me customer id hai vo saari values print hogi from customers ka table

SELECT o.*,c.* FROM orders o
right JOIN customers c ON c.id=o.customer_id
ORDER BY c.id;
--  jo jo customers me id hai vo saari values print hogi from customer_id- orders ka table

-- NOTE- try using only left joins

-- TRY JOINING MULTIPLE TABLES
SELECT p.name,p.price, c.first_name,c.last_name,o.order_time FROM products p
INNER JOIN orders o ON p.id=o.product_id
INNER JOIN customers c ON c.id=o.customer_id
where c.last_name='Bluth'
ORDER BY o.order_time;

-- EXERCISES
SELECT o.id, c.phone_number FROM orders o
JOIN customers c ON o.customer_id=c.id
WHERE o.product_id=4;

SELECT p.name,o.order_time FROM orders o
JOIN products p ON p.id=o.product_id
WHERE p.name='Filter' AND o.order_time BETWEEN '2023-01-01' AND '2023-03-31 23:59:59';

SELECT p.name,p.price,o.order_time FROM products p
JOIN orders o ON o.product_id=p.id
JOIN customers c ON c.id=o.customer_id
WHERE c.gender='F' and o.order_time BETWEEN '2023-01-01' AND '2023-01-31 23:59:59';

