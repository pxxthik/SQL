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
3. ALTER
```sql
ALTER TABLE customers ADD COLUMN surname VARCHAR(255) NOT NULL AFTER name;
-- Adding multiple columns
ALTER TABLE customers
ADD COLUMN pan_num VARCHAR(255) AFTER surname,
ADD COLUMN joining_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
```
```sql
ALTER TABLE customers DROP COLUMN pan_num;
-- Deleting multiple column
ALTER TABLE customers
DROP COLUMN surname,
DROP COLUMN joining_date;
```
```sql
ALTER TABLE customers MODIFY COLUMN name INTEGER NOT NULL;
```

   - Alter for constraints
```sql
ALTER TABLE customers ADD CONSTRAINT customer_age_check CHECK (age > 18);
ALTER TABLE customers DROP CONSTRAINT customer_age_check;
```

### CONSTRAINTS

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

`Another way of adding constraints`
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

`Foreign key example`
```sql
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
```
We cant delete or update customers becouse of foreign key.\
Cannot delete or update a parent row: A foreign key constraints fails.. 


**REFERENTIAL ACTIONS**

If two tables are related via a foreign key. what happens to a record when you delete or update a related record.

   - Changing Referential acitions
   ```sql
   CREATE TABLE orders(
       order_id INTEGER PRIMARY KEY,
       cid INTEGER NOT NULL,
       order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

       CONSTRAINT orders_fk FOREIGN KEY (cid) REFERENCES customers(cid)
       ON DELETE CASCADE
       ON DELETE CASCADE
   );
   ```

   1. `RESTRICT` : (default) An error is returned and no rows are deleted
   2. `CASCADE` : 
       The delete operation is propagated to the dependents of p in D
   3. `SET NULL` : 
       Each nullable column of the foreign key of each dependent of p in D is set to null
   4. `SET DEFAULT` : Each column of the foreign key of each dependent of p in D is set to its default value