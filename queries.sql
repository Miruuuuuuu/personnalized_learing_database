-- Insert dummy data into the Teachers table with Muslim names
INSERT INTO Teachers (name, email, category) VALUES
    ('Muhammad Ali', 'muhammad.ali@example.com', 'Associate Professor'),
    ('Fatima Khan', 'fatima.khan@example.com', 'Assistant Professor'),
    ('Ahmed Hassan', 'ahmed.hassan@example.com', 'Professor'),
    ('Aisha Rahman', 'aisha.rahman@example.com', 'Professor'),
    ('Omar Ibrahim', 'omar.ibrahim@example.com', 'Associate Professor'),
    ('Zainab Ahmed', 'zainab.ahmed@example.com', 'Assistant Professor'),
    ('Yusuf Khan', 'yusuf.khan@example.com', 'Professor'),
    ('Safiya Ali', 'safiya.ali@example.com', 'Assistant Professor'),
    ('Ibrahim Khan', 'ibrahim.khan@example.com', 'Professor'),
    ('Mariam Hassan', 'mariam.hassan@example.com', 'Associate Professor');

-- Insert 15 subjects with randomly assigned teachers
INSERT INTO Subjects (subject, subject_description, teacher_id) VALUES
    ('Linguistics', 'Study of language structure and meaning', 1),
    ('Mathematics', 'Study of numbers, quantity, and space', 2),
    ('Computer Science', 'Study of algorithms, data structures, and computation', 3),
    ('Psychology', 'Study of behavior and mind', 4),
    ('Biology', 'Study of living organisms', 5),
    ('Physics', 'Study of matter and energy', 6),
    ('Chemistry', 'Study of substances and their properties', 7),
    ('Sociology', 'Study of society and social behavior', 8),
    ('Anthropology', 'Study of human societies and cultures', 9),
    ('History', 'Study of past events and societies', 10),
    ('Engineering Design', 'Application of engineering principles to design', 1),
    ('Environmental Science', 'Study of the environment and ecosystems', 2),
    ('Literature', 'Study of written works and literary techniques', 3),
    ('Economics', 'Study of production, distribution, and consumption of goods and services', 4),
    ('Political Science', 'Study of government systems and political behavior', 5);
