-- Aggregate functions

-- COUNT
USE cinema_booking_system;
SHOW TABLES;
SELECT * FROM films;
SELECT count(*) FROM films;
SELECT count(name) FROM films;
-- count aggregate function doesn't count null values

-- SUM
SELECT * FROM rooms;
SELECT sum(no_seats) FROM rooms; 
SELECT sum(no_seats) FROM rooms
WHERE id>1;
-- we cannot use start on sum function

-- MIN AND MAX
SELECT * FROM films;
SELECT max(length_min) FROM films;
SELECT min(length_min) FROM films;

-- AVERAGE
SELECT * FROM films;
SELECT avg(length_min) FROM films;
SELECT avg(length_min) FROM films WHERE length_min<120;

-- EXERCISES
SELECT * FROM bookings;
SELECT COUNT(*) FROM bookings WHERE customer_id=10;

SELECT * FROM films;
SELECT * FROM screenings;
SELECT COUNT(*) FROM screenings s
JOIN films f ON s.film_id=f.id 
WHERE f.name='Blade Runner 2049' AND s.start_time BETWEEN '2022-10-01' AND '2022-10-31 23:59:59';

SELECT * FROM customers;
SELECT * FROM bookings;
SELECT COUNT(distinct(customer_id)) FROM  bookings b
JOIN screenings s ON s.id=b.screening_id
WHERE s.start_time BETWEEN '2023-04-01' AND '2023-04-30 23:59:59';