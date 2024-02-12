# SQL Grouping + Sorting

    A GROUP BY statement in SQL specifies that a SQL SELECT statement partitions result rows into groups, based on their values in one or several columns. Typically, grouping is used to apply some sort of aggregate function for each group.

```sql
-- Returns a list of Department IDs along with the sum of their sales for the date of January 1, 2000.
SELECT DeptID, SUM(SaleAmount) FROM Sales
WHERE SaleDate = '01-Jan-2000'
GROUP BY DeptID;
```

```sql
SELECT Region, Ship_Date, SUM(Units) AS Sum_of_Units
FROM FlatData
GROUP BY Region, Ship_Date
```

**Using Having clause**
```sql
SELECT NAME, SUM(sal) FROM Emp
GROUP BY name
HAVING SUM(sal)>3000; 
```

**Order by**

```sql
SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;
```