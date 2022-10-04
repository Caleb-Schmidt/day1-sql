-- 1. How many actors are there 
-- with the last name ‘Wahlberg’?
SELECT first_name, last_name
FROM actor
WHERE last_name = 'Wahlberg';
-- 2

-- 2. How many payments 
-- were made between $3.99 and $5.99?
SELECT COUNT(amount)
FROM payment
WHERE amount > 3.99 AND amount < 5.99;
-- 3427

-- 3. What film does the
-- store have the most of? (search in inventory)
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;
-- HIghest count among film was 8.
-- Many films had that count

-- 4. How many customers 
-- have the last name ‘William’?
SELECT first_name, last_name
FROM customer
WHERE last_name LIKE 'William';
-- None

-- 5. What store employee 
-- (get the id) sold the most rentals?
SELECT staff_id, COUNT(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY COUNT(rental_id) DESC;
-- staff with id of 1

-- 6. How many different district 
-- names are there?
SELECT DISTINCT COUNT(district)
FROM address;
-- 603

-- 7. What film has the most actors in it? 
-- (use film_actor table and get film_id)
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;
-- film id 508 has the highest with 15 actors

-- 8. From store_id 1, how many customers have a 
--last name ending with ‘es’? (use customer table)
SELECT store_id, COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es'
GROUP BY store_id;
-- 13

-- 9. How many payment amounts 
-- (4.99, 5.99, etc.) had a number of rentals above 
-- 250 for customers with ids between 380 and 430? 
-- (use group by and having > 250)
SELECT COUNT(amount), COUNT(rental_id), customer_id
FROM payment
WHERE customer_id BETWEEN 380 AND 430
GROUP BY customer_id
HAVING COUNT(rental_id) > 250;
-- None

-- 10. Within the film table, 
-- how many rating categories are there? 
-- And what rating has the most movies total?
SELECT COUNT(rating), rating
FROM film
GROUP BY rating
ORDER BY COUNT(rating) DESC;
-- 5 different ratings
-- PG-13 has the most movies, with 223