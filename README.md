# 🎮 GameFlix SQL Database Project

This repository contains the SQL script for **GameFlix**, a fictional video game and movie rental store. This was a **college group project** focused on relational database modeling and SQL implementation using **MySQL**.

📌 **Note**: All code and data are written in **Portuguese**, as the project was developed in Brazil for a university course.

---

## 📘 Project Description

**GameFlix** is a fictional rental service that operates through several physical store locations across the city. Each store maintains its own inventory of physical media: DVDs/Blu-rays for movies and discs for video games.

### 🧱 Data Model Features:

- **Store Units**: Each unit has a name, address, and manages its own stock.
- **Products**: All products are either:
  - 🎮 **Games**: Includes platform (e.g., PS5, Xbox, PC) and game mode (single-player, multiplayer).
  - 🎬 **Movies**: Includes director, rating, and release year.
- **People**:
  - 👤 **Clients**: Can rent items and must provide personal information like CPF, email, and address.
  - 👥 **Employees**: Have roles (e.g., Manager, Cashier), work in specific units, and handle rentals.
- **Rentals**:
  - Tracks pickup and return dates, delays, and fines.
  - Supports renting multiple items in one transaction.
- **Inventory**:
  - Each unit tracks available quantities of each product.

---

## 🛠️ What We Did

- Designed the **physical schema** using `CREATE TABLE`, respecting proper foreign keys and normalization.
- Implemented:
  - `CASCADE` deletion rules
  - Many-to-many and one-to-many relationships
  - Unique constraints for `CPF`, `phone`, and others
- Populated the database with real-like data using `INSERT INTO`.
- Learned SQL syntax, data modeling, and how to **debug constraints and logical errors**.

> All the insert data and logic were assisted and enhanced using ChatGPT 💬.

---

## 📚 What I Learned

This project was a great opportunity to:

- Solidify my knowledge in **MySQL** and relational databases
- Understand how real-world businesses (like a rental store) structure their data
- Practice working with **foreign keys, cascading rules, and data integrity**
- Collaborate in a team setting and **use ChatGPT as a coding assistant**

---

## 🤝 Credits

- 💻 Developed as a **college assignment** in a team.
- 🤖 Powered by ChatGPT to enrich content and simulate realistic data.
- 🧠 Inspired by real rental systems with a fun twist for learning.

---

## 🏷️ Tags

`MySQL` `Database Design` `SQL` `College Project` `GameFlix` `Back-End` `Relational Model` `DBMS`

---
# 🎮 GameFlix SQL Database Project

This repository contains the SQL script for **GameFlix**, a fictional video game and movie rental store. This was a **college group project** focused on relational database modeling and SQL implementation using **MySQL**.

---

## 📘 Project Description

**GameFlix** is a fictional rental service that operates through several physical store locations across the city. Each store maintains its own inventory of physical media: DVDs/Blu-rays for movies and discs for video games.

### 🧱 Data Model Features:

- **Store Units**: Each unit has a name, address, and manages its own stock.
- **Products**: All products are either:
  - 🎮 **Games**: Includes platform (e.g., PS5, Xbox, PC) and game mode (single-player, multiplayer).
  - 🎬 **Movies**: Includes director, rating, and release year.
- **People**:
  - 👤 **Clients**: Can rent items and must provide personal information like CPF, email, and address.
  - 👥 **Employees**: Have roles (e.g., Manager, Cashier), work in specific units, and handle rentals.
- **Rentals**:
  - Tracks pickup and return dates, delays, and fines.
  - Supports renting multiple items in one transaction.
- **Inventory**:
  - Each unit tracks available quantities of each product.

---

## 🛠️ What We Did

- Designed the **physical schema** using `CREATE TABLE`, respecting proper foreign keys and normalization.
- Implemented:
  - `CASCADE` deletion rules
  - Many-to-many and one-to-many relationships
  - Unique constraints for `CPF`, `phone`, and others
- Populated the database with real-like data using `INSERT INTO`.
- Learned SQL syntax, data modeling, and how to **debug constraints and logical errors**.

> All the insert data and logic were assisted and enhanced using ChatGPT 💬.

---

## 📚 What I Learned

This project was a great opportunity to:

- Solidify my knowledge in **MySQL** and relational databases
- Understand how real-world businesses (like a rental store) structure their data
- Practice working with **foreign keys, cascading rules, and data integrity**
- Collaborate in a team setting and **use ChatGPT as a coding assistant**

---

## 🤝 Credits

- 💻 Developed as a **college assignment** in a team.
- 🤖 Powered by ChatGPT to enrich content and simulate realistic data.
- 🧠 Inspired by real rental systems with a fun twist for learning.

---

## 🏷️ Tags

`MySQL` `Database Design` `SQL` `College Project` `GameFlix` `Back-End` `Relational Model` `DBMS`

---

