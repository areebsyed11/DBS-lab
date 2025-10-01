-- q11
ALTER TABLE Employees
ADD CONSTRAINT unique_bonus UNIQUE (bonus);

-- q12
ALTER TABLE Employees
ADD dob DATE;

ALTER TABLE Employees
ADD CONSTRAINT chk_age_18 CHECK (MONTHS_BETWEEN(SYSDATE, dob)/12 >= 18);

-- q13
INSERT INTO Employees (emp_id, full_name, salary, dept_id, dob, age)
VALUES (2, 'Test Invalid', 25000, 10, DATE '2015-01-01', 10);

-- q14
ALTER TABLE Employees DROP CONSTRAINT fk_emp_dept;

INSERT INTO Employees (emp_id, full_name, salary, dept_id)
VALUES (3, 'Wrong Dept', 30000, 999); 

ALTER TABLE Employees
ADD CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id)
REFERENCES departments (dept_id);

-- q15
ALTER TABLE Employees DROP COLUMN age;
ALTER TABLE Employees DROP COLUMN city;

-- q16
SELECT d.dept_id, d.dept_name, e.emp_id, e.full_name
FROM departments d
LEFT JOIN Employees e ON d.dept_id = e.dept_id;

-- q17
ALTER TABLE Employees RENAME COLUMN salary TO monthly_salary;

-- q18
SELECT d.dept_id, d.dept_name
FROM departments d
WHERE d.dept_id NOT IN (SELECT dept_id FROM employees WHERE dept_id IS NOT NULL);

-- q19
TRUNCATE TABLE students;

-- q20
SELECT dept_id, COUNT(*) AS emp_count
FROM Employees
GROUP BY dept_id
ORDER BY emp_count DESC
FETCH FIRST 1 ROW ONLY;