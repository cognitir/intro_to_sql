/* You are asked to provide an inventory report for
a client. The report should include product
name, stock information, supplier id, unit price,
units on order & reorder level. For this report
only include products that are still available
(those not available are marked with a ‘1’ under
discontinued). */

/* Which type of discount was most frequently
given? Produce a table set showing the
frequency of each type of discount provided.
(i.e., How many times was discount of 0, 0.05,
etc.. applied?), along with the total $ value of the discounts */

/* How many unique customers have made a
purchase in our system? What percent of these customers are
"one and done" (make only one purchase ever)? */

/*Among these customers that have at least
one purchase we wish to target our most
active shoppers for our “Northwind Loyalty
Program”, a program that sends special
offers, coupons, and event information. If
we want the top 9 active customers, who
(customerids is fine for now) should we
choose? */

/* A consultant external to Northwind is doing
an analysis on seafood. She wants a list
that includes product name, unit price,
units in stock, units on order, and reorder
level for any seafood products. */

/* Northwind analysts are wondering why
some of the more expensive products are
not selling as well as they once did. They
ask to see a list of products that have a unit
price above the mean unit price. Include
product name, quantity per unit, unit price,
and supplier id. */

/* A recent study came out in The Economist
stating that cities beginning with “m” spent
more on products than other cities. Your
manager reads this and asks you to provide
order id & order date information for any
company (customer) located in a city that starts
with “m.” Your manager will need to have a
contact name and phone number for each of
these orders as well. */

/* Recently, Northwind has lost business due to
efficiency issues. Identify any orders that were
shipped after the required delivery date
(requireddate). Within these orders include
order id, employee id, and which company was
in charge of the shipping, including shipper
company name and shipper phone number.
(Note: shipvia is the shipper id for orders table) */


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