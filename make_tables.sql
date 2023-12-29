-- Table: groups
DROP TABLE IF EXISTS groups;
CREATE TABLE groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- Table: students
DROP TABLE IF EXISTS students;
CREATE TABLE students (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    group_id INTEGER NOT NULL,
    FOREIGN KEY (group_id) REFERENCES groups (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: teachers
DROP TABLE IF EXISTS teachers;
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL
);

-- Table: subjects
DROP TABLE IF EXISTS subjects;
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    teacher_id INTEGER NOT NULL,
    FOREIGN KEY (teacher_id) REFERENCES teachers (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: grades
DROP TABLE IF EXISTS grades;
CREATE TABLE grades (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    student_id INTEGER NOT NULL, 
    subject_id INTEGER NOT NULL,
    grade TINYINT NOT NULL,
    grade_date DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);




-- -- groups
-- DROP TABLE if EXISTS [groups];
-- CREATE TABLE [groups] (
-- id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
-- name STRING UNIQUE
-- );

-- -- students
-- DROP TABLE if EXISTS students;
-- CREATE TABLE students (
-- id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
-- fullname STRING,
-- group_id REFERENCES [groups]
-- (id)
-- );

-- -- teachers
-- DROP TABLE if EXISTS teachers;
-- CREATE TABLE teachers (
-- id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
-- fullname STRING
-- );

-- -- subjects
-- DROP TABLE if EXISTS subjects;
-- CREATE TABLE subjects (
-- id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
-- name STRING,
-- teacher_id REFERENCES teachers
-- (id)
-- );

-- -- grades
-- DROP TABLE if EXISTS grades;
-- CREATE TABLE grades (
-- id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
-- subject_id REFERENCES subjects
-- (id),
-- student_id REFERENCES students
-- (id),
-- grade INTEGER,
-- date_of DATE
-- );
