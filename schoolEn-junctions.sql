-- Adding Junction tables

CREATE TABLE enrollments (
    enrollee_id INT NOT NULL AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    year_level ENUM('1st year', '2nd year', '3rd year', '4th year') NOT NULL,
    semester ENUM('1st sem', '2nd sem') NOT NULL, 
    date_enrolled DATE NOT NULL,
    PRIMARY KEY (enrollee_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE
);

CREATE TABLE course_subjects (
    course_id INT NOT NULL,
    subject_id INT NOT NULL,
    PRIMARY KEY (course_id, subject_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id) ON DELETE CASCADE
);

CREATE TABLE professor_subjects (
    professor_id INT NOT NULL,
    subject_id INT NOT NULL,
    PRIMARY KEY (professor_id, subject_id),
    FOREIGN KEY (professor_id) REFERENCES professors(professor_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id) ON DELETE CASCADE
);

CREATE TABLE student_grades (
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    grade DECIMAL(3,2) NOT NULL,
    semester ENUM('1st sem', '2nd sem') NOT NULL, 
    year_accomplished INT,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id) ON DELETE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id) ON DELETE CASCADE
);
