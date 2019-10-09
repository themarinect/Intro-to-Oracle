--Khang Ho
--Date: 01/14/19


--ch2p1
SELECT UNIQUE s_class AS "Classification"
FROM student;

--ch2p2
SELECT employee_id AS "EMP#", 
       last_name || ', ' || first_name AS "Employee",
       job_id AS "Job Title",
       hire_date AS "Date Hired"
FROM employees;

--ch2p3
SELECT f_first || ' ' || f_mi || '. ' || f_last || ': ' || f_phone AS "Faculty Name: Phone"
FROM faculty;

--ch2p4
SELECT last_name || '''s full salary is: ' AS "Employee",
       NVL(salary,0) + NVL(commission_pct * 1000,0) AS "Full Salary"
FROM employees;

--ch2p5
SELECT employee_id AS "Employee ID",
       start_date AS "Start Date",
       end_date AS "End Date",
       end_date - start_date AS "Days of employment"
FROM job_history
ORDER BY "Days of employment";

--ch2p6
/*Create a query to display the animal's name, animal's age, animal's sex from Animal table.
Name the column heads Name, Age, Sex respectively. And associate breed from Breed table with column named Breed*/
SELECT a.animal_name AS "Name",
       a.animal_age AS "Age",
       a.animal_sex AS "Sex",
       b.breed_name AS "Breed"
FROM animal a, breed b
WHERE a.breed_id = b.breed_id;