-- Use the scoredb database
USE scoredb;

-- Disable foreign key checking
SET foreign_key_checks = 0;

-- Drop an duration_data table
DROP TABLE IF EXISTS type_data;

-- Create an duration_data table
CREATE TABLE duration_data 
( duration_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
, duration_name VARCHAR(255));

-- Insert data
INSERT INTO duration_data (duration_name) VALUES('FIFTEEN_MINUTES');
INSERT INTO duration_data (duration_name) VALUES('THIRTY_MINUTES');
INSERT INTO duration_data (duration_name) VALUES('SIXTY_MINUTES');
