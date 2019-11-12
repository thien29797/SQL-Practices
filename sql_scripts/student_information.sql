-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an student_information table
DROP TABLE IF EXISTS student_information;

-- Create an student_information table
CREATE TABLE student_information 
( student_code VARCHAR(10) DEFAULT 'STU-123456' NOT NULL PRIMARY KEY
, first_name VARCHAR(255)
, last_name VARCHAR(255)
, email VARCHAR(255)
, UNIQUE (student_code));
