DELIMITER //
CREATE TRIGGER `add_subjects_good_at`
AFTER INSERT ON Placement_tests
FOR EACH ROW
BEGIN
    DECLARE total_subjects SMALLINT UNSIGNED;
    DECLARE total_subjects_recorded_in_placement_tests SMALLINT UNSIGNED;
    DECLARE highest_score_sub SMALLINT UNSIGNED;
    DECLARE highest_score FLOAT(3,3);
    DECLARE v_current_level VARCHAR(15);

    -- Reading total number of subjects
    SELECT COUNT(*) INTO total_subjects FROM Subjects;

    -- Reading the number of subjects tests
    SELECT COUNT(*) INTO total_subjects_recorded_in_placement_tests
    FROM Placement_tests WHERE student_id = NEW.student_id;

    IF total_subjects_recorded_in_placement_tests >= 1 THEN
    
        -- Reading highest score
        SELECT score INTO highest_score 
        FROM Placement_tests 
        WHERE student_id = NEW.student_id
        ORDER BY score DESC 
        LIMIT 1;

        -- Checking for student's proficiency level
        IF highest_score >= 0.85 AND highest_score <= 0.99 THEN
            SET v_current_level = 'Advanced';
        ELSEIF highest_score >= 0.50 AND highest_score < .85 THEN
            SET v_current_level = 'Intermediate';
        ELSEIF highest_score < 0.50 THEN
            SET v_current_level = 'Beginner';
        END IF;
        
        -- Reading the student's best subject once all the tests have been conducted
        SELECT subject_id INTO highest_score_sub 
        FROM Placement_tests 
        WHERE student_id = NEW.student_id
        ORDER BY score DESC 
        LIMIT 1;

        -- Now insert into best subjects table
        INSERT INTO Subjects_good_at (student_id, subject_id, current_level) 
        VALUES (NEW.student_id, highest_score_sub, v_current_level);
    
    END IF;
END//
DELIMITER ;

-- TODO FOR SAAD

-- Create a trigger that would insert into recommendations table
-- understand the below conditional
-- IF highest_score >= 90 AND highest_score <= 100 THEN
        --     SET v_current_level = 'Advanced';
        -- ELSEIF highest_score >= 65 AND highest_score < 90 THEN
        --     SET v_current_level = 'Intermediate';
        -- ELSEIF highest_score < 65 THEN
        --     SET v_current_level = 'Beginner';
        -- END IF;
-- Now in report that is of type text consider the mention the following :
    -- student's average score (no of subjects/ sum of all score in all subjects)
    -- student's best subject
    -- recommended departments(check scores in different subjects) to do this.
        -- FOR example if the student scored best in subjects "Computer Science", "Matematics", "Engineering Design" ,
        -- "physics" than recommed departments like physics, computer science, mathematics
    
-- Lastly remember that this report is a column in recommendations table, and this is a TEXT type, you will need to
-- concatinate TEXT to from a report
-- you have free hand to add anything meaning full you'd like to the report.


  