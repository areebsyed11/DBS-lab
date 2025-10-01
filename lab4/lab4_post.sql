-- q11
SELECT s.department, SUM(e.fee) AS total_fees
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
GROUP BY s.department
HAVING SUM(e.fee) > 1000000;


-- q12
SELECT department, COUNT(*) AS highly_paid_faculty_count
FROM faculty
WHERE salary > 100000
GROUP BY department
HAVING COUNT(*) > 5;


-- q13
DELETE FROM students
WHERE gpa < (SELECT AVG(gpa) FROM students);


-- q14
DELETE FROM courses
WHERE course_id NOT IN (SELECT DISTINCT course_id FROM enrollments);


-- q15
CREATE TABLE HighFee_Students AS
SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM enrollments e
    WHERE e.student_id = s.student_id
    GROUP BY e.student_id
    HAVING SUM(e.fee) > (SELECT AVG(fee) FROM enrollments)
);


-- q16
INSERT INTO Retired_Faculty
SELECT *
FROM faculty
WHERE joining_date < (SELECT MIN(joining_date) FROM faculty);


-- q17
SELECT department, total_fees
FROM (
    SELECT s.department, SUM(e.fee) AS total_fees
    FROM enrollments e
    JOIN students s ON e.student_id = s.student_id
    GROUP BY s.department
    ORDER BY total_fees DESC
)
WHERE ROWNUM = 1;



-- q18
SELECT course_id, COUNT(student_id) AS enrollment_count
FROM enrollments
GROUP BY course_id
ORDER BY enrollment_count DESC
FETCH FIRST 3 ROWS ONLY;


-- q19
SELECT s.student_id, s.name, s.gpa, COUNT(e.course_id) AS courses_enrolled
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE s.gpa > (SELECT AVG(gpa) FROM students)
GROUP BY s.student_id, s.name, s.gpa
HAVING COUNT(e.course_id) > 3;


-- q20
INSERT INTO Unassigned_Faculty
SELECT f.*
FROM faculty f
WHERE f.faculty_id NOT IN (
    SELECT DISTINCT faculty_id
    FROM teaches
    WHERE faculty_id IS NOT NULL
);