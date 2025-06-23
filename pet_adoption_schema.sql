CREATE DATABASE pet_adoption;
USE pet_adoption;

CREATE TABLE shelter (
    shelter_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(15)
);

CREATE TABLE pet (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    shelter_id INT NOT NULL,
    name VARCHAR(50) NOT NULL,
    species ENUM('dog', 'cat', 'bird', 'other') NOT NULL,
    age INT,
    status ENUM('available', 'adopted') DEFAULT 'available',
    FOREIGN KEY (shelter_id) REFERENCES shelter(shelter_id) ON DELETE CASCADE
);

CREATE TABLE adopter (
    adopter_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address VARCHAR(255)
);


CREATE TABLE adoption (
    adoption_id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    adopter_id INT NOT NULL,
    adoption_date DATE NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES pet(pet_id) ON DELETE CASCADE,
    FOREIGN KEY (adopter_id) REFERENCES adopter(adopter_id) ON DELETE CASCADE,
    UNIQUE (pet_id) 
);

