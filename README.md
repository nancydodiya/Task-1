# 🐾 Pet Adoption Database Schema

## 📘 Overview

This repository contains a **MySQL database schema** for a **Pet Adoption System**, designed as a learning project to practice database design principles.

It demonstrates:
- Entity-relationship (ER) modeling
- Normalization (up to **3rd Normal Form**)
- Use of **primary keys**, **foreign keys**, and **indexes**

The system manages shelters, pets, adopters, and adoption records.

---

## 🗂️ Schema Details

The schema consists of a single database named `pet_adoption` and includes the following four tables:

---

### 🏠 shelter

| Column Name   | Type            | Description              |
|---------------|-----------------|--------------------------|
| `shelter_id`  | INT, PK, AUTO_INCREMENT | Unique shelter ID       |
| `name`        | VARCHAR         | Shelter name             |
| `address`     | VARCHAR         | Shelter address          |
| `phone`       | VARCHAR         | Shelter contact number   |

> Stores information about shelters.

---

### 🐶 pet

| Column Name   | Type            | Description              |
|---------------|-----------------|--------------------------|
| `pet_id`      | INT, PK, AUTO_INCREMENT | Unique pet ID         |
| `shelter_id`  | INT, FK         | References `shelter_id`  |
| `name`        | VARCHAR         | Pet name                 |
| `species`     | ENUM ('dog', 'cat', 'bird', 'other') | Type of pet |
| `age`         | INT             | Age of the pet (in years)|
| `status`      | ENUM ('available', 'adopted') | Adoption status |

> Tracks pets and their association with a shelter.

---

### 👤 adopter

| Column Name   | Type            | Description              |
|---------------|-----------------|--------------------------|
| `adopter_id`  | INT, PK, AUTO_INCREMENT | Unique adopter ID    |
| `first_name`  | VARCHAR         | First name               |
| `last_name`   | VARCHAR         | Last name                |
| `email`       | VARCHAR, UNIQUE | Email address            |
| `address`     | VARCHAR         | Residential address      |

> Stores details of potential pet adopters.

---

### 📝 adoption

| Column Name    | Type            | Description              |
|----------------|-----------------|--------------------------|
| `adoption_id`  | INT, PK, AUTO_INCREMENT | Unique adoption ID  |
| `pet_id`       | INT, FK, UNIQUE | References `pet_id`      |
| `adopter_id`   | INT, FK         | References `adopter_id`  |
| `adoption_date`| DATE            | Date of adoption         |

> Records adoption transactions linking pets to adopters.

---

## 🔗 Relationships

- **Shelter to Pet**: One-to-Many (1:N)  
- **Pet to Adoption**: One-to-One (1:1, enforced via `UNIQUE pet_id`)  
- **Adopter to Adoption**: One-to-Many (1:N)  

All foreign keys are defined with `ON DELETE CASCADE` to maintain referential integrity.

---

## ✅ Prerequisites

- **MySQL Server** (v5.7 or later recommended)
- **MySQL Workbench**
- A MySQL user account with privileges to:
  - Create databases
  - Create tables
  - Add foreign keys and indexes

---

## 📂 Usage

1. Clone or download this repository.
2. Open the SQL script (`schema.sql`) in **MySQL Workbench**.
3. Run the script to create the `pet_adoption` database and its schema.
4. Use the ER diagram tool in Workbench to visualize relationships (optional but recommended).

---

## 📌 License

This project is intended for educational purposes. Feel free to use, modify, or extend it for your own learning or academic projects.

---

## 🙌 Contributing

Contributions are welcome! Feel free to submit issues or pull requests if you find bugs or want to enhance the schema.

