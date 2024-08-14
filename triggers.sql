DELIMITER $$

CREATE TRIGGER check_student_exists
BEFORE INSERT ON enrollments
FOR EACH ROW 
BEGIN
    IF NOT EXISTS (SELECT * FROM students WHERE student_id = NEW.student_id)
        THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Student does not exist";
    END IF;
END $$

CREATE TRIGGER check_course_exists
BEFORE INSERT ON enrollments
FOR EACH ROW 
BEGIN
    IF NOT EXISTS (SELECT * FROM courses WHERE course_id = NEW.course_id and year_level = NEW.year_level)
        THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = "Course does not exist";
    END IF;
END $$