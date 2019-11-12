-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an result_data table
DROP TABLE IF EXISTS result_data;

-- Create an result_data table
CREATE TABLE result_data 
( result_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
, result_name VARCHAR(255));

-- Insert data
INSERT INTO result_data (result_name) VALUES('PASSED');
INSERT INTO result_data (result_name) VALUES('FAILED');
