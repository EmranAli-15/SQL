CREATE DATABASE university_db;


CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(60) NOT NULL,
    frontend INT NOT NULL,
    backend INT NOT NULL,
    status VARCHAR(20)
);
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark)
VALUES
('Sameer', 21, 'sameer@example.com', 48, 60),
('Zoya', 23, 'zoya@example.com', 52, 58),
('Nabil', 22, 'nabil@example.com', 37, 46),
('Rafi', 24, 'rafi@example.com', 41, 40),
('Sophia', 22, 'sophia@example.com', 50, 52),
('Hasan', 23, 'hasan@gmail.com', 43, 39);


CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(20) NOT NULL,
    credits INT NOT NULL
);
INSERT INTO courses (course_name, credits)
VALUES
('Next.js', 3),
('React.js', 4),
('Databases', 3),
('Prisma', 3);

CREATE TABLE enrollment (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id),
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);
INSERT INTO enrollment (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);






--------------------------------------------------------------------------
-- 1 -- Insert a new student record.
INSERT INTO students (student_name, age, email, frontend_mark, backend_mark)
VALUES ('Emran Ali', 24, 'emran@gmail.com', 45, 37);
--------------------------------------------------------------------------


--------------------------------------------------------------------------
-- 2 -- Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT student_name FROM students WHERE student_id in (SELECT student_id FROM enrollment
WHERE course_id = (SELECT course_id FROM courses WHERE course_name = 'Next.js'));


SELECT DISTINCT ON (s.student_id) s.student_name FROM students as s
JOIN enrollment as e ON s.student_id = e.student_id
JOIN courses as c ON e.course_id = (SELECT course_id FROM courses WHERE course_name = 'Next.js')
--------------------------------------------------------------------------



--------------------------------------------------------------------------
-- 3 -- Insert a new student record.

UPDATE students
SET status = 'Awarded'
WHERE student_id = (SELECT s.student_id FROM students as s
ORDER BY (s.frontend_mark + s.backend_mark) DESC LIMIT 1);
--------------------------------------------------------------------------




--------------------------------------------------------------------------
-- 4 -- Delete all courses that have no students enrolled.

SELECT DISTINCT ON(c.course_id) c.course_name FROM courses as c
JOIN enrollment as e ON c.course_id = e.course_id;


DELETE FROM courses WHERE course_id NOT IN (SELECT DISTINCT ON(c.course_id) c.course_id FROM courses as c
JOIN enrollment as e ON c.course_id = e.course_id);


DELETE FROM courses c
WHERE NOT EXISTS (
    SELECT 1 
    FROM enrollment e
    WHERE e.course_id = c.course_id
);

SELECT * FROM courses c
WHERE NOT EXISTS (
    SELECT 1 
    FROM enrollment e
    WHERE e.course_id = c.course_id
);
--------------------------------------------------------------------------







--------------------------------------------------------------------------
-- 5 -- Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name FROM students
LIMIt 2 OFFSET 2;
--------------------------------------------------------------------------





--------------------------------------------------------------------------
-- 6 -- Retrieve the course names and the number of students enrolled in each course.

SELECT c.course_name, COUNT(e.student_id) AS total_students
FROM courses c
JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_id;
--------------------------------------------------------------------------





--------------------------------------------------------------------------
-- 7 -- Calculate and display the average age of all students.

SELECT ROUND(AVG(age), 2) as average_age FROM students;
--------------------------------------------------------------------------





--------------------------------------------------------------------------
-- 8 -- Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name, email FROM students WHERE email LIKE '%example.com%';
--------------------------------------------------------------------------