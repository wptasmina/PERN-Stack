-- Active: 1753686259397@@127.0.0.1@5432@bookdb

CREATE TABLE blogs (
	student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    lest_name VARCHAR(50),
    age INT,
    grade CHAR(2),
    course VARCHAR(50),
    email VARCHAR(50),
    dob DATE,
    blood_group VARCHAR(4),
    country VARCHAR(50)
);

SELECT * FROM students;

INSERT INTO blogs (first_name, lest_name, age, grade, course, email, dob, blood_group, country)
VALUES
('Ayesha', 'Rahman', 20, 'A+', 'Computer Science', 'ayesha.rahman@example.com', '2005-03-12', 'O+', 'USA'),
('Hasan', 'Khan', 22, 'B+', 'Mathematics', 'hasan.khan@example.com', '2003-07-05', 'A-', 'Bangladesh'),
('Nadia', 'Sultana', 21, 'A', 'English Literature', 'nadia.sultana@example.com', '2004-01-28', 'B+', 'India'),
('Fahim', 'Ahmed', 23, 'B', 'Physics', 'fahim.ahmed@example.com', '2002-09-15', 'AB+', 'USA'),
('Ritu', 'Chowdhury', 19, 'A-', 'Chemistry', 'ritu.chowdhury@example.com', '2006-06-19', 'O-', 'Nepal'),
('Tariq', 'Islam', 20, 'A+', 'Biology', 'tariq.islam@example.com', '2005-04-03', 'B-', 'Pakistan'),
('Jannat', 'Ara', 22, 'B+', 'Economics', 'jannat.ara@example.com', '2003-11-27', 'AB-', 'Australia'),
('Mehedi', 'Hasan', 24, 'C+', 'Statistics', 'mehedi.hasan@example.com', '2001-08-10', 'O+', 'India'),
('Salma', 'Begum', 21, 'A', 'Philosophy', 'salma.begum@example.com', '2004-02-14', 'A+', 'Australia'),
('Rana', 'Mia', 23, 'B', 'Sociology', 'rana.mia@example.com', '2002-12-05', 'B+', 'USA');


ALTER TABLE blogs 
    RENAME TO students;

SELECT email, blood_group FROM students;

SELECT email as "student Email" FROM students;

SELECT * FROM students;

SELECT * FROM students ORDER BY first_name ASC;

SELECT * FROM students ORDER BY age DESC;

SELECT country FROM students ORDER BY country ASC;

UPDATE students   --যদি row পুরো নাম (first_name + last_name) আপডেট করতে চাও:
    SET country = 'Tanvir', lest_name = 'Rahman'
        WHERE student_id = 1;

UPDATE students
    SET country = 'Australia'
        WHERE student_id = 10;

SELECT * FROM students 

SELECT DISTINCT country FROM students; -- UNIQUE - country koyta asci!

SELECT DISTINCT blood_group FROM students; -- UNIQUE - country koyta asci!
