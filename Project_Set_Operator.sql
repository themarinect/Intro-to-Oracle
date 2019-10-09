--Part 4 Q1: UNION with JOIN query
--This query returns medication's NDC, medication's name, and manufacturer's name
--that have been ordered by customers.
SELECT m.ndc AS "NDC", 
        m.medication_name AS "Medication", 
        ma.manu_name AS "Manufacturer"
FROM cardinal_medication m, cardinal_manufacturers ma
WHERE m.manu_id = ma.manu_id
UNION
SELECT ndc,
        to_char(NULL),
        to_char(NULL)
FROM cardinal_orders
ORDER BY 1;

--Part 4 Q2: INTERSECT
--This query returns the list of IDs of customers who have ordered medication.
SELECT customer_id AS "Customer ID"
FROM cardinal_customers
INTERSECT
SELECT customer_id
FROM cardinal_orders
ORDER BY 1;

--Part 4 Q3: MINUS
--This query returns the manufacturer that does not have any medication available to purchase through Cardinal. 
SELECT manu_id AS "Manufacturer ID"
FROM cardinal_manufacturers
MINUS
SELECT manu_id
FROM cardinal_medication;

