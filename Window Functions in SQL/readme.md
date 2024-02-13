# Window Functions in SQL

A window function performs a calculation across a set of table rows that are somehow related to the current row. This is comparable to the type of calculation that can be done with an aggregate function. But unlike regular aggregate functions, use of a window function does not cause rows to become grouped into a single output row — the rows retain their separate identities. Behind the scenes, the window function is able to access more than just the current row of the query result.

![SQL-window_functions](https://miro.medium.com/v2/resize:fit:1100/format:webp/1*PyBvYNwMbY75cBcc4TRl7g.jpeg)

**The most practical example of this is a running total:**
```sql
SELECT runs, SUM(runs) OVER() FROM cricket_score;
```

**The window function is applied to each partition separately and computation restarts for each partition**
```sql
SELECT *, SUM(marks) OVER(PARTITION BY branch ORDER BY roll_number) FROM marks;
```

### RANK()

Assigns a unique rank to each row within a result set based on the values in one or more columns. Rows with the same values receive the same rank, and the next rank is skipped.

```sql
SELECT *, RANK() OVER (ORDER BY exam_score DESC) AS rank
FROM exam_results;
```

### DENSE_RANK()

DENSE_RANK() is similar to RANK(), but it assigns ranks without skipping any values, even if multiple rows share the same rank.

```sql
SELECT *, DENSE_RANK() OVER (ORDER BY exam_score DESC) AS dense_rank
FROM exam_results;
```

### ROW_NUMBER()

It does just what it sounds like—displays the number of a given row. It starts are 1 and numbers the rows according to the ORDER BY part of the window statement.

```sql
SELECT *, ROW_NUMBER() OVER (ORDER BY score DESC) AS rank
FROM students;
```

## Frames

A frame in a window function is a subset of rows within the partition.

Common frame specifications include:
1. `ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW` - (Default) This includes all rows from the start of the window (unbounded preceding) up to and including the current row.
2. `ROWS BETWEEN n PRECEDING AND m FOLLOWING` - This includes a specified number of rows before (preceding) and after (following) the current row.
3. `ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING` - This includes all rows in the window, from the start to the end.

### FIRST_VALUE()
Returns the value of a specified column from the first row within the defined window or frame of rows.
```sql
SELECT *,
  FIRST_VALUE(sales_amount) OVER (PARTITION BY region ORDER BY sales_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS first_sale_amount
FROM sales_data;
```

### LAST_VALUE()
Returns the value of a specified column from the last row within the defined window or frame of rows.
```sql
SELECT *,
  LAST_VALUE(sales_amount) OVER (PARTITION BY region ORDER BY sales_date ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_sale_amount
FROM sales_data;
```

### NTH_VALUE()

Retrieve the value of a specified column from the nth row within a defined window or frame of rows within a result set.

```sql
NTH_VALUE(column_name, n) OVER (
  PARTITION BY partition_column
  ORDER BY order_column
  ROWS BETWEEN unbounded preceding AND unbounded following
) AS nth_value_result
```

### LAG()
Retrieves the value of a specified column from the previous row
```sql
SELECT employee_name, salary,
  LAG(salary, 1) OVER (PARTITION BY department ORDER BY hire_date) AS previous_salary
FROM employees;
```

### LEAD()
Retrieves the value of a specified column from the next row
```sql
#syntex
LEAD(column_name, n) OVER (
  PARTITION BY partition_column
  ORDER BY order_column
) AS leading_value
```