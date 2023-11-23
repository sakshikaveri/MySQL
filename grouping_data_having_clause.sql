
-- Grouping data
USE cinema_booking_system;
SHOW TABLES;
SELECT * FROM bookings;
SELECT COUNT(*) FROM BOOKINGS;
SELECT customer_id,COUNT(*) FROM BOOKINGS
GROUP BY customer_id;
SELECT customer_id,screening_id,COUNT(*) FROM BOOKINGS
GROUP BY customer_id,screening_id;

-- customers, bookings,screenings and films table together
SELECT * FROM customers;
SELECT * FROM bookings;
SELECT * FROM screenings;
SELECT * FROM films;
SELECT f.name,s.start_time,c.first_name,c.last_name, count(b.id) FROM films f
JOIN screenings s ON f.id=s.film_id
JOIN bookings b on b.screening_id=s.id
JOIN customers c on c.id=b.customer_id
GROUP BY f.name,s.start_time,c.first_name,c.last_name
ORDER BY s.start_time;

-- having clause
SELECT customer_id,screening_id,COUNT(*) FROM bookings
GROUP BY customer_id,screening_id
HAVING customer_id=10;

-- adding a where clause to query 
-- to count bookings for the year 2022
SELECT customer_id,screening_id,COUNT(*) FROM bookings
JOIN screenings on screenings.id=bookings.screening_id
WHERE year(screenings.start_time)=2022
GROUP BY customer_id,screening_id
HAVING customer_id=10;

-- to cross-check
SELECT b.customer_id,b.screening_id,s.start_time FROM bookings b
JOIN screenings s on s.id=b.screening_id
WHERE customer_id=10;

-- exercises
SELECT * FROM customers;
SELECT * FROM bookings;
SELECT * FROM screenings;
SELECT * FROM films;
SELECT * FROM reserved_seat;
SELECT * FROM rooms;
SELECT * FROM seats;

SELECT customers.id,COUNT(reserved_seat.id) FROM customers 
JOIN bookings on customers.id=bookings.customer_id
JOIN reserved_seat ON reserved_seat.booking_id=bookings.id
GROUP BY customers.id
ORDER BY customers.id;

-- alternatively
SELECT b.customer_id,COUNT(rs.id) FROM bookings b
JOIN reserved_seat rs ON rs.booking_id=b.id
GROUP BY b.customer_id
ORDER BY B.customer_id;

SELECT f.name,f.length_min,COUNT(s.id) FROM films f
JOIN screenings s On s.film_id=f.id
GROUP BY f.name,f.length_min
HAVING  f.length_min > 120;

SELECT f.name,f.length_min,COUNT(s.id) FROM films f
JOIN screenings s On s.film_id=f.id
WHERE year(s.start_time)= 2023 and month(s.start_time)=01 and f.length_min > 120
GROUP BY f.name,f.length_min;

SELECT b.customer_id,b.screening_id,r.no_seats as seats_booked FROM screenings s
JOIN bookings b on b.screening_id=s.id
JOIN rooms r on s.room_id=r.id
GROUP BY b.customer_id,b.screening_id,r.no_seats
ORDER BY b.customer_id;

-- ( the required solution)  - doubt
select customer_id,screening_id,count(*) as no_seats from bookings b
join reserved_seat rs on rs.booking_id=b.id
group by customer_id,screening_id
order by customer_id;



