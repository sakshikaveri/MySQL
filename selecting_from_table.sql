
-- Selecting from table
USE coffee_store;
SELECT * FROM customers;  -- displays all information
SELECT last_name FROM customers;  -- displaying single column
SELECT last_name,phone_number FROM customers;  -- displaying multiple columns

SELECT * FROM products;

SELECT * FROM products
WHERE origin='Indonesia';

SELECT * FROM products
WHERE origin='Indonesia' AND price=3.50;

SELECT * FROM products
WHERE origin='Indonesia' OR price=3.00;

-- Using symbols
/*
!= ... not equal to.
<> ... not equal to (i.e. greater than or less than).
>  ... greater than.
>= ... greater than or equal to.
<  ... less than.
<= ... less than or equal to.
*/
 
SELECT * FROM products;

SELECT * FROM products
-- WHERE price != 3.00;
WHERE price <> 3.00;

SELECT * FROM products
WHERE price > 3.00;

SELECT * FROM products
WHERE price <= 3.00;

SELECT * FROM products
WHERE name < 'D';

-- EXERCISE
SELECT first_name,phone_number FROM customers
WHERE gender='F' AND last_name='Bluth';

SELECT name FROM products
WHERE price > 3.00 OR origin='Sri Lanka';

SELECT * FROM customers
WHERE gender='M' AND phone_number is NULL;
-- we don't use equals to when we check for NULL values

-- IN and NOT IN
SELECT * FROM customers
WHERE last_name IN ('Law','Bluth','Taylor','Smith');

SELECT * FROM customers
WHERE last_name NOT IN ('Bluth','Taylor','Smith');

-- BETWEEN
SELECT * FROM customers
WHERE id BETWEEN 2 AND 8;

SELECT * FROM orders
WHERE order_time BETWEEN '2022-01-01' AND '2022-01-31 23:59:59' ;

-- LIKE
SELECT * FROM customers
WHERE last_name LIKE 'W%';
-- percentage means any number of characers after after W
SELECT * FROM customers
WHERE last_name LIKE '%w%'; 
-- Any number of characters and in between a W then followed by any number of characters

SELECT * FROM customers
WHERE last_name LIKE '__w';
-- only two characters before w

-- ORDER BY
SELECT * FROM customers
ORDER BY id DESC;

SELECT * FROM CUSTOMERS
ORDER BY last_name,first_name;

SELECT * FROM CUSTOMERS
WHERE last_name='Bluth'
ORDER BY last_name,first_name;

-- EXERCISE
SELECT * FROM products;
SELECT name, price FROM products
WHERE origin IN ('Columbia','Indonesia')
ORDER BY name;
-- alternatively
SELECT name, price FROM products
WHERE origin='Columbia' OR origin='Indonesia'
ORDER BY name ASC;

SELECT * FROM orders
WHERE customer_id IN(19,20,21,24) AND order_time BETWEEN '2023-02-01' AND '2023-02-28 23:59:59';
-- alternatively
SELECT * FROM orders
WHERE year(order_time)=2023 AND month(order_time)=2
AND customer_id IN(19,20,21,24);

SELECT * FROM customers;
SELECT first_name, phone_number FROM customers
WHERE last_name LIKE '%ar%';

SELECT * FROM products;
SELECT DISTINCT origin FROM products;
SELECT DISTINCT origin,id FROM products;
SELECT DISTINCT origin,price FROM products;

SELECT * FROM orders;
SELECT DISTINCT customer_id FROM orders
ORDER BY customer_id;

-- LIMIT 
SELECT * FROM orders
LIMIT 5;

SELECT * FROM orders
LIMIT 5 OFFSET 5;

SELECT * FROM orders
LIMIT 5,5;

SELECT * FROM orders
LIMIT 12,3;

SELECT * FROM orders
LIMIT 3 OFFSET 12;

SELECT * FROM customers
ORDER BY last_name
LIMIT 10;

SELECT * FROM products;
SELECT id, name AS coffee, price, origin AS country FROM products;

-- Exercise
SELECT DISTINCT last_name FROM customers
order by last_name;

SELECT * FROM ORDERS;
SELECT * FROM ORDERS
WHERE product_id=3 AND 
year(order_time)=2023 and month(order_time)=2
order by order_time
LIMIT 4;

SELECT name,price AS retail_price,origin FROM products;