-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an test_result table
DROP TABLE IF EXISTS test_result;

-- Create an test-result table
CREATE TABLE test_result 
( test_result_code INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT
, score INT(10)
, submit_date DATE
, student_code VARCHAR(255) NOT NULL DEFAULT 'STU-123456'
, CONSTRAINT result_student_fk FOREIGN KEY (student_code)
  REFERENCES student_information (student_code)
, CONSTRAINT chk_score CHECK (score >= 0 AND score <= 10));
