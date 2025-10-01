create table Departments (
    dept_id int primary key,
    dept_name VARCHAR(100) not null
);

insert into Departments (dept_id, dept_name) values (1, 'Human Resources');
insert into Departments (dept_id, dept_name) values (2, 'Engineering');
insert into Departments (dept_id, dept_name) values (3, 'Marketing');
insert into Departments (dept_id, dept_name) values (4, 'Quality Assurance');

create table Employees (
    emp_id int primary key,
    emp_name varchar(100) not null,
    dept_id int,
    manager_id int,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES Employees(emp_id)
);

insert into Employees (emp_id, emp_name, dept_id, manager_id) values (1, 'DECLAN RICE', 1, NULL);
insert into Employees (emp_id, emp_name, dept_id, manager_id) values (3, 'WILLIAM SALIBA', 2, 1);
insert into Employees (emp_id, emp_name, dept_id, manager_id) values (4, 'GABRIEL', 3, 3);
insert into Employees (emp_id, emp_name, dept_id, manager_id) values (2, 'JURRIEN TIMBER', 2, 4);
insert into Employees (emp_id, emp_name, dept_id, manager_id) values (5, 'MIKEL MERINO', 1, 1);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL
);

INSERT INTO Projects (project_id, project_name) VALUES (1, 'Website Redesign');
INSERT INTO Projects (project_id, project_name) VALUES (2, 'Database Optimization');
INSERT INTO Projects (project_id, project_name) VALUES (3, 'Mobile App Development');

CREATE TABLE Employee_Projects (
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

INSERT INTO Employee_Projects (emp_id, project_id) VALUES(1, 1);  -- DECLAN RICE on Website Redesign
INSERT INTO Employee_Projects (emp_id, project_id) VALUES(2, 2);  -- JURRIEN TIMBER on Database Optimization
INSERT INTO Employee_Projects (emp_id, project_id) VALUES(3, 3);  -- WILLIAM SALIBA on Mobile App Development
INSERT INTO Employee_Projects (emp_id, project_id) VALUES(4, 1);  -- GABRIEL on Website Redesign

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL
);

INSERT INTO Students (student_id, student_name) VALUES (1, 'Emma Watson');
INSERT INTO Students (student_id, student_name) VALUES (2, 'Liam Neeson');
INSERT INTO Students (student_id, student_name) VALUES (3, 'Sophia Turner');

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    teacher_id INT,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(teacher_id)
);

INSERT INTO Courses (course_id, course_name, teacher_id) VALUES (1, 'Mathematics', 1);
INSERT INTO Courses (course_id, course_name, teacher_id) VALUES (2, 'Physics', 2);
INSERT INTO Courses (course_id, course_name, teacher_id) VALUES (3, 'Literature', 3);

CREATE TABLE Teachers (
    teacher_id INT PRIMARY KEY,
    teacher_name VARCHAR(100) NOT NULL
);

INSERT INTO Teachers (teacher_id, teacher_name) VALUES(1, 'Dr. John Doe');
INSERT INTO Teachers (teacher_id, teacher_name) VALUES(2, 'Prof. Jane Smith');
INSERT INTO Teachers (teacher_id, teacher_name) VALUES(3, 'Ms. Emily Brown');

CREATE TABLE Enrollments (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Enrollments (student_id, course_id) VALUES (1, 1);  
INSERT INTO Enrollments (student_id, course_id) VALUES (2, 2);  
INSERT INTO Enrollments (student_id, course_id) VALUES (3, 3);  

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL
);

INSERT INTO Customers (customer_id, customer_name) VALUES (1, 'Alice Johnson');
INSERT INTO Customers (customer_id, customer_name) VALUES (2, 'Bob Wilson');
INSERT INTO Customers (customer_id, customer_name) VALUES (3, 'Clara Davis');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


INSERT INTO Orders (order_id, customer_id, order_date) VALUES (1, 1, '2025-09-01');
INSERT INTO Orders (order_id, customer_id, order_date) VALUES (2, 2, '2025-09-05');
INSERT INTO Orders (order_id, customer_id, order_date) VALUES (3, 3, NULL); 

CREATE TABLE Subjects (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL
);

INSERT INTO Subjects (subject_id, subject_name) VALUES (1, 'Algebra');
INSERT INTO Subjects (subject_id, subject_name) VALUES (2, 'Thermodynamics');
INSERT INTO Subjects (subject_id, subject_name) VALUES (3, 'Poetry');



-- q11
SELECT s.student_name, t.teacher_name
FROM Students s
JOIN Teachers t ON s.city = t.city;


-- q12
SELECT e.emp_name AS employee, m.emp_name AS manager
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id;


-- q13
SELECT e.emp_id, e.emp_name
FROM Employees e
LEFT JOIN Departments d ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


-- q14
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Departments d
JOIN Employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING AVG(e.salary) > 50000;


-- q15
SELECT e.emp_id, e.emp_name, e.salary, e.dept_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employees e2
    WHERE e2.dept_id = e.dept_id
);


-- q16
SELECT d.dept_id, d.dept_name
FROM Departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.dept_id = d.dept_id AND e.salary < 30000
);


-- q17
SELECT s.student_name, c.course_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE s.city = 'Lahore';


-- q18
SELECT e.emp_name AS employee, m.emp_name AS manager, d.dept_name
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id
LEFT JOIN Departments d ON e.dept_id = d.dept_id
WHERE e.hire_date BETWEEN TO_DATE('2020-01-01','YYYY-MM-DD') AND TO_DATE('2023-01-01','YYYY-MM-DD');


-- q19
SELECT DISTINCT s.student_name
FROM Students s
JOIN Student_Course_Teacher sct ON s.student_id = sct.student_id
JOIN Teachers t ON sct.teacher_id = t.teacher_id
WHERE t.teacher_name = 'Sir Ali';


-- q20
SELECT e.emp_id, e.emp_name, e.dept_id
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id
WHERE e.dept_id = m.dept_id;