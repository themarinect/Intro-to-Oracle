--Khang Ho
--02/03/19

--ch4p1
SELECT employee_id, last_name, hire_date, salary, round(salary + (salary*12.5)/100,0)  AS "New Salary"
FROM employees
WHERE hire_date LIKE '%%-%%%-&year' AND hire_date IS NOT NULL
ORDER BY hire_date;

--ch4p2
SELECT INITCAP(last_name) AS "Name", length(last_name) AS "Length", next_day(hire_date,'MONDAY') AS "First Monday"
FROM employees
WHERE last_name LIKE 'R%'
   OR last_name LIKE 'A%'
   OR last_name LIKE 'B%'
ORDER BY last_name;

--ch4p3
SELECT c_sec_id AS "Section", c_sec_day AS "Days", c_sec_duration * length(c_sec_day) AS "Weekly Duration", max_enrl AS "Max Enrollment"
FROM course_section
WHERE instr(c_sec_day,'M',1,1) = 0
  AND c_sec_duration IN (50,75,90)
ORDER BY c_sec_id;

--ch4p4
SELECT last_name AS "Employee Last Name", LPAD(salary,12,'^') AS "Salary"
FROM employees
WHERE lower(last_name) LIKE lower('%n')
  AND mod(salary,2) = 0
ORDER BY salary DESC;

--ch4p5
SELECT INITCAP(last_name) AS "Name", length(last_name) AS "Length", next_day(hire_date,'MONDAY') AS "First Monday"
FROM employees
WHERE lower(last_name) LIKE lower('&last_name%')
ORDER BY last_name;

--ch4p6
SELECT last_name, salary, salary/1000, last_name || RPAD('*', trunc(salary/1000),'*') AS "Employeed and their Salary"
FROM employees
WHERE length(RPAD('*', trunc(salary/1000),'*')) >=12
ORDER BY salary DESC;

--ch4p7
/*Create a query to display the list of animals with animal's name, sex, arrival date, 
and the number of months the animal has lived at facility since arrival date (the number of months is different based on today's date).
Sort the data order of arrival date.*/
SELECT animal_name AS "Name", animal_sex AS "Sex", arrival_date AS "Arrival Date",
       trunc(MONTHS_BETWEEN(SYSDATE,arrival_date)) AS "Month Difference"
FROM animal
ORDER BY arrival_date;


