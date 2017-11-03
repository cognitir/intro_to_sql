/* Please provide me a list of all houses that have not yet been renovated. */

SELECT * FROM build_info WHERE yr_renovated = 0

/* Please provide a list of all houses that have been renovated */

SELECT * FROM build_info WHERE yr_renovated != 0;
SELECT * FROM build_info WHERE yr_renovated > 0;

/* Please provide me a list of all the houses and years they were built if they were built
after 1940, starting with the oldest */
SELECT yr_built, house_id
FROM build_info
WHERE yr_built >= 1940
ORDER BY yr_built ASC;


/* Please provide me all the houses that have 2-4 bedrooms, more than 1.5 bathrooms, and are in the
#3 / #4 condition */

SELECT house_ids
FROM house_details
WHERE bedrooms BETWEEN 2 AND 4
AND bathrooms > 1.5
AND condition IN (3,4);


/* Give me the exact location of houses that start with ID number of 9 */
-- use this example to show casting (house_id is originally a numeric variable)
SELECT latitude, longitude
FROM location_table
WHERE house_id LIKE '9%';

-- this would be the correct way
SELECT latitude, longitude, house_id
FROM location_table
WHERE house_id::text LIKE '9%'

/* Can you tell me how many houses were built in each year? */
SELECT yr_built, COUNT(yr_built) AS number_built
FROM build_info
GROUP BY yr_built;

/* Can you tell me how many houses were built each year between 1980 and 2000? */
-- demonstrates use of HAVING statement

SELECT yr_built, COUNT(yr_built) AS number_built
FROM build_info
GROUP BY yr_built
HAVING yr_built BETWEEN 1980 AND 2000
ORDER BY yr_built ASC;

/* Please tell me all the different categories we have available in the
pagila_mod database */

SELECT * FROM category;

/* Please provide me a list of all our customers' and employees' phone
numbers and postal codes */
SELECT phone, postal_code FROM address;

/* Rename the above query so it is more readable */
SELECT phone as "Phone Number", postal_code as "Postal Code" FROM address;

/* Please provide all the information in the city and country tables */
SELECT * FROM city JOIN country ON city.country_id = country.country_id;

/* Please give me the last 10 countries entered into the database,
which is determined by their city_id value */
SELECT * FROM city JOIN country ON city.country_id = country.country_id 
ORDER BY city_id desc LIMIT 10;

/* Please tell me what our most expensive film rental rate is */
SELECT * FROM film ORDER BY rental_rate DESC LIMIT 1;

/* Please tell me what the average rental_rate is */
SELECT AVG(rental_rate) FROM film;

/* Please tell provide me all the films that are under 60 minutes long */
SELECT * FROM film WHERE length < 60

/* Please tell me the average rental rate for films under 60 minutes */
SELECT avg(rental_rate) FROM film WHERE length < 60;