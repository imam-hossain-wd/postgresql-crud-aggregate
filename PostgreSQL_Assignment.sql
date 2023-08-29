-- Active: 1692970806409@@127.0.0.1@5432@university_db@public

-- create a databse

CREATE DATABASE university_db 

-- create students table

CREATE TABLE
    students (
        student_id SERIAL PRIMARY KEY,
        student_name VARCHAR(255),
        age INTEGER,
        email VARCHAR(255),
        frontend_mark INTEGER,
        backend_mark INTEGER,
        status VARCHAR(50)
    );

-- Create courses table

CREATE TABLE
    courses (
        course_id INT PRIMARY KEY,
        course_name VARCHAR(255),
        credits INT
    );

-- Create enrollment table

CREATE TABLE
    enrollment (
        enrollment_id INT PRIMARY KEY,
        student_id INT,
        course_id INT,
        FOREIGN KEY (student_id) REFERENCES students(student_id),
        FOREIGN KEY (course_id) REFERENCES courses(course_id)
    );

-- Insert data into students table

INSERT INTO
    students (
        student_id,
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        1,
        'Alice',
        22,
        'alice@example.com',
        55,
        57,
        NULL
    ), (
        2,
        'Bob',
        21,
        'bob@example.com',
        34,
        45,
        NULL
    ), (
        3,
        'Charlie',
        23,
        'charlie@example.com',
        60,
        59,
        NULL
    ), (
        4,
        'David',
        20,
        'david@example.com',
        40,
        49,
        NULL
    ), (
        5,
        'Eve',
        24,
        'newemail@example.com',
        45,
        34,
        NULL
    ), (
        6,
        'Rahim',
        23,
        'rahim@gmail.com',
        46,
        42,
        NULL
    ), (
        7,
        'Fiona',
        19,
        'fiona@yahoo.com',
        68,
        70,
        NULL
    ), (
        8,
        'George',
        22,
        'george@example.com',
        76,
        82,
        NULL
    ), (
        9,
        'Hannah',
        21,
        'hannah@gmail.com',
        89,
        88,
        NULL
    ), (
        10,
        'Ian',
        23,
        'ian@yahoo.com',
        52,
        60,
        NULL
    ), (
        11,
        'Julia',
        20,
        'julia@example.com',
        70,
        74,
        NULL
    ), (
        12,
        'Kevin',
        22,
        'kevin@example.com',
        61,
        58,
        NULL
    ), (
        13,
        'Linda',
        21,
        'linda@gmail.com',
        87,
        90,
        NULL
    );

insert data into courses table

INSERT INTO
    courses (
        course_id,
        course_name,
        credits
    )
VALUES 
(1, 'Next.js', 3), 
(2, 'React.js', 4),
(3, 'Databse', 3), 
(4, 'Prisma', 2),
(5, 'Javascript', 5),
(6, 'Node.js', 3),
(7, 'PHP', 3);

SELECT *FROM courses

--insert data into enrollment

INSERT INTO enrollment (enrollment_id,student_id ,course_id)
VALUES 
(1,1,3),
(2,2,5),
(3,3,1),
(4,4,2),
(5,5,4),
(6,6,1),
(7,7,4),
(8,8,3),
(9,9,2),
(10,10,5),
(11,11,4),
(12,12,2),
(13,13,3),
(14,16,6),
(15,17,6);


-- Start query

--query-1: Insert a new student record with the following details.


INSERT INTO
    students (
        student_id,
        student_name,
        age,
        email,
        frontend_mark,
        backend_mark,
        status
    )
VALUES (
        17,
        'mifat',
        25,
        'mifat@hotmail.com',
        90,
        98,
        NULL
    );


--query-2: Retrieve the names of all students who are enrolled in the course titled 'Next.js'.

SELECT students.student_name
FROM students
JOIN enrollment ON students.student_id = enrollment.student_id
JOIN courses ON enrollment.course_id = courses.course_id
WHERE courses.course_name = 'Next.js';



--query-3: Update the status of the student with the highest total (frontend_mark + backend_mark) mark to 'Awarded'

UPDATE students
SET status = 'Awarded'
WHERE (frontend_mark + backend_mark) = (
    SELECT MAX(frontend_mark + backend_mark)
    FROM students
);


-- query 4: Delete all courses that have no students enrolled.

DELETE FROM courses
WHERE NOT EXISTS (
    SELECT 1
    FROM enrollment
    WHERE enrollment.course_id = courses.course_id
);

--query-5 : Retrieve the names of students using a limit of 2, starting from the 3rd student.

SELECT student_name
FROM students
ORDER BY student_id
LIMIT 2 OFFSET 2;

SELECT * FROM students