DELIMITER //

-- add new student
CREATE PROCEDURE AddNewStudent(
    IN studentName VARCHAR(32),
    IN studentEmail VARCHAR(64),
    IN studentDOB DATE
)
BEGIN
    INSERT INTO Students (name, email, date_of_birth)
    VALUES (studentName, studentEmail, studentDOB);
END //

DELIMITER ;

DELIMITER //

-- get student's recommendation
CREATE PROCEDURE GetStudentRecommendations(
    IN studentId SMALLINT UNSIGNED
)
BEGIN
    SELECT 
        Recommendations.id AS recommendation_id,
        Students.name AS student_name,
        Departments.name AS department_name,
        Recommendations.report AS recommendation_report
    FROM 
        Recommendations
    JOIN 
        Students ON Recommendations.student_id = Students.id
    JOIN 
        Departments ON Recommendations.recommended_department_id = Departments.id
    WHERE 
        Recommendations.student_id = studentId;
END //

DELIMITER ;


DELIMITER //

--update student's assignment grade
CREATE PROCEDURE UpdateAssignmentGrade(
    IN submissionId SMALLINT UNSIGNED,
    IN newGrade ENUM('A+', 'A-', 'B+', 'B-', 'C', 'C-', 'D', 'D-', 'F')
)
BEGIN
    UPDATE Submissions
    SET grade = newGrade
    WHERE id = submissionId;
END //

DELIMITER ;


DELIMITER //

-- read student's assignments
CREATE PROCEDURE GetStudentAssignments(
    IN studentId SMALLINT UNSIGNED
)
BEGIN
    SELECT 
        Assignments.id AS assignment_id,
        Subjects.subject AS subject_name,
        Courses.course_name AS course_name,
        Assignments.description AS assignment_description,
        Assignments.due_date AS assignment_due_date
    FROM 
        Assignments
    JOIN 
        Subjects ON Assignments.subject_id = Subjects.id
    JOIN 
        Courses ON Assignments.course_id = Courses.id
    WHERE 
        Assignments.student_id = studentId;
END //

DELIMITER ;
