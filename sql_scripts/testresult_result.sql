-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an testresult_result table
DROP TABLE IF EXISTS testresult_result;

-- Create an testresult_result table
CREATE TABLE testresult_result (
   test_result_code INT NOT NULL,
   result_id INT NOT NULL,
   PRIMARY KEY (test_result_code, result_id),
   FOREIGN KEY (result_id) 
       REFERENCES result_data (result_id),
   FOREIGN KEY (test_result_code) 
       REFERENCES test_result (test_result_code)
);
