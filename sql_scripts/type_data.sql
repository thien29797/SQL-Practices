-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an type_data table
DROP TABLE IF EXISTS type_data;

-- Create an type_data table
CREATE TABLE type_data 
( type_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
, type_name VARCHAR(255));

-- Insert data
INSERT INTO type_data (type_name) VALUES('OFFLINE');
INSERT INTO type_data (type_name) VALUES('ONLINE');
