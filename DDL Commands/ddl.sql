DROP DATABASE IF EXISTS campusx;
CREATE DATABASE IF NOT EXISTS campusx;
USE campusx;

CREATE TABLE users(
	user_id INTEGER PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255),
    
    CONSTRAINT users_name_email_unique UNIQUE(name, email),
    CONSTRAINT users_password_unique UNIQUE(password)
);

TRUNCATE TABLE users;
DROP TABLE IF EXISTS users;

-- FORIGN KEY EXAMPLE
CREATE TABLE customers(
	cid INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(200) NOT NULL UNIQUE
);
CREATE TABLE orders(
	order_id INTEGER PRIMARY KEY,
    cid INTEGER NOT NULL,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT orders_fk FOREIGN KEY (cid) REFERENCES customers(cid)
);

-- ALTER
ALTER TABLE customers ADD COLUMN surname VARCHAR(255) NOT NULL AFTER name;
ALTER TABLE customers
ADD COLUMN pan_num VARCHAR(255) AFTER surname,
ADD COLUMN joining_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE customers DROP COLUMN pan_num;
ALTER TABLE customers
DROP COLUMN surname,
DROP COLUMN joining_date;

ALTER TABLE customers MODIFY COLUMN name INTEGER NOT NULL;