
USE cinema_booking_system;

-- non-correlated sub query
-- example 1
SELECT id, start_time FROM screenings
where film_id in
	( SELECT id from films
    where length_min>120)
order by start_time;

SELECT id, start_time FROM screenings
where film_id in (1,3,8,11)
order by start_time;

select * from customers;
select * from screenings;
select * from bookings;
SELECT first_name,last_name,email from customers
where id in
	(select customer_id from bookings
    where screening_id=1);

-- example 2
select * from reserved_seat;

select booking_id,count(seat_id) as no_seats from reserved_seat
group by booking_id;

select max(no_seats) from
(select booking_id,count(seat_id) as no_seats from reserved_seat
group by booking_id) b;

-- CORRELATED SUB-QUERY
select * from reserved_seat;
select * from bookings;

select screening_id,customer_id from bookings
order by screening_id;

select screening_id, customer_id,
(select count(*) from reserved_seat where booking_id=b.id)
from bookings b
order by screening_id;

-- exercises
show tables;
select * from customers;
select * from screenings;
select * from bookings;
select * from films;
select * from reserved_seat;
select * from rooms;
select * from seats;
-- 1)
select name,length_min from films
where length_min>
(select avg(length_min) from films);

-- 2)

select max(no_screenings),min(no_screenings) from 
(select film_id,count(*) as no_screenings from screenings
group by film_id) a;

select name, 
(select count(*) from screenings where film_id=f.id)
from films f;


