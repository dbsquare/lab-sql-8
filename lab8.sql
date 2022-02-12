#lab8

#Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
select title, length, rank() over (order by length desc) as "row_length"
from film
where length != 0 or length!= null 
order by length;

#Rank films by length within the rating category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.
SELECT title,length, rating, rank() OVER (partition by rating order by length desc) AS "Rank"
FROM film
where length != 0 or length != null
;

#How many films are there for each of the categories in the category table. Use appropriate join to write this query
select count(f.film_id), c.name
from category as c
inner join film_category as f
on c.category_id = f.category_id
group by c.name;


#Which actor has appeared in the most films?
select a.first_name, a.last_name, count(*)
from actor a
inner join film_actor fa
on a.actor_id = fa.actor_id
group by a.actor_id, a.first_name, a.last_name
order by count(*) desc
limit 1;

#Most active customer (the customer that has rented the most number of films)
SELECT cust.customer_id, cust.first_name, cust.last_name, count(*) as Total_Rentals
FROM rental as r
INNER JOIN customer AS cust on r.customer_id = cust.customer_id
GROUP BY cust.customer_id, cust.first_name, cust.last_name
ORDER BY Total_Rentals 
DESC LIMIT 1



