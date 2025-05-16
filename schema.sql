CREATE DATABASE db_serrano_project;

USE db_serrano_project;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(15),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE Users ADD role ENUM('user', 'admin') DEFAULT 'user';

ALTER TABLE Users ADD profile_picture VARCHAR(255) DEFAULT 'default.png';

CREATE TABLE AccessLogs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    action VARCHAR(255),
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE Genres (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
);
CREATE TABLE Books (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    author VARCHAR(255),
    genre_id INT,
    price DECIMAL(10, 2),
    stock INT DEFAULT 0,
    isbn VARCHAR(20),
    description TEXT,
    cover_image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (genre_id) REFERENCES Genres(id)
);