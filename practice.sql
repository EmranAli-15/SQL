CREATE TABLE employees (
    employeeId SERIAL PRIMARY KEY,
    employeeName VARCHAR(50),
    departmentId INT REFERENCES departments(departmentId),
    salary DECIMAL(10, 2),
    hireDate DATE
);


CREATE TABLE departments (
    departmentId SERIAL PRIMARY KEY,
    departmentName VARCHAR(50)
);

INSERT INTO departments (departmentname) VALUES
('HR'),
('Marketing'),
('Finance'),
('IT'),
('Sales'),
('Engineering'),
('Customer Support'),
('Administration'),
('Research'),
('Quality Assurance');

INSERT INTO employees (employeename, departmentid, salary, hiredate) VALUES
('John Doe', 1, 60000.00, '2022-01-10'),
('Jane Smith', 2, 75000.50, '2021-05-22'),
('Bob Johnson', 3, 80000.75, '2020-11-15'),
('Alice Williams', 4, 90000.25, '2019-08-03'),
('David Lee', 5, 65000.50, '2020-03-18'),
('Sara Brown', 6, 70000.00, '2021-09-28'),
('Mike Miller', 7, 55000.75, '2022-02-05'),
('Emily Davis', 8, 95000.00, '2018-12-12'),
('Chris Wilson', 9, 72000.50, '2020-06-30'),
('Amy White', 10, 68000.25, '2021-11-09'),
('John Johnson', 1, 62000.00, '2022-01-15'),
('Jessica Thompson', 2, 78000.50, '2021-06-05'),
('Michael Harris', 3, 85000.75, '2020-11-25'),
('Emma Martinez', 4, 92000.25, '2019-09-15'),
('James Taylor', 5, 67000.50, '2020-04-08'),
('Sophia Anderson', 6, 72000.00, '2021-10-10'),
('William Jackson', 7, 56000.75, '2022-02-10'),
('Olivia Nelson', 8, 97000.00, '2018-12-20'),
('Daniel White', 9, 73000.50, '2020-07-05'),
('Ava Wilson', 10, 69000.25, '2021-11-15'),
('Matthew Brown', 1, 63000.00, '2022-01-20'),
('Emily Garcia', 2, 76000.50, '2021-06-15'),
('Christopher Allen', 3, 86000.75, '2020-12-05'),
('Madison Hall', 4, 93000.25, '2019-09-25'),
('Andrew Cook', 5, 68000.50, '2020-04-13'),
('Abigail Torres', 6, 73000.00, '2021-10-20'),
('Ethan Murphy', 7, 57000.75, '2022-02-15'),
('Ella King', 8, 98000.00, '2018-12-28'),
('Nathan Rivera', 9, 74000.50, '2020-07-15'),
('Mia Roberts', 10, 70000.25, '2021-11-20');




----------------------------------------------------------------------
-- 1. Inner Join to retrieve employee and department information
SELECT * FROM employees as em
JOIN departments as de ON em.departmentid = de.departmentid;

-- SHORT HAND FORM IF THE BOTH KEY SAME
SELECT * FROM employees
JOIN departments USING(departmentid)
----------------------------------------------------------------------




----------------------------------------------------------------------
-- 2. Show department name with average salary
SELECT de.departmentname, ROUND(avg(em.salary), 2) as Salary FROM employees as em
JOIN departments as de USING(departmentid)
GROUP BY de.departmentname;
----------------------------------------------------------------------




----------------------------------------------------------------------
-- 3. Count employee in each department
SELECT de.departmentname, count(*) as allMember FROM employees as em
JOIN departments as de ON em.departmentid = de.departmentid
GROUP BY de.departmentname
----------------------------------------------------------------------




----------------------------------------------------------------------
-- 4. Find the department name with the highest average salary
SELECT de.departmentname, ROUND(AVG(em.salary), 2) as Salary FROM employees as em
JOIN departments as de ON em.departmentid = de.departmentid
GROUP BY de.departmentname
ORDER BY Salary DESC
LIMIT 1;
----------------------------------------------------------------------




----------------------------------------------------------------------
-- 4. Count empolyees hired each year
SELECT EXTRACT(YEAR from em.hiredate) as aYear, COUNT(*) as hiredEmployees FROM employees as em
GROUP BY aYear;
----------------------------------------------------------------------