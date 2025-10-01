-- q11
SELECT *
FROM employees
WHERE hire_date BETWEEN DATE '2005-01-01' AND DATE '2006-12-31';


-- q12
SELECT *
FROM employees
WHERE manager_id IS NULL;


-- q13
SELECT *
FROM employees
WHERE salary < ALL (SELECT salary
                    FROM employees
                    WHERE salary > 8000);

-- q14
SELECT *
FROM employees
WHERE salary > ANY (SELECT salary
                    FROM employees
                    WHERE department_id = 90);


-- q15
SELECT *
FROM departments d
WHERE EXISTS (SELECT 1
              FROM employees e
              WHERE e.department_id = d.department_id);


-- q16
SELECT *
FROM departments d
WHERE NOT EXISTS (SELECT 1
                  FROM employees e
                  WHERE e.department_id = d.department_id);


-- q17
SELECT *
FROM employees
WHERE salary NOT BETWEEN 5000 AND 15000;


-- q18
SELECT *
FROM employees
WHERE department_id IN (10, 20, 30)
  AND department_id <> 40;


-- q19
SELECT *
FROM employees
WHERE salary < (SELECT MIN(salary)
                FROM employees
                WHERE department_id = 50);


-- q20
SELECT *
FROM employees
WHERE salary > (SELECT MAX(salary)
                FROM employees
                WHERE department_id = 90);