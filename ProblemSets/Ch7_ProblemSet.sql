--Khang Ho
--3/18/19

--ch7p1
SELECT DISTINCT e.job_id, l.location_id, l.state_province
FROM employees e JOIN departments d ON e.department_id = d.department_id
                  JOIN locations l ON d.location_id = l.location_id
ORDER BY 1;

--ch7p2
SELECT e.last_name AS "Employee", e.job_id AS "Job Title", d.department_name AS "Department"
FROM employees e JOIN departments d ON e.department_id = d.department_id
                  AND d.department_name LIKE 'IT%'
ORDER BY 1;

--ch7p3
SELECT DISTINCT j.grade_level, d.department_name AS "Department", to_char(e.salary,'$99,999') AS "Salary"
FROM departments d JOIN employees e ON d.department_id = e.department_id 
                   JOIN job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
                   AND d.department_name LIKE 'S%'
ORDER BY 1,2,3 DESC;

--ch7p4
SELECT e.first_name || ' ' || e.last_name AS "Upper Management",
        DECODE(e.job_id,'AD_PRES','President','Vice President') AS "Job Title"
FROM employees p JOIN employees e ON p.department_id = e.department_id 
                  AND p.job_id = 'AD_PRES'
ORDER BY 1;

--ch7p5
SELECT l.city AS "City", c.country_name AS "Country"
FROM locations l RIGHT OUTER JOIN countries c ON l.country_id = c.country_id;

--ch7p6
SELECT f.f_last AS "Faculty", cs.sec_num AS "Section", cs.loc_id AS "LOC_ID", l.bldg_code AS "Building"
FROM faculty f JOIN course_section cs ON f.f_id = cs.f_id 
               JOIN location l ON cs.loc_id = l.loc_id
               AND l.bldg_code = 'BUS'
ORDER BY 1,2;

--ch7p7
SELECT e.last_name AS "Employee",
        to_char(e.hire_date,'mm/dd/yy') AS "Emp Hired",
        m.last_name AS "Manager",
        to_char(m.hire_date,'mm/dd/yy') AS "Manager Hired"
FROM employees e JOIN employees m ON e.manager_id = m.employee_id
                                   AND m.hire_date > e.hire_date
                                   AND m.hire_date BETWEEN '01-JAN-10' AND '31-DEC-10'
                                   AND e.hire_date BETWEEN '01-JAN-10' AND '31-DEC-10';
                                   
--ch7p8
/*Display breed ID, breed name, breed type, 
and the number of potential adopters from wish list table corresponding to each breed. 
Include all breeds that do not have potential adopters. Order by the number of potential adopter descending.*/
SELECT b.breed_id AS "Breed ID", b.breed_name AS "Breed Name", b.breed_type AS "Type",
        COUNT(w.breed_id) AS "Number of potential adopter"
FROM breed b LEFT OUTER JOIN wishlist w ON b.breed_id = w.breed_id
              LEFT OUTER JOIN adopter a ON w.adopter_id = a.adopter_id
GROUP BY b.breed_id, b.breed_name, b.breed_type
ORDER BY "Number of potential adopter" DESC;