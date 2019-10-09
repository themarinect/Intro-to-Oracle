--Khang Ho
--3/24/19

--ch8p1
SELECT s_first || ' ' || s_last AS "Enrolled Student"
FROM student
WHERE s_id IN (SELECT s_id FROM enrollment);

--ch8p2
SELECT employee_id, last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
       AND department_id = (SELECT d.department_id
                            FROM departments d, locations l
                            WHERE d.location_id = l.location_id AND l.city LIKE '%San Francisco')
ORDER BY 3 DESC;

--ch8p3
SELECT last_name, department_id, salary
FROM employees main
WHERE salary IN (SELECT AVG(salary) 
                  FROM employees sub 
                  WHERE main.department_id = sub.department_id)
ORDER BY 1;

--ch8p4
SELECT last_name, job_id, salary AS "Total Sal"
FROM employees
WHERE job_id = 'SA_REP' 
       AND salary > (SELECT MIN(salary) 
                     FROM employees 
                     WHERE job_id LIKE '%MAN' OR job_id LIKE '%MGR')
ORDER BY 3;

--ch8p5
UNDEFINE last_name;
SELECT last_name, hire_date
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE last_name = '&&last_name')
      AND last_name <> '&last_name';

--ch8p6
SELECT department_id, last_name, job_id
FROM employees
WHERE department_id = (SELECT department_id 
                        FROM departments 
                        WHERE department_name = 'Executive');
                        
--ch8p7
/*Write a query to display animal's name, animal's age, animal's gender, and arrival date as a format of mm/dd/yyyy
for any animal who is the lightest in weight for its own breed.*/
SELECT animal_name AS "Name", animal_age AS "Age", animal_sex AS "Gender", to_char(arrival_date,'mm/dd/yyyy') AS "Arrival Date"
FROM animal main
WHERE animal_weight = (SELECT MIN(animal_weight)
                        FROM animal sub 
                        WHERE sub.breed_id = main.breed_id);