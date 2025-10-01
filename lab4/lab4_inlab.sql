-- q1
SELECT department, COUNT(*) AS number_of_students
FROM students
GROUP BY department;


-- q2
SELECT department, AVG(gpa) AS average_gpa
FROM students
GROUP BY department
HAVING AVG(gpa) > 3.0;


-- q3
SELECT course_id, AVG(fee) AS average_fee
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
GROUP BY course_id;


-- q4
SELECT department, COUNT(*) AS number_of_faculty
FROM faculty
GROUP BY department;


-- q5
SELECT faculty_id, name, salary
FROM faculty
WHERE salary > (SELECT AVG(salary) FROM faculty);


-- q6
SELECT student_id, name, gpa
FROM students
WHERE gpa > ANY (SELECT gpa FROM students WHERE department = 'CS');



-- q7
SELECT *
FROM (SELECT * FROM students ORDER BY gpa DESC)
WHERE ROWNUM <= 3;



-- q8
SELECT s.student_id, s.name
FROM students s
WHERE NOT EXISTS (
    SELECT course_id
    FROM enrollments e
    JOIN students s ON e.student_id = s.student_id
    WHERE s.name = 'Ali'
    MINUS
    SELECT course_id
    FROM enrollments e2
    WHERE e2.student_id = s.student_id
);



-- q9
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
GROUP BY s.department;


-- q10
SELECT DISTINCT c.course_id, c.course_name
FROM courses c
JOIN enrollments e ON c.course_id = e.course_id
WHERE e.student_id IN (
    SELECT student_id
    FROM students
    WHERE gpa > 3.5
);