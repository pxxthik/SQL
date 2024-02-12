# SQL Joins

    A join clause in the Structured Query Language (SQL) combines columns from one or more tables into a new table.

![SQL-joins-image](https://miro.medium.com/v2/resize:fit:1100/format:webp/1*4lPn1y63GGLKsEEpLxS8BQ.png)

## Cross Join
    CROSS JOIN returns the Cartesian product of rows from tables in the join. In other words, it will produce rows which combine each row from the first table with each row from the second table.

Example of an explicit cross join:
```sql
SELECT *
FROM employee CROSS JOIN department;
```
Example of an implicit cross join:
```sql
SELECT *
FROM employee, department;
```
The cross join can be replaced with an inner join with an always-true condition:
```sql
SELECT *
FROM employee INNER JOIN department ON 1=1;
```

## Inner Join
    An inner join (or join) requires each row in the two joined tables to have matching column values

```sql
SELECT employee.LastName, employee.DepartmentID, department.DepartmentName 
FROM employee 
INNER JOIN department ON
employee.DepartmentID = department.DepartmentID;

SELECT employee.LastName, employee.DepartmentID, department.DepartmentName 
FROM employee, department
WHERE employee.DepartmentID = department.DepartmentID;
```

### Equi-join
    An equi-join is a specific type of comparator-based join, that uses only equality comparisons in the join-predicate. Using other comparison operators (such as <) disqualifies a join as an equi-join.
    
```sql
SELECT *
FROM employee JOIN department
ON employee.DepartmentID = department.DepartmentID;

SELECT *
FROM employee, department
WHERE employee.DepartmentID = department.DepartmentID;

SELECT *
FROM employee INNER JOIN department USING (DepartmentID);
```

#### Natural Join
    The natural join is a special case of equi-join.
```sql
SELECT *
FROM employee NATURAL JOIN department;
```

## Outer Join
### Left Outer Join
```sql
SELECT *
FROM employee 
LEFT OUTER JOIN department ON employee.DepartmentID = department.DepartmentID;

-- Alternative syntaxes
SELECT *
FROM employee, department
WHERE employee.DepartmentID = department.DepartmentID(+)
```

### Right Outer Join
```sql
SELECT *
FROM employee RIGHT OUTER JOIN department
  ON employee.DepartmentID = department.DepartmentID;
```

### Full Outer Join
```sql
SELECT *
FROM employee FULL OUTER JOIN department
  ON employee.DepartmentID = department.DepartmentID;
```

    Some database systems do not support the full outer join functionality directly, but they can emulate it through the use of an inner join and UNION ALL selects of the "single table rows" from left and right tables respectively.
    
```sql
SELECT *
FROM Table1
LEFT OUTER JOIN Table2
ON Table1.column_match = Table2.column_match
UNION
SELECT *
FROM Table1
RIGHT OUTER JOIN Table2
ON Table1.column_match = Table2.column_match;
```

## Self Join
```sql
SELECT e1.employee_id AS employee_id, e1.manager_id AS manager_id,
       e2.employee_id AS manager_employee_id, e2.manager_id AS manager_manager_id
FROM employees e1
JOIN employees e2 ON e1.manager_id = e2.employee_id;
```