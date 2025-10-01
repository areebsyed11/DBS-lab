-- q1
CREATE TABLE Employees (
    emp_id     NUMBER PRIMARY KEY,
    emp_name   VARCHAR2(50),
    salary     NUMBER CHECK (salary > 20000),
    dept_id    NUMBER
);

-- q2
ALTER TABLE Employees RENAME COLUMN emp_name TO full_name;

-- q3
ALTER TABLE Employees DROP CONSTRAINT CHECK(salary > 20000);
INSERT INTO Employees (emp_id, full_name, salary, dept_id) VALUES (1, 'xyz', 5000, NULL);

-- q4
CREATE TABLE departments (
    dept_id   NUMBER PRIMARY KEY,
    dept_name VARCHAR2(50) UNIQUE
);

INSERT INTO departments VALUES (10, 'HR');
INSERT INTO departments VALUES (20, 'IT');
INSERT INTO departments VALUES (30, 'Finance');

-- q5
ALTER TABLE Employees
ADD CONSTRAINT fk_emp_dept FOREIGN KEY (dept_id)
REFERENCES departments (dept_id);

-- q6
ALTER TABLE Employees
ADD bonus NUMBER(6,2) DEFAULT 1000;

-- q7
ALTER TABLE Employees
ADD city VARCHAR2(20) DEFAULT 'Karachi';

ALTER TABLE Employees
ADD age NUMBER CHECK (age > 18);

-- q8
DELETE FROM Employees WHERE emp_id IN (1, 3);

-- q9
ALTER TABLE Employees MODIFY (full_name VARCHAR2(20));
ALTER TABLE Employees MODIFY (city VARCHAR2(20));

-- q10
ALTER TABLE Employees
ADD email VARCHAR2(100) UNIQUE;