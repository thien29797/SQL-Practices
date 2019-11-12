-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an testsubject_type table
DROP TABLE IF EXISTS testsubject_type;

-- Create an testsubject_type table
CREATE TABLE testsubject_type (
   test_subject_code INT NOT NULL,
   type_id INT NOT NULL,
   PRIMARY KEY (test_subject_code, type_id),
   FOREIGN KEY (type_id) 
       REFERENCES type_data (type_id),
   FOREIGN KEY (test_subject_code) 
       REFERENCES test_subject (test_subject_code)
);
