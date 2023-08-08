-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT last_name
FROM actor
WHERE last_name = 'Wahlberg';

-- There are 2 'Wahlbergs.


-- 2. How many payments were made between $3.99 and $5.99?

SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99;

-- There are two payments made between 3.99 and 5.99. They are $4.96 and $4.95

-- 3. What film does the store have the most of? (search in inventory)

SELECT COUNT(film_id)
FROM inventory
GROUP BY film_id
LIMIT 1;

-- Okay wow, this was difficult to figure out. I think the answer is film_id of 4.

-- 4. How many customers have the last name ‘William’?

SELECT last_name
FROM customer
WHERE last_name = 'Williams';

SELECT first_name
FROM customer
WHERE first_name = 'William';

-- I believe there are zero customers with last name 'William', although that's a first name and I found 
-- one person with last name 'Williams' and one person with first name 'William'


-- 5. What store employee (get the id) sold the most rentals?

SELECT COUNT(staff_id), staff_id
FROM rental
GROUP BY staff_id;


-- Seems like there are only 2 employees here, at least we know our company isn't going bankrupt from payroll..
-- I just figured out you can do commas like this, I think employee #1 rented 36 more DVDs than employee #2.


-- 6. How many different district names are there?

SELECT DISTINCT COUNT(district)
FROM address;

-- So you have 2 employees and 603 locations...?? How tf..


-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT COUNT(actor_id), actor_id
FROM film_actor
GROUP BY actor_id
ORDER BY COUNT DESC;

-- I think Actor #107 has the most films at 42


-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT COUNT(last_name)
FROM customer
WHERE last_name LIKE '%es';

-- Looks like we have 21 people with last names ending in 'es'.


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers

SELECT amount, payment_id
FROM payment
WHERE amount > 0;

-- Uhhhh, none I guess??


-- with ids between 380 and 430? (use group by and having > 250)

-- Also none? Although I feel like the payment table got messed up.. So instead of just copping out here,
-- I'll return some negative values. 

SELECT amount, COUNT(payment_id)
FROM payment
WHERE amount < 0
GROUP BY amount;

-- These negative amounts don't have any IDs below like 15000 or something, but somehow there are 3214 payments of
-- 425.01 being paid TO customers apparently.


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?

SELECT COUNT(rating), rating
FROM film
GROUP BY rating
ORDER BY COUNT DESC;

-- 1000 movies came out in 2006? Looks like PG-13 had the most with 223 releases.