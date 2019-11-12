-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an subject_category table
DROP TABLE IF EXISTS subject_category;

-- Create an subject_category table
CREATE TABLE subject_category 
( category_code INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT
, category_name VARCHAR(255)
, test_subject_code INT NOT NULL
, CONSTRAINT subject_fk FOREIGN KEY (test_subject_code)
  REFERENCES test_subject(test_subject_code)
, UNIQUE (category_code));
