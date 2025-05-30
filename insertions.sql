-- Random teachers inserted
-- INSERT INTO Teachers (name, email, category) VALUES
--     ('Muhammad Ali', 'muhammad.ali@example.com', 'Associate Professor'),
--     ('Fatima Khan', 'fatima.khan@example.com', 'Assistant Professor'),
--     ('Ahmed Hassan', 'ahmed.hassan@example.com', 'Professor'),
--     ('Aisha Rahman', 'aisha.rahman@example.com', 'Professor'),
--     ('Omar Ibrahim', 'omar.ibrahim@example.com', 'Associate Professor'),
--     ('Zainab Ahmed', 'zainab.ahmed@example.com', 'Assistant Professor'),
--     ('Yusuf Khan', 'yusuf.khan@example.com', 'Professor'),
--     ('Safiya Ali', 'safiya.ali@example.com', 'Assistant Professor'),
--     ('Ibrahim Khan', 'ibrahim.khan@example.com', 'Professor'),
--     ('Mariam Hassan', 'mariam.hassan@example.com', 'Associate Professor');


-- -- Insert 15 subjects with randomly assigned teachers
-- INSERT INTO Subjects (subject, subject_description, teacher_id) VALUES
--     ('Linguistics', 'Study of language structure and meaning', 1),
--     ('Mathematics', 'Study of numbers, quantity, and space', 2),
--     ('Computer Science', 'Study of algorithms, data structures, and computation', 3),
--     ('Psychology', 'Study of behavior and mind', 4),
--     ('Biology', 'Study of living organisms', 5),
--     ('Physics', 'Study of matter and energy', 6),
--     ('Chemistry', 'Study of substances and their properties', 7),
--     ('Sociology', 'Study of society and social behavior', 8),
--     ('Anthropology', 'Study of human societies and cultures', 9),
--     ('History', 'Study of past events and societies', 10),
--     ('Engineering Design', 'Application of engineering principles to design', 1),
--     ('Environmental Science', 'Study of the environment and ecosystems', 2),
--     ('Literature', 'Study of written works and literary techniques', 3),
--     ('Economics', 'Study of production, distribution, and consumption of goods and services', 4),
--     ('Political Science', 'Study of government systems and political behavior', 5);

-- Abdullah insertion data sample 
-- 1. Departments
INSERT INTO Departments (name) VALUES
('Computer Science'),
('Mathematics'),
('Physics'),
('Engineering'),
('Biology');

-- 2. Students
INSERT INTO Students (name, email, date_of_birth, password) VALUES
('Alice Johnson', 'alice@uni.edu', '2000-05-15', SHA2('pass123', 256)),
('Bob Smith', 'bob@uni.edu', '2001-02-28', SHA2('securepw', 256)),
('Charlie Brown', 'charlie@uni.edu', '1999-11-03', SHA2('mysecret', 256)),
('Diana Miller', 'diana@uni.edu', '2002-07-19', SHA2('diana2023', 256)),
('Ethan Davis', 'ethan@uni.edu', '2000-12-25', SHA2('ethanpass', 256));

-- 3. Teachers
INSERT INTO Teachers (name, email, category) VALUES
('Dr. Sarah Wilson', 'sarah@uni.edu', 'Professor'),
('Prof. James Clark', 'james@uni.edu', 'Associate Professor'),
('Dr. Emma Thompson', 'emma@uni.edu', 'Assistant Professor'),
('Prof. Michael Lee', 'michael@uni.edu', 'Professor'),
('Dr. Olivia Garcia', 'olivia@uni.edu', 'Associate Professor');

-- 4. Subjects
INSERT INTO Subjects (subject_name, subject_description, teacher_id) VALUES
('Calculus', 'Advanced calculus concepts', 2),
('Programming', 'Introduction to Python programming', 1),
('Quantum Physics', 'Fundamentals of quantum mechanics', 4),
('Data Structures', 'Algorithms and data organization', 1),
('Thermodynamics', 'Heat and energy transfer principles', 5);

-- 5. Courses
INSERT INTO Courses (course_name, course_description, department_id) VALUES
('CS101', 'Intro to Computer Science', 1),
('Math301', 'Advanced Calculus', 2),
('Physics201', 'Modern Physics', 3),
('Eng150', 'Engineering Fundamentals', 4),
('Bio100', 'Biology for Beginners', 5);

-- 6. Student_department
INSERT INTO Student_department (student_id, department_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 5);

-- 7. Learning_styles
INSERT INTO Learning_styles (student_id, style) VALUES
(1, 'Visual'), (2, 'Auditory'), (3, 'Read/Write'), (4, 'Kinaesthetic'), (5, 'Visual');

-- 8. Placement_tests
-- INSERT INTO Placement_tests (student_id, subject_id, score) VALUES
-- (1, 2, 0.850), (1, 4, 0.920),
-- (2, 1, 0.780), (2, 2, 0.650),
-- (3, 3, 0.950), (3, 5, 0.880),
-- (4, 4, 0.720), (4, 1, 0.680),
-- (5, 5, 0.790), (5, 3, 0.820);

-- 9. Subjects_good_at
-- INSERT INTO Subjects_good_at (student_id, subject_id, current_level) VALUES
-- (1, 4, 'Advanced'), (2, 1, 'Intermediate'), (3, 3, 'Advanced'), (4, 4, 'Intermediate'), (5, 3, 'Advanced');

-- -- 10. Recommendations
-- INSERT INTO Recommendations (student_id, recommended_department_id, report) VALUES
-- (1, 1, 'Strong aptitude for programming and algorithms'),
-- (2, 2, 'Excellent mathematical reasoning skills'),
-- (3, 3, 'Exceptional understanding of physics concepts'),
-- (4, 4, 'Great potential in engineering disciplines'),
-- (5, 3, 'High proficiency in physics subjects');

-- 11. Course_Subjects
INSERT INTO Course_Subjects (course_id, subject_id) VALUES
(1, 2), (1, 4),
(2, 1),
(3, 3), (3, 5),
(4, 5),
(5, 1);  -- Biology course includes basic math

-- 12. Enrollments
INSERT INTO Enrollments (student_id, course_id, completion_date, current_status) VALUES
(1, 1, '2023-12-15', 'enrolled'),
(2, 2, '2023-11-30', 'completed'),
(3, 3, '2024-01-20', 'enrolled'),
(4, 4, '2023-12-10', 'dropped'),
(5, 5, '2024-02-28', 'enrolled');

-- 13. Assignments
INSERT INTO Assignments (student_id, subject_id, course_id, description, due_date) VALUES
(1, 2, 1, 'Python functions exercise', '2023-10-15 23:59:00'),
(2, 1, 2, 'Calculus limits problems', '2023-09-30 17:00:00'),
(3, 3, 3, 'Quantum theory essay', '2023-11-20 12:00:00'),
(4, 5, 4, 'Heat transfer calculations', '2023-10-05 14:30:00'),
(5, 3, 5, 'Physics lab report', '2023-11-15 16:45:00');

-- 14. Submissions
-- INSERT INTO Submissions (assignment_id, student_id, grade, feedback) VALUES
-- (1, 1, 'A+', 'Excellent implementation'),
-- (2, 2, 'B+', 'Good work but missed edge cases'),
-- (3, 3, 'A-', 'Well-researched content'),
-- (4, 4, 'C', 'Needs more detailed calculations'),
-- (5, 5, 'A', 'Perfect lab report');


