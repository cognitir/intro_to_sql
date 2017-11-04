/* You are asked to provide an inventory report for
a client. The report should include product
name, stock information, supplier id, unit price,
units on order & reorder level. For this report
only include products that are still available
(those not available are marked with a ‘1’ under
discontinued). */

SELECT productname, unitsinstock, supplierid, unitprice, unitsonorder, reorderlevel
FROM products
WHERE discontinued <> 1;

/* Which type of discount was most frequently
given? Produce a table set showing the
frequency of each type of discount provided.
(i.e., How many times was discount of 0, 0.05,
etc.. applied?), along with the total $ value of the discounts */

SELECT discount, COUNT(orderid), (discount * COUNT(orderid)) as "Total"
FROM order_details
GROUP BY discount;

/* How many unique customers have made a
purchase in our system? What percent of these customers are
"five and done" (make less than 5 purchases ever)? */

SELECT count(*)::float / (SELECT count(*) FROM customers) AS "Percent Customers With < 5 Orders" FROM
customers WHERE customerid IN (SELECT customerid
FROM orders
GROUP BY customerid
HAVING count(*) <= 5)

/*Among these customers that have at least
one purchase we wish to target our most
active shoppers for our “Northwind Loyalty
Program”, a program that sends special
offers, coupons, and event information. If
we want the top 9 active customers- active is defined as
after Jan 1st, 1997, who
(customerids is fine for now) should we
choose? */

SELECT customerid, count(orderid)
FROM orders
WHERE orderdate > '1997-01-01'
GROUP BY customerid
ORDER BY count(orderid) DESC
LIMIT 9;

/* A consultant external to Northwind is doing
an analysis on seafood. She wants a list
that includes product name, unit price,
units in stock, units on order, and reorder
level for any seafood products. */

SELECT p.productname, p.unitprice, p.unitsinstock, p.reorderlevel, p.unitsonorder
FROM products p
JOIN categories c ON c.categoryid = p.categoryid
WHERE c.categoryname ILIKE '%seafood%'

/* Northwind analysts are wondering why
some of the more expensive products are
not selling as well as they once did. They
ask to see a list of products that have a unit
price above the mean unit price. Include
product name, quantity per unit, unit price,
and supplier id. Perplexingly, they also want to see in this dataset
the MINIMUM unit price product to compare*/

SELECT productname, quantityperunit, unitprice, supplierid
FROM products
WHERE unitprice > (SELECT avg(unitprice) FROM products)
UNION
SELECT productname, quantityperunit, unitprice, supplierid
FROM products
WHERE unitprice = (SELECT min(unitprice) FROM products)


/* A recent study came out in The Economist
stating that cities beginning with “m” spent
more on products than other cities. Your
manager reads this and asks you to provide
order id & order date information for any
company (customer) located in a city that starts
with “m.” Your manager will need to have a
contact name and phone number for each of
these orders as well. */

SELECT o.orderid, o.orderdate, c.companyname, c.city, c.contactname, c.phone
FROM customers c
JOIN orders o ON o.customerid = c.customerid
WHERE c.city ILIKE 'M%'

/* Recently, Northwind has lost business due to
efficiency issues. Identify any orders that were
shipped after the required delivery date
(requireddate). Within these orders include
order id, employee id, and which company was
in charge of the shipping, including shipper
company name and shipper phone number.
(Note: shipvia is the shipper id for orders table) */

SELECT o.employeeid, s.phone, s.companyname
FROM orders o
JOIN shippers s ON s.shipperid = o.shipvia
WHERE o.shippeddate > o.requireddate

/* ADVANCED: Assume that at Northwind we
calculate revenue in the following way:
𝑅𝑒𝑣𝑒𝑛𝑢𝑒 $$$ = 1 − 𝑑𝑖𝑠𝑐𝑜𝑢𝑛𝑡 ∗ 𝑄𝑢𝑎𝑛𝑡𝑖𝑡𝑦 ∗ (𝑈𝑛𝑖𝑡 𝑃𝑟𝑖𝑐𝑒)
Create a new column that shows the
revenue brought in from each product in
each order. Include the product name as
well so we can begin to understand the key
drivers of our business.

As a note: Unit Prices will vary, so the
company policy is to always use the unit
price that aligns with a specific order.
*/

SELECT CONCAT('$',ROUND(((1 - od.discount) * od.quantity * od.unitprice)::numeric, 2)), od.productid, p.productname
FROM order_details od
JOIN products p ON p.productid = od.productid

/* ADVANCED: The Federal Trade
Commission has requested information
pertaining to company discounts. Provide a
report for the FTC that includes the
company id, name, and average discount
received. The FTC is only interested in
obtaining this information for companies
receiving an average discount on orders
that is above the overall average discount
across all orders in the Northwind system. */

SELECT c.customerid, c.companyname, AVG(od.discount)
FROM order_details od
JOIN orders o ON o.orderid = od.orderid
JOIN customers c ON c.customerid = o.customerid
WHERE discount >
    (SELECT AVG(discount)
    FROM order_details)
GROUP BY c.customerid, c.companyname
ORDER BY AVG(od.discount) DESC


/* Which employee was responsible for the most late shipments? */
SELECT o.employeeid, CONCAT(e.firstname, ' ', e.lastname), count(*)
FROM orders o
JOIN employees e ON e.employeeid = o.employeeid
WHERE shippeddate > requireddate
GROUP BY o.employeeid, CONCAT(e.firstname, ' ', e.lastname)
ORDER BY count(*) desc