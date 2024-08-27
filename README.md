# School Database System

This MySQL database project models a school system, managing information about students, courses, professors, and their relationships

![School DB ERD](https://github.com/Codeit-Michael/SchoolDB-SQL/blob/main/SchoolDB-ERD.jpg)

### Main Entities
**Students**
- `student_id` - primary key
- Name (`f_name`, `l_name`) - varchar not null
- `birthdate` - date not null
- `address` - varchar not null
- `email` - varchar not null

**Courses**
- `course_id` - primary key
- `course_name` - varchar not null
- `course_code` - varchar not null
- `year_level` - ENUM('1st year', '2nd year', '3rd year', '4th year') not null
- `department_id` - foreign key not null

**Subjects**
- `subject_id` - primary key
- `subject_name` - varchar not null

**Departments**
- `department_id` - primary key
- `department_name` - varchar not null
- `department_head` (teacher_id) - foreign key not null

**Professors**
- `teacher_id` - primary key
- Name (`f_name`, `l_name`) - varchar not null
- `department_id` - foreign key not null
- `is_head` - Boolean (TRUE/FALSE)                            

### Foreign keys in Main Entities
- Courses from Departments
- Professors from Departments
- Departments from Professors

### Junction Entities
**Enrollments** (for Students and Courses relationship)
- `enrollee_id`  - primary key
- `student_id` - foreign key
- `year_level` - foreign key ENUM('1st year', '2nd year', '3rd year', '4th year') not null
- `course_id` - foreign key
- `semester` - ENUM('1st sem', '2nd sem') not null
- `date` - date not null

**Course_Subjects** (for Courses and Subjects relationship)
- `course_id` - primary key, foreign key
- `subject_id` - primary key, foreign key

**Student_Grades** (for Students and Subjects relationship)
- `student_id` - primary key, foreign key
- `subject_id` - primary key, foreign key
- `grade` - decimal(3 size, 2 decimals)
- `semester` - ENUM('1st sem', '2nd sem') not null
- `year` - date not null

**Teachers_Subjects** (for Teachers and Subjects relationship)
- `teacher_id` - primary key, foreign key
- `subject_id` - primary key, foreign key

### Foreign keys for Junctions 
- `Enrollments` - student_id, year_level, course_id
- `Course_subjects` - course_id, subject_id
- `Student_grades` - student_id, subject_id
- `Professor_subjects` - prtofessor_id, subject_id

### Triggers
- do not enroll if student not in Students table
- do not enroll if course and year not in courses
