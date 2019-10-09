--Khang Ho
--2/17/2019

--ch5p1
SELECT last_name || ' earns' || to_char(salary,'$9,999.99') || ' monthly but wants' || to_char(NVL(salary*3,0),'$9,999.99')
        AS "Dream Salaries"
FROM employees
ORDER BY salary;

--ch5p2
SELECT last_name AS "Last name", hire_date AS "Hire Date",
        'Monday' || ', ' || to_char(next_day(add_months(hire_date,12),'Monday'),'"the" Ddspth "of" fmMonth, YYYY') AS "Date of Annual Review"
FROM employees
WHERE job_id LIKE 'AD%'
ORDER BY 1;

--ch5p3
SELECT animal_name AS "Name", 
        
        animal_age || ' ' || 
        (CASE WHEN animal_age = 1 THEN 'year'
               ELSE 'years'
        END)  AS "Age",
        
        animal_weight || ' lbs' AS "Weight",
        
        (CASE WHEN animal_weight <= 15 THEN 'CITY'
              WHEN animal_weight > 15 AND animal_weight < 40 THEN 'SUBURB'
              ELSE 'RURAL'
        END) AS "Ideal Residence"
FROM animal
WHERE arrival_date > to_date('March 1,2018','Month DD, YYYY')
ORDER BY animal_weight;

--ch5p4
DEFINE last_digits = substr(f_phone,-2,1) + substr(f_phone,-1,1);
SELECT f_first || ' ' || f_mi || '. ' || f_last AS "Faculty",

        f_pin AS "Old PIN",
        
        substr(loc_id,length(loc_id)) || substr(f_phone,length(f_phone)-1,1) ||
        (CASE WHEN &last_digits < 10 THEN concat(0,&last_digits)
               ELSE to_char(&last_digits)
         END) AS "New PIN"
FROM faculty;

--ch5p5
SELECT bldg_code AS "Building",
        room AS "Room",
        (CASE WHEN capacity < 30 THEN 'Small'
               WHEN capacity BETWEEN 30 AND 99 THEN 'Medium'
               ELSE 'Large'
         END) AS "Capacity"
FROM location;

--ch5p6
SELECT call_id, course_name,
        (CASE WHEN substr(call_id,-3,1) = 1 THEN 'Freshman'
               WHEN substr(call_id,-3,1) = 2 THEN 'Sophomore'
               WHEN substr(call_id,-3,1) = 3 THEN 'Junior'
               WHEN substr(call_id,-3,1) = 4 THEN 'Senior'
               ELSE 'Invalid Level'
         END) AS "Level"
FROM course
ORDER BY 3,1;

--ch5p7
/*The animal shelter has decided that every adopter has to have a personal passcode for security. 
The passcode is a 4-digit code only. The first part of passcode contains the number part of adopter's street address. 
The second part is made up from the sum of the last digit of adopter's zip code and phone number. 
If the passcode exceeds 4-digit length, round it up to 4 digits properly.
If the passcode is less than 4 digits, append the right-side of passcode with zero(s).*/
DEFINE passcode = regexp_replace(adopter_street, '[^0-9]','') || substr(adopter_zip,-1) + substr(adopter_phone,-1);
SELECT adopter_first || ' ' || adopter_last AS "Adopter",
        
        adopter_street AS "Address",
         
        (CASE WHEN length(&passcode) <= 4 THEN RPAD(&passcode,4,'0') 
               ELSE substr(round(&passcode,-1),1,4)
         END) AS "Passcode"
FROM adopter;