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
(5, 'javascript', 5);

--insert data into enrollment

INSERT INTO enrollment (enrollment_id,student_id ,course_id)
VALUES 
(1,1,3),
(2,2,5),
(3,3,1),
(4,4,2),
(5,5,4),
(6,6,1),
(7,7,3),
(8,8,3),
(9,9,3),
(10,10,3),
(11,11,3),
(12,12,3),
(13,13,3);


