-- set up the database for the web app
drop database if exists health_database;
create database health_database;

-- use this database to create and populate the tables
use health_database;

CREATE TABLE `user` (
	username VARCHAR(64) PRIMARY KEY,
	fullname VARCHAR(64) NOT NULL,
    password VARCHAR(64) NOT NULL,
    # 0 --> patient 
    # 1 --> therapist
    user_type INT NOT NULL
);

CREATE TABLE `instanthelp` (
    session_id VARCHAR(255) PRIMARY KEY,
    # 0 --> unattended
    # 1 --> attended
    status_num INT NOT NULL
);

CREATE TABLE `appointment` (
    session_id VARCHAR(255) PRIMARY KEY,
    # 0 --> unattended
    # 1 --> attended
    status_num INT NOT NULL
);

CREATE TABLE `questionaire` (
  `SN` int AUTO_INCREMENT,
  `name` text,
  `details` text,
  `website` text,
  `operating_hours` text,
  `contact_details` text,
  `category` text
);

INSERT INTO `user` VALUES
('ryota', 'ryota wong', 'password', 0),
('joven', 'joven heng', 'password', 0),
('benjamin', 'benjamin wong', 'password', 1),
('aldric', 'aldric chong', 'password', 1),
('belle', 'belle lee', 'password', 1);


INSERT INTO `questionaire` VALUES 
