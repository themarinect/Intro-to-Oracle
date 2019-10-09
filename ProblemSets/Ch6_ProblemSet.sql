--Khang Ho
--2/23/19

--ch6p1
SELECT job_id AS "Job Title", 
        to_char(MAX(salary),'$99,999') AS "Maximum", 
        to_char(MIN(salary),'$99,999') AS "Minimum", 
        to_char(SUM(salary),'$999,999') AS "Total",
        COUNT(employee_id) AS "Number of Emps"
FROM employees
GROUP BY job_id
HAVING COUNT(employee_id) > 1
ORDER BY job_id;

--ch6p2
SELECT department_id AS "Department",
        to_char(MAX(salary) - MIN(salary),'$9,999.99') AS "Salary Difference"
FROM employees
GROUP BY department_id
HAVING (MAX(salary) - MIN(salary)) <> 0
ORDER BY department_id;

--ch6p3
SELECT manager_id AS "Manager", MIN(salary) AS "Smallest Salary in Group"
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) >= 6000
ORDER BY 2 DESC;

--ch6p4
SELECT c_sec_day AS "Days",
        to_char(c_sec_time,'HH12:MI a.m.') AS "Time",
        COUNT(c_sec_day) AS "Number of classes"
FROM course_section
GROUP BY c_sec_day,to_char(c_sec_time,'HH12:MI a.m.')
ORDER BY 1;

--ch6p5
SELECT DECODE(c_sec_day,'MTWRF','Every day of the week',
                         'MWF','Mon - Wed - Fri',
                         'Tues - Thurs') AS "Days",
        trim(LEADING '0' FROM to_char(c_sec_time,'HH12:MI a.m.')) AS "Time",
        COUNT(c_sec_day) AS "Number of classes"
FROM course_section
GROUP BY DECODE(c_sec_day,'MTWRF','Every day of the week',
                         'MWF','Mon - Wed - Fri',
                         'Tues - Thurs'),
          trim(LEADING '0' FROM to_char(c_sec_time,'HH12:MI a.m.'))
ORDER BY 1;

--ch6p6
/*Use Animal and Breed table to write a query to display breed's name, largest weight and smalles weight of the breed, 
and the number of the pet corresponding to that breed available for adoption. 
Exclude all the breed where the largest weight is less than 10 lbs and the number of pet of that breed is less than 2. Order by breed's name.*/
SELECT breed_name, MAX(animal_weight) AS "Largest weight", MIN(animal_weight) AS "Smallest weight", COUNT(breed_name) AS "Availability"
FROM animal a,breed b
WHERE a.breed_id = b.breed_id
GROUP BY breed_name
HAVING MAX(animal_weight) > 10 AND COUNT(breed_name) > 1
ORDER BY 1;
        