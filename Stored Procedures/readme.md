# Stored Procedures

A group of SQL statements and logic that are stored in a database.

```sql
CREATE PROCEDURE GetEmployeeByID
    @EmployeeID INT
AS
BEGIN
    SELECT * FROM Employees WHERE EmployeeID = @EmployeeID;
END;
```
```sql
EXEC GetEmployeeByID @EmployeeID = 123;
```