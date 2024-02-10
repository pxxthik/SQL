# DDL Commands

   `DDL Commands for Database`
   1. CREATE
   ```sql
       CREATE DATABASE IF NOT EXISTS campusx;
   ```
   2. DROP
   ```sql
       DROP DATABASE IF EXISTS campusx;
   ```
   
   `DDL Commands for Tables`
   1. CREATE
   ```sql
   CREATE TABLE users(
        user_id INTEGER,
        name VARCHAR(255),
        email VARCHAR(255),
        password VARCHAR(255)
   );
   ```
   2. TRUNCATE
   ```sql
   TRUNCATE TABLE users;
   ```
   3. DROP
   ```sql
   DROP TABLE IF EXISTS users;
   ```
   
   **CONSTRAINTS**
   
   `NOT NULL` `UNIQUE` `PRIMARY KEY` `AUTO INCREMENT` `CHECK` `DEFAULT` `FORIGN KEY`
   ```sql
   CREATE TABLE example_table (
        id INTEGER AUTO_INCREMENT PRIMARY KEY,
        name VARCHAR(50) NOT NULL,
        age INTEGER,
        email VARCHAR(100) UNIQUE,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
       
        CONSTRAINT chk_age CHECK (age >= 18 AND age <= 100)
    );
   ```
   
   - Another way of adding constraints.
   - To add Unique constraint for combination of name and email
   - We can delete added constraint whenever we want
   ```sql
   CREATE TABLE users(
        user_id INTEGER,
        name VARCHAR(255),
        email VARCHAR(255),
        password VARCHAR(255),

        CONSTRAINT users_password_unique UNIQUE(password),
        CONSTRAINT users_name_email_unique UNIQUE(name, email)
   );
   ```