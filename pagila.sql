/* Please tell me what our most expensive film rental rate is */
SELECT * FROM film ORDER BY rental_rate DESC LIMIT 1;

/* Please tell me what the average rental_rate is */
SELECT AVG(rental_rate) FROM film;

/* Please tell provide me all the films that are under 60 minutes long */
SELECT * FROM film WHERE length < 60

/* Please tell me the average rental rate for films under 60 minutes */
SELECT avg(rental_rate) FROM film WHERE length < 60;

/* SELECT statement that selects
everything from the rental table. */
SELECT * from rental;

/* Using inventory table, create a
statement that employs SELECT and
WHERE to select the store IDs that are
not equal to 2. Return the timestamp for
rows that meet these requirements. */
SELECT store_id, last_update
FROM inventory
WHERE store_id <> 2;

/* Using film table, return the DISTINCT
movie ratings. */
SELECT DISTINCT(rating)
FROM film;

/* Using film_actor table, COUNT the
DISTINCT actor IDs. */
SELECT COUNT(DISTINCT(actor_id))
FROM film_actor;

/* Using film_category table, return film IDs
and category IDs WHERE category IDs
are BETWEEN 3 and 10 (including 3 and
10). */
SELECT film_id, category_id
FROM film_category
WHERE category_id BETWEEN 3 AND 10;

/* Using address table, return the district
names that have city IDs greater than
300 OR less than 250 */

SELECT district
FROM address
WHERE city_id > 300 OR city_id < 250

/* Using film table, create a SQL statement that
uses the LIMIT, WHERE, ILIKE, and %
wildcard to LIMIT the output to first 20 movies
where “Awe-Inspiring” is in the description.
ORDER BY movie name, alphabetically.
Return the movie name, description, and
rental rate. */

SELECT  title, description, rental_rate
FROM film
WHERE description ILIKE '%awe-inspiring%'
ORDER BY title ASC;

/* ADVANCED: Using country table, return the
country IDs and names WHERE the country
name starts with ‘A’, ‘B’, OR ends in ‘esh’. */

SELECT country_id
FROM country
WHERE country ILIKE '%esh';

/* Give me all countries where the second letter of the country's name is "e" */
SELECT country_id, country
FROM country
WHERE country ILIKE '_e%';

/* Create an INNER JOIN statement that joins film & film_actor. Print out the actor_id &
film_id for films with a rental rate above. $2.99. */
SELECT f.film_id, fa.actor_id
FROM film f
JOIN film_actor fa ON fa.film_id = f.film_id
WHERE f.rental_rate > 2.99

/* Create a SUBQUERY from the film table to
only select film ids for films with a rental rate
above $2.99. Create an OUTER QUERY that
prints out actor_ids and film_id from the
film_actor table for those films that meet the
criteria (Hint: Use WHERE and IN). */


SELECT f2.actor_id, f2.film_id
FROM films f2
WHERE f2.film_id IN
	(SELECT f.film_id
	FROM film f
	JOIN film_actor fa ON fa.film_id = f.film_id
	WHERE f.rental_rate > 2.99)

/* Create a SUBQUERY for film that prints
out the title, release year, & length for
films with length greater than the average
length. Sort in ascending order of length. */

SELECT title, release_year, length
FROM film

/* ADVANCED: Create an INNER JOIN statement
that provides information on all of the films at
store 2. Include information on title,
description, inventory id, and rating. */

SELECT *
FROM film f
JOIN inventory i ON f.film_id = i.film_id
WHERE i.store_id = 2

/* ADVANCED: Create an INNER JOIN statement
that counts the total number of cities in each
country. Rename the count to “total_cities”.
Sort the results by countries with maximum
amount of cities to least amount of cities.*/

SELECT co.country_id, co.country, COUNT(DISTINCT(city_id)) as "total_cities"
FROM city ci
JOIN country co on ci.country_id = co.country_id
GROUP BY co.country_id
ORDER BY "total_cities" DESC

/* SELECT the cities where the country
IDs are BETWEEN and including 75
and 100. Return respective city IDs too. */

SELECT city_id, country, country_id
FROM city
WHERE country_id BETWEEN 75 AND 100

/* In the city table, return the country ID
and number of cities in each country.
Order your results by country_id in ascending
order and limit results row count to 10. */
SELECT country_id, count(city_id)
FROM city
GROUP BY country_id
ORDER BY country_id ASC
LIMIT 10;

SELECT city.country_id, country.country, count(city_id)
FROM city
JOIN country ON country.country_id = city.country_id
GROUP BY city.country_id, country.country
ORDER BY city.country_id ASC
LIMIT 10;


/* Return the mean rental duration of the
films. */
SELECT avg(return_date - rental_date)
FROM rental

/* Return the film IDs, description, and
rental rates of films with the minimum
rental rates. */

SELECT film_id, description, rental_rate
FROM film
WHERE rental_rate = (SELECT MIN(rental_rate) FROM film);

SELECT film_id, description, rental_rate
FROM film
ORDER BY rental_rate ASC;

/* Rename the last update column in the
film category table to “last_online.”
Return just that renamed column. */

SELECT last_update as last_online FROM film_category;

/* In the inventory table, for the first 50
inventory IDs, group by store ID, and
count the number in each store. Return
store ID and the count. Rename the
count column to “total”. */

SELECT store_id, COUNT(inventory_id) as total
FROM inventory
WHERE inventory_id BETWEEN 1 AND 50
GROUP BY store_id
ORDER BY store_id ASC

/*Create an INNER JOIN statement that joins city
with country and prints out all columns.*/
SELECT *
FROM city ci
INNER JOIN country co ON ci.country_id = co.country_id

/*Create an INNER JOIN statement that joins film
with language and prints: film_id, rental_rate,
release_year, and language.*/
SELECT f.film_id, f.rental_rate, f.release_year, l.name
FROM film f
INNER JOIN language l ON f.language_id = l.language_id


/*Create an INNER JOIN statement that joins film
to film_actor. Only include: title, rental_rate,
description, rental_duration, rating, and
actor_id. */

SELECT f.title, f.rental_rate, f.description, f.rental_duration, f.rating, fa.actor_id
FROM film f
JOIN film_actor fa ON f.film_id = fa.film_id;

/* ADVANCED: find all the films that have no actors listed
HINT: use a LEFT JOIN */
SELECT f.title, f.rental_rate, f.description, f.rental_duration, f.rating, fa.actor_id
FROM film f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
WHERE fa.actor_id IS NULL;


/* Advanced: Create a SUBQUERY that
provides the customer ids for all
customers with more than 30 rentals.
Then use an OUTER QUERY to print out
the first name, last name, and email for
these valuable customers. ORDER BY
last name (starting at the end of the
alphabet). */

SELECT first_name, last_name, email
FROM customer WHERE customer_id IN
	(SELECT customer_id, count(rental_id) AS "count"
	FROM rental
	GROUP BY customer_id
	HAVING count(rental_id) > 30
	ORDER BY "count" DESC)

/* Advanced: Create a SUBQUERY that
is an INNER JOIN of inventory and
store. This subquery should produce a
list of films offered at store 1. Provide
the film title, description, rental rate,
release year, and rating. Only show
films with a G rating. */

SELECT f.film_id, f.title, f.description, f.rental_rate, f.release_year, f.rating
FROM store s
INNER JOIN inventory i ON i.store_id = s.store_id
INNER JOIN film f ON i.film_id = f.film_id
WHERE i.store_id = 1