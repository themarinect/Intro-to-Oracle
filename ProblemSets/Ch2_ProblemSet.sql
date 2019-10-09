--Khang Ho
--Date: 01/14/19


--ch2p1
Create a query to display unique student classes from the STUDENT table.  Label the column “Classification"
SELECT UNIQUE s_class AS "Classification"
FROM student;

--ch2p2
Create a query to display the full name (lastname, firstname), job, hiredate and employee number for each employee, 
with the employee number appearing first. Name the column heads Emp#, Employee, Job Title, and Date Hired, respectively.
The first records of the results are shown below (there will be more records in the full output.)
SELECT employee_id AS "EMP#", 
       last_name || ', ' || first_name AS "Employee",
       job_id AS "Job Title",
       hire_date AS "Date Hired"
FROM employees;

--ch2p3
Display the full name of the faculty member, along with their phone number, as shown by the output below.  There is just one column.
SELECT f_first || ' ' || f_mi || '. ' || f_last || ': ' || f_phone AS "Faculty Name: Phone"
FROM faculty;

--ch2p4
Select the employee name and text as shown below, the full salary (salary plus commission percent times 1000.  
Values should be shown, even if there is a null value.  Use the alternative quote delimiter and column headings as shown below
SELECT last_name || '''s full salary is: ' AS "Employee",
       NVL(salary,0) + NVL(commission_pct * 1000,0) AS "Full Salary"
FROM employees;

--ch2p5
This exercise illustrates date arithmetic.  You can subtract one date from another to get the number of days in between.  Also it asks you to change the default order of the results.
Make a query from the job_history table that lists the employee’s id, their start date, end date, and the number of days of employment.  Order the resulting rows by the days of employment
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
