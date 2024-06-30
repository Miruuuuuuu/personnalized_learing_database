
SELECT 
    Students.name AS student_name, 
    Departments.name AS department_name, 
    Learning_styles.style AS learning_style,
    Subjects.name AS subject_name
FROM Students 
JOIN Student_department ON Students.id = Student_department.student_id
JOIN Departments ON Student_department.department_id = Departments.id
JOIN Learning_styles ON Students.id = Learning_styles.student_id
JOIN Subjects ON Subjects.id = Learning_styles.subject_id;