-- exercises
use cinema_booking_system;
select concat(name," : ",length_min) as result from films;

select substring(email,5) from customers;

select lower(first_name),upper(last_name) from customers
where last_name='smith';

select substring(name,-3,3) as short_hand_name from films;

select concat(substring(first_name,1,3)," ",substring(last_name,1,3)) from customers;

-- substring(string,start,length)

-- date functions
select start_time from screenings;
select date(start_time) from screenings;
-- returns only date

select count(start_time) from screenings where start_time between '2023-07-08' and '2023-09-09'; -- 27
select count(date(start_time)) from screenings where start_time between '2023-07-08' and '2023-09-09'; -- 27

select count(start_time) from screenings where start_time between '2023-07-08' and '2023-09-09 23:59:59';  -- 29
 
-- exercises
-- 1)
select film_id,start_time from screenings
where date(start_time)='2022-06-18';
-- 2)
select * from screenings where start_time between '2023-03-06' and '2023-03-13 23:59:59';
-- 3)
select * from screenings where month(start_time)=10 and year(start_time)=2022;
