
select * from film f;
select * from film_category fc ;
select * from category c;
select * from staff s;
select * from payment p;
select * from customer c;
select * from rental r ;
select * from store s;
select * from inventory i ;


--1.
select distinct f.title from film f join film_category fc on f.film_id = fc.film_id join category c on fc.category_id = c.category_id 
where c."name" like '%Sci-Fi%';


--2
select * from film f where rating = 'R' and replacement_cost between 5 and 15;


--3
select staff_id, count(staff_id) as total_customer_handle, sum(amount) as total_amount_processed from payment
group by staff_id;

--4
select rating, avg(replacement_cost) as avg_rep_cost from film 
group by rating ;

--5
select concat(c.first_name,' ',c.last_name) as name , c.email, sum(p.amount) as total_spend from payment p 
join customer c on p.customer_id = c.customer_id
where c.active = 1
group by name, c.email
order by total_spend desc limit 5;

--6
select * from store;
select * from film f;
select * from inventory i;


--7
-- Store 1
select film_id,count(film_id) from inventory i 
where store_id = 1
group by film_id;

--Store 2
select film_id,count(film_id) from inventory i 
where store_id = 2
group by film_id;



--8
select * from customer c;
select * from payment p;

select concat(c.first_name,' ',c.last_name) as name , c.email, count(p.*) as transaction_count 
from payment p join customer c on p.customer_id = c.customer_id
where c.active = 1
group by c.customer_id
having count(*) >= 40 ;



