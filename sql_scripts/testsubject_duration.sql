-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an testsubject_duration table
DROP TABLE IF EXISTS testsubject_duration;

-- Create an testsubject_duration table
CREATE TABLE testsubject_duration (
   test_subject_code INT NOT NULL,
   duration_id INT NOT NULL,
   PRIMARY KEY (test_subject_code, duration_id),
   FOREIGN KEY (duration_id) 
       REFERENCES duration_data (duration_id),
   FOREIGN KEY (test_subject_code) 
       REFERENCES test_subject (test_subject_code)
);
