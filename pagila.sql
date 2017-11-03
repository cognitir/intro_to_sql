/* Please tell me what our most expensive film rental rate is */
SELECT * FROM film ORDER BY rental_rate DESC LIMIT 1;

/* Please tell me what the average rental_rate is */
SELECT AVG(rental_rate) FROM film;

/* Please tell provide me all the films that are under 60 minutes long */
SELECT * FROM film WHERE length < 60

/* Please tell me the average rental rate for films under 60 minutes */
SELECT avg(rental_rate) FROM film WHERE length < 60;


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














