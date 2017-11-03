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
FROM film_actor


5. Using film_category table, return film IDs
and category IDs WHERE category IDs
are BETWEEN 3 and 10 (including 3 and
10).
6. Using address table, return the district
names that have city IDs greater than
300 OR less than 250
SQL Exercises II (cont’d)
65
7. Using film table, create a SQL statement that
uses the LIMIT, WHERE, ILIKE, and %
wildcard to LIMIT the output to first 20 movies
where “Awe-Inspiring” is in the description.
ORDER BY movie name, alphabetically.
Return the movie name, description, and
rental rate.
8. ADVANCED: Using country table, return the
country IDs and names WHERE the country
name starts with ‘A’, ‘B’, OR ends in ‘esh’. 


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









