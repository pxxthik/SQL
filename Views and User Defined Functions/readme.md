# Views

A virtual table whose contents are defined by a query. Once a view is created, it can be used in the same way as a table in SQL queries, and any changes made to the underlying tables will be reflected in the view.

1. **Read-only views**: As the name suggests, read-only views are views that cannot be updated.
2. **Updatable views**: Updatable views are views that allow you to modify, insert or delete data in the underlying tables through the view.

To make a view updatable, certain conditions must be met. For example, the view
must not contain any derived columns, subqueries, or aggregate functions.
Additionally, the view must be based on a single table or a join of tables with a
unique one-to-one relationship.

```sql
CREATE VIEW it_employees AS
SELECT id, name, department, salary
FROM employees
WHERE department = 'IT' AND salary > 50000;

SELECT * FROM it_employees;
```

# User Defined Functions

A routine that accepts parameters, performs an action, and returns the result as a value. These functions can be used just like built-in functions in SQL and can take parameters as input, perform some

operations on them, and then return a value.

```sql
CREATE FUNCTION CalculateAgeInYears (@dob DATE)
RETURNS INT
AS
BEGIN
    DECLARE @age INT
    SET @age = DATEDIFF(YEAR, @dob, GETDATE())
    RETURN @age
END
```
```sql
DROP FUNCTION [IF EXISTS] function_name;
```