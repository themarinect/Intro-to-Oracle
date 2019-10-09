--Query 1:
/*This query returns employee id, first name, last name, and hire date 
for all employees hired before 01/01/2016 and have salary less than 6000. Sort in the order of employee ID*/
SELECT emp_id as "Employee ID",
        first_name as "First Name",
        last_name as "Last Name",
        hire_date as "Hired Date"
FROM cardinal_employees
WHERE hire_date < '01-JAN-16' AND salary < 6000
ORDER BY 1;

--Query 2:
/*This query returns manufacturer name, address, and check if the manufacturer is domestic or international.
Sort in the order of manufacturer name*/
SELECT manu_name AS "Manufacturer Name",
        street || ', ' || city || ', ' || state || ' ' || zip AS "Address",
        DECODE(international_or_domestic, 'D', 'Domestic',
                                          'I', 'International',
                                                'N/A') AS "Origin"
FROM cardinal_manufacturers
ORDER BY 1;

--Query 3:
/*This query returns the average order amount for each customer.
Sort in the order of order amount.*/
SELECT customer_id AS "Customer ID",
        to_char(AVG(total_price),'$99999.99') AS "Average Order Price"
FROM cardinal_orders
GROUP BY customer_id
ORDER BY 2;

--Query 4:
/*This query returns ndc, medication name, manufacturer name, and unit of all medication in database.
Sort in order of medication name*/
SELECT m.ndc AS "NDC",
        m.medication_name AS "Medication Name",
        ma.manu_name AS "Manufacturer Name",
        m.unit AS "Unit"
FROM cardinal_medication m JOIN cardinal_manufacturers ma ON m.manu_id = ma.manu_id
ORDER BY 2;

--Query 5:
/*This query returns employee id, first name, last name, and salary of all employees that have a salary greater than
the average salary of the company. Sort in order of salary*/
SELECT emp_id AS "Employee ID",
        first_name AS "First Name",
        last_name AS "Last Name",
        to_char(salary,'$99,999.99') AS "Salary"
FROM cardinal_employees
WHERE salary > (SELECT AVG(salary) FROM cardinal_employees)
ORDER BY 4 DESC;

--Query 6:
/*This query returns employee id, first name, last name, job title, and salary 
of the lowest paid employee for that supervisor. Exclude whose supervisor is not known.
Exclude groups where salary is less than 6000. Sort in order of salary.*/       
SELECT emp_id AS "Supervisor ID",
        first_name || ' ' || last_name AS "Name",
        job_title AS "Job Title",
        MIN(salary) AS "Smallest Salary in Group"
FROM cardinal_employees
WHERE supervisor_id IS NOT NULL
GROUP BY emp_id, first_name || ' ' || last_name, job_title
HAVING MIN(salary) >= 6000
ORDER BY "Smallest Salary in Group";

--Query 7:
/*This query returns customer id, NDC, quantity, oder date, and calculates the expected delivery date.
The delivery date would be the first Monday following the order date. Sort in the ascending order of order date*/ 
SELECT customer_id AS "Customer ID",
        ndc AS "NDC",
        quantity AS "Quantity",
        order_date AS "Order Date",
        NEXT_DAY(order_date,'MONDAY') AS "Expected Delivery Date"
FROM cardinal_orders
ORDER BY order_date;

--Query 8:
/*This query returns first name, last name, and hire date of all employees.
Format the hire date in Month, day, yyyy (ex: January 1st, 2019). Sort in order of hire date*/
SELECT first_name AS "First Name",
        last_name AS "Last Name",
        trim(to_char(hire_date,'Month')) || ' ' || to_char(hire_date,'dth, YYYY') AS "Hire Date"
FROM cardinal_employees
ORDER BY 3;

--Query 9:
/*This query returns employee id, first name, last name, and salary
of all employees who have salary equal to average salary of their department (job title).
Sort in order of salary*/
SELECT emp_id AS "Employee ID", 
        first_name AS "First Name", 
        last_name AS "Last Name", 
        to_char(salary,'$99,999') AS "Salary"
FROM cardinal_employees main
WHERE salary IN (SELECT AVG(salary) 
                  FROM cardinal_employees sub 
                  WHERE main.job_title = sub.job_title)
ORDER BY salary;
     
--Query 10:
/*This query returns customer ID and customer name of all customers who have not ordered medication from Cardinal.
Sort in the order of customer ID.*/      
SELECT c.customer_id AS "Customer ID", 
        c.company_name AS "Customer Name"
FROM cardinal_customers c LEFT OUTER JOIN cardinal_orders o
ON c.customer_id = o.customer_id WHERE o.customer_id IS NULL
ORDER BY 1;

        