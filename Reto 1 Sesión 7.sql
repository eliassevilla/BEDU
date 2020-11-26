CREATE DATABASE bedu_test_2;
DROP DATABASE bedu_test_2;

CREATE DATABASE IF NOT EXISTS bedu_test_2;
DROP DATABASE IF EXISTS bedu_test_2;

USE bedu_test_2;

CREATE TABLE IF NOT EXISTS users (
	id INT PRIMARY KEY,
    genero CHAR(1),
    edad INT,
    ocupacion INT,
    cp VARCHAR(20)
);

DROP TABLE IF EXISTS movies;

CREATE TABLE IF NOT EXISTS movies (
	id INT PRIMARY KEY,
    titulo VARCHAR(80),
    genero VARCHAR(80)
);

CREATE TABLE IF NOT EXISTS ratings (
	id INT PRIMARY KEY auto_increment,
	userID INT,
    movieID INT,
    rating INT,
    time_stamp INT,
    FOREIGN KEY (userID) REFERENCES users(id),
    FOREIGN KEY (movieID) REFERENCES movies(id)
);