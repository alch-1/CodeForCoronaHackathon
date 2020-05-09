-- set up the database for the web app
drop database if exists health_database;
create database health_database;

-- use this database to create and populate the tables
use health_database;

CREATE TABLE `login` (
	-- #user_id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(255) NOT NULL,
	fullname VARCHAR(255) NOT NULL,
    pword VARCHAR(255) NOT NULL,
    PRIMARY KEY(user_id)
);

CREATE TABLE `session` (
    sessionid VARCHAR(255) NOT NULL,
    token VARCHAR(255) NOT NULL
);

CREATE TABLE instanthelp (
    sessionid VARCHAR(255) NOT NULL,
    statusnum INT NOT NULL
);