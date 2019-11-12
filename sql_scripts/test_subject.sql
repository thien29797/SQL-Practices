-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an test_subject table
DROP TABLE IF EXISTS test_subject;

-- Create an test-subject table
CREATE TABLE test_subject 
( test_subject_code INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT
, test_name VARCHAR(255)
, test_result_code INT NOT NULL
, CONSTRAINT subject_result_fk FOREIGN KEY (test_result_code)
  REFERENCES test_result (test_result_code));
