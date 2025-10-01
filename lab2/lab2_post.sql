-- q11
SELECT LPAD(first_name, 15, '*') AS padded_name
FROM employees;


-- q12
SELECT LTRIM(' Oracle') AS trimmed_string
FROM dual;


-- q13
SELECT INITCAP(first_name) AS formatted_first_name,
       INITCAP(last_name) AS formatted_last_name
FROM employees;

-- q14
SELECT NEXT_DAY(DATE '2022-08-20', 'MONDAY') AS next_monday
FROM dual;


-- q15
SELECT TO_CHAR(TO_DATE('25-DEC-2023', 'DD-MON-YYYY'), 'MM-YYYY') AS month_year
FROM dual;


-- q16
SELECT DISTINCT salary
FROM employees
ORDER BY salary ASC;


-- q17
SELECT first_name, last_name, ROUND(salary, -2) AS rounded_salary
FROM employees;


-- q18
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
ORDER BY num_employees DESC
FETCH FIRST 1 ROW ONLY;


-- q19
SELECT department_id, SUM(salary) AS total_salary
FROM employees
GROUP BY department_id
ORDER BY total_salary DESC
FETCH FIRST 3 ROWS ONLY;


-- q20
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
ORDER BY num_employees DESC
FETCH FIRST 1 ROW ONLY;