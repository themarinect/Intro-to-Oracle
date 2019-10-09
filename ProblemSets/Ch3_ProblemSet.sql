--Khang Ho
--Date: 01/28/19

--ch3p1
SELECT last_name AS "Employee", salary AS "Salary"
FROM employees
WHERE salary NOT BETWEEN 4000 AND 6000
ORDER BY 2 DESC;

--ch3p2
SELECT s_last || ', ' || s_first AS "Student", s_dob AS "Date of Birth"
FROM student
WHERE s_dob BETWEEN '01-JAN-98' AND '31-DEC-98'
ORDER BY s_last;

--ch3p3
SELECT bldg_code AS "Building Code", room AS "ROOM", capacity AS "Capacity"
FROM location
WHERE capacity > 100
       AND room LIKE '1%'
ORDER BY capacity;

--ch3p4
SELECT employee_id || ': ' || last_name AS "Employee", job_id AS "Job Title"
FROM employees
WHERE job_id LIKE '%MAN' OR job_id LIKE '%MGR'
       AND commission_pct IS NULL
ORDER BY employee_id;

--ch3p5
SELECT call_id AS "Call ID", course_name AS "Course Name"
FROM course
WHERE course_name LIKE '%Systems%'
ORDER BY call_id;

--ch3p6
SELECT s_first || ' ' || s_mi || '. ' || s_last AS "Full Name", s_dob AS "Date of Birth", 
        extract(year from sysdate) - extract(year from s_dob) AS "Age"
FROM student
ORDER BY 3;

--ch3p7
SELECT last_name || ', ' || job_id AS "Employees", salary AS "Salary"
FROM employees
WHERE salary BETWEEN &low_salary AND &high_salary
ORDER BY last_name;

--ch3p8
SELECT department_id, &&column_name
FROM departments
WHERE department_id > &restrict_number
ORDER BY 2;
UNDEFINE column_name

--ch3p9
/*Display name, age, sex, and arrival date for all animals whose weight between a given lowest and highest weight (prompt the user
to enter two weights) and arrived before year 2019. Sort in descending order by animal's name  */
SELECT animal_name AS "Animal Name", animal_age AS "Age", animal_sex AS "Sex", arrival_date AS "Date Arrived"
FROM animal
WHERE animal_weight BETWEEN &lowest_weight AND &highest_weight
       AND arrival_date < '01-JAN-19'
ORDER BY animal_name DESC;
       
