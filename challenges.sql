-- CHALLENGES
use cinema_booking_system;
show tables;
SELECT * FROM customers;
SELECT * FROM bookings;
SELECT * FROM screenings;
SELECT * FROM films;
SELECT * FROM reserved_seat;
SELECT * FROM rooms;
SELECT * FROM seats;

-- 1) films that are over 2 hours long
select * from films where length_min>120;

-- 2) which films had the most screenings
select f.name,s.film_id,count(s.film_id) as no_screenings from screenings s
join films f on f.id=s.film_id
group by f.name,s.film_id
order by no_screenings desc;

select f.name,s.film_id,count(s.film_id) as no_screenings from screenings s
join films f on f.id=s.film_id
group by f.name,s.film_id
having no_screenings=25;

-- final answer
select f.name,s.film_id,count(s.film_id) as no_screenings from screenings s
join films f on f.id=s.film_id
group by f.name,s.film_id
having no_screenings=(select max(sh.no_screenings) from
(select count(s.film_id) as no_screenings from screenings s
group by s.film_id) sh);

-- 3) how many bookings did the film jigsaw have in may 2022?

-- using subqueries
select count(*) from bookings
where screening_id in
(select s.id as showings from screenings s
join films f on f.id=s.film_id
where f.name='Jigsaw' and s.start_time between '2022-05-01' and '2022-05-31 23:59:59' 
group by f.name,s.id);

-- 4) which 5 customers made the most bookings?
select c.id,c.first_name,c.last_name, count(*) as bookings from bookings b
join customers c on c.id=b.customer_id
group by c.id,c.first_name,c.last_name
order by bookings desc
limit 5; 

-- 5) in the chaplin room which film was shown the most

select f.name as film_name,count(s.film_id) as showings ,r.name from screenings s
join rooms r on r.id=s.room_id
join films f on f.id=s.film_id
where r.name='Chaplin'
group by f.name,r.name
order by showings desc
limit 1;

-- using subquery
select f.name as film_name,count(s.film_id) as showings ,r.name from screenings s
join rooms r on r.id=s.room_id
join films f on f.id=s.film_id
where r.name='Chaplin'
group by f.name,r.name
having showings=
(select max(showings) from
(select f.name as film_name,count(s.film_id) as showings ,r.name from screenings s
join rooms r on r.id=s.room_id
join films f on f.id=s.film_id
where r.name='Chaplin'
group by f.name,r.name) as sh);

-- 6) how many of our customers have made bookings?
select count(distinct(customer_id)) from bookings;
