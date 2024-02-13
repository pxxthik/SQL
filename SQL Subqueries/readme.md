# SQL Subqueries

It is a query inside of a query.

![SQL-subqueries-image](https://miro.medium.com/v2/resize:fit:1100/format:webp/0*QQs9HwVYiA4LgaKS.png)

## Types of subqueries

### 1. The result it returns
- `Scalar subquery`
```sql
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);
```
- `Row subquery`
```sql
SELECT * FROM t1 WHERE (col1,col2) = (SELECT col3, col4 FROM t2 WHERE id = 10);
```
- `Table subquery`
```sql
WITH top_duos AS (
    SELECT star, director MAX(gross) FROM movies
    GROUP BY star, director
    ORDER BY SUM(gross) DESC LIMIT 0 1
)

SELECT * FROM movies
WHERE (star, director, gross) IN (SELECT * FROM top_duos);
```

## 2. Based on working
- `Independent subquery`
```sql
SELECT * FROM Employee
WHERE salary = (SELECT MIN (salary) FROM Employee);
```
- `Correlated subquery`
```sql
SELECT * FROM employees e
WHERE salary > (
        SELECT AVG(salary) 
        FROM employees 
        WHERE department_id = e.department_id
    );
```

## Where can subqueries be used
**Insert**
```sql
INSERT INTO products_bkp (product_id, product_name, product_price)
SELECT product_id, product_name, product_price FROM products;

INSERT INTO employees (employee_name, department_id)
VALUES ('John Doe', (SELECT department_id FROM departments WHERE department_name = 'Sales'));

```

**Select**
- `Where`
```sql
SELECT team_name FROM team
WHERE team_id IN (SELECT team_id FROM game WHERE points >= 130);
```
- `Select`
```sql
SELECT customer_name,
    (SELECT COUNT(*) FROM orders WHERE orders.customer_id = customers.customer_id) AS order_count
FROM customers
```
- `From`
```sql
SELECT *
FROM (
    SELECT customer_id, COUNT(*) AS num_orders
    FROM orders
    GROUP BY customer_id
) AS order_counts
JOIN customers ON order_counts.customer_id = customers.customer_id;
```
- `Having`
```sql
SELECT department_id, COUNT(*) AS num_employees
FROM employees
GROUP BY department_id
HAVING COUNT(*) > (SELECT COUNT(*) FROM employees WHERE department_id = 10);
```

**Update**
```sql
UPDATE loyal_customers t1
SET t1.money = (
    SELECT user_id, SUM(amount)*0.1 AS money FROM orders
    GROUP BY use_id
) t2
WHERE t1.user_id = t2.user_id
```

**Delete**
```sql
DELETE FROM orders WHERE paid_date IN (SELECT paid_date FROM orders WHERE paid_date < CURRENT DATE);
```