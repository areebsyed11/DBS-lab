-- q1
SELECT SUM(salary) AS total_salary
FROM employees;

-- q2
SELECT AVG(salary) AS average_salary
FROM employees;

-- q3
SELECT manager_id, COUNT(*) AS num_employees
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;

-- q4
SELECT *
FROM employees
WHERE salary = (SELECT MIN(salary) FROM employees);


-- q5
SELECT TO_CHAR(SYSDATE, 'DD-MM-YYYY') AS today
FROM dual;


-- q6
SELECT TO_CHAR(SYSDATE, 'DAY MONTH YYYY') AS full_date
FROM dual;


-- q7
SELECT *
FROM employees
WHERE TO_CHAR(hire_date, 'DAY') = 'WEDNESDAY';


-- q8
SELECT MONTHS_BETWEEN(DATE '2025-01-01', DATE '2024-10-01') AS months_diff
FROM dual;


-- q9
SELECT first_name, last_name, MONTHS_BETWEEN(SYSDATE, hire_date) AS months_worked
FROM employees;


-- q10
SELECT last_name, SUBSTR(last_name, 1, 5) AS first_5_chars
FROM employees;