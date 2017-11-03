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
ORDER BY city_id DESC LIMIT 10;

/* Please tell me which employee has logged the most orders with customers */
SELECT employees.employeeid, count(orders.orderid) AS count FROM employees
JOIN orders ON orders.employeeid = employees.employeeid
GROUP BY employees.employeeid
ORDER BY count DESC

-- same query, but with aliases
SELECT e.employeeid, count(o.orderid) as count FROM employees e
JOIN orders o on o.employeeid = e.employeeid
GROUP BY e.employeeid
ORDER BY count desc

/* Please tell me which employee has generated the most revenue */
SELECT e.employeeid, CONCAT(e.firstname, ' ', e.lastname), SUM(od.unitprice * od.quantity) as revenue FROM employees e
JOIN orders o ON o.employeeid = e.employeeid
JOIN order_details od ON od.orderid = o.orderid
GROUP BY e.employeeid
ORDER BY revenue DESC;

/* Please provide me a list of each employee and their territories */
SELECT e.employeeid, CONCAT(e.firstname, ' ', e.lastname) as "Employee Name", t.territorydescription
FROM employees e
JOIN employeeterritories et ON et.employeeid = e.employeeid 
JOIN territories t ON et.territoryid = t.territoryid
ORDER BY e.employeeid

/* Can you tell me where the company most frequently shipped its orders to? */
SELECT shipcountry, COUNT(*) as "Orders Shipped" FROM orders
GROUP BY shipcountry
ORDER BY "Orders Shipped" desc

/* What are our top selling products, and how many different customers have ordered those products? */
SELECT p.productid, p.productname, count(o.orderid) as "Order Count", COUNT(DISTINCT(o.customerid)) as "Customer Count"
FROM orders o
JOIN order_details od ON od.orderid = o.orderid
JOIN products p ON p.productid = od.productid
GROUP BY p.productid
ORDER BY "Order Count" DESC

/* How many of our customers are repeat customers? */
-- example using a subquery
select count(*) FROM (SELECT o.customerid, count(o.orderid)
FROM orders o
GROUP BY o.customerid
HAVING count(o.orderid) > 1) sq

/* Which customers have the most expensive average order? Which customer has spent the most money with us? */
SELECT o.customerid, avg(od.unitprice), sum(od.unitprice * od.quantity)
FROM orders o
JOIN order_details od ON od.orderid = o.orderid
GROUP BY o.customerid

/* Provide all orders that are above the average unit price */
SELECT *, od2.unitprice FROM orders o2
JOIN order_details od2 ON o2.orderid = od2.orderid
WHERE od2.unitprice >
-- subquery used to get the average unit price of an order
(SELECT avg(od.unitprice)
FROM orders o
JOIN order_details od ON od.orderid = o.orderid)

/* Give me all employees whose last name begins with D */
SELECT * FROM employees WHERE lastname LIKE 'D%';
SELECT * FROM employees WHERE lastname ~~ 'D%';
