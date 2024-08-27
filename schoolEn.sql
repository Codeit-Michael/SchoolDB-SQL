-- Creating Main Entities

CREATE TABLE students (
    student_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birthdate DATE NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (student_id)
);

CREATE TABLE courses (
    course_id INT NOT NULL AUTO_INCREMENT,
    course_name VARCHAR(255) NOT NULL,
    course_code VARCHAR(50) NOT NULL,
    year_level ENUM('1st year', '2nd year', '3rd year', '4th year') NOT NULL,
    department_id INT NOT NULL,
    PRIMARY KEY (course_id)
);

CREATE TABLE subjects (
    subject_id INT NOT NULL AUTO_INCREMENT,
    subject_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (subject_id)
);

CREATE TABLE professors (
    professor_id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    is_head BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (professor_id)
);

CREATE TABLE departments (
    department_id INT NOT NULL AUTO_INCREMENT,
    department_name VARCHAR(255) NOT NULL,
    department_head INT UNIQUE,
    PRIMARY KEY (department_id)
);

-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Adding Foreign Key's

ALTER TABLE courses
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE;

ALTER TABLE professors
ADD FOREIGN KEY (department_id) REFERENCES departments(department_id) ON DELETE CASCADE;

ALTER TABLE departments
ADD FOREIGN KEY (department_head) REFERENCES professors(professor_id) ON DELETE CASCADE;
