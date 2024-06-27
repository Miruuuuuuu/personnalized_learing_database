CREATE TABLE Students (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    email VARCHAR(64) NOT NULL,
    data_of_birth DATE NOT NULL,
    registration_date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Teachers (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(32) NOT NULL,
    email VARCHAR(64) NOT NULL,
    category ENUM('Assistant Professor', 'Associate Professor', 'Professor')
);

-- subjects that the institute using this system offers
CREATE TABLE Subjects (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subject VARCHAR(64) NOT NULL,
    subject_description TEXT NOT NULL,
    teacher_id SMALLINT UNSIGNED NOT NULL,  
    FOREIGN KEY(teacher_id) REFERENCES Teachers(id)
);

-- Visual, Auditory, Read/Write, and Kinaesthetic
-- this will be added by the reports generated after the students aptitude test using triggers
CREATE TABLE Learning_styles (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id SMALLINT UNSIGNED NOT NULL,
    style ENUM('Visual', 'Auditory', 'Read/Write', 'Kinaesthetic'),
);

-- will be updated based on the exams results using a trigger
-- current_level will be determined after comparing students grade, marks in a subject with a preset criteria in a trigger
CREATE TABLE Subjects_good_at (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    subject_id SMALLINT UNSIGNED NOT NULL,
    current_level ENUM('Beginner', 'Intermediate', 'Advanced'),
    FOREIGN KEY(subject_id) REFERENCES subjects(id)
);

CREATE TABLE Courses (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(64) NOT NULL,
    course_description TEXT NOT NULL,
    subjects_id SET(SELECT id FROM subjects),
);

-- junction table to add subjects for the course
CREATE TABLE course_subjects (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    course_id SMALLINT UNSIGNED NOT NULL,
    subject_id SMALLINT UNSIGNED NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Courses(id),
    FOREIGN KEY (subject_id) REFERENCES Subjects(id) 
);

CREATE TABLE enrollments (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id UNSIGNED AUTO_INCREMENT NOT NULL,
    course_id UNSIGNED AUTO_INCREMENT NOT NULL,
    enrollment_date DATE DEFAULT CURRENT_DATE,
    completion_date DATE NOT NULL,
    current_status ENUM('enrolled', 'completed', 'droped')
);

CREATE TABLE Assignmnets (
    id SMALLINT UNSIGNED PRIMARY KEY,
    student_id SMALLINT UNSIGNED NOT NULL,
    subject_id SMALLINT UNSIGNED NOT NULL,
    course_id SMALLINT UNSIGNED NOT NULL,
    description TEXT NOT NULL,
    due_date DATETIME NOT NULL
);

CREATE TABLE Submissions (
    id SMALLINT UNSIGNED PRIMARY KEY,
    assignment_id SMALLINT UNSIGNED,
    student_id SMALLINT UNSIGNED,
    submission_datetime DATETIME NOT NULL,
    grade ENUM('A+','A-','B+','B-','C','C-','D','D-','F'),
    feedback TINYTEXT NOT NULL,
    FOREIGN KEY(assignment_id) REFERENCES Assignmnets(id),
    FOREIGN KEY(student_id) REFERENCES Students(id)
);

-- TODO :
-- conduct an a placement test (TABLE)

CREATE TABLE Placement_test (
    id SMALLINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    student_id SMALLINT UNSIGNED NOT NULL,
    test_subject_id SMALLINT UNSIGNED NOT NULL,
    grade ENUM('A+','A-','B+','B-','C','C-','D','D-','F'),
    proficiency_level ENUM('Beginner', 'Intermediate', 'Advanced'),
    FOREIGN KEY(subject_id) REFERENCES Students(id),
    FOREIGN KEY(test_subject_id) REFERENCES Subjects(id)
);

-- report will be generated on a trigger
CREATE TABLE Recommendations (
    id SMALLINT UNSIGNED AUTO_INCREMENT Primary KEY,
    student_id SMALLINT UNSIGNED NOT NULL,
    recommended_course_id SMALLINT UNSIGNED NOT NULL,
    report TEXT NOT NULL,
    FOREIGN KEY(student_id) REFERENCES Students(id),
    FOREIGN KEY(recommended_course_id) REFERENCES Courses(id)
);
