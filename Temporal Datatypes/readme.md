# Temporal Datatypes

1. `DATE` - used for storing date values in the format YYYY-MM-DD.
2. `TIME` - used for storing time values in the format HH:MM:SS.
3. `DATETIME` - used for storing date and time values in the format YYYY-MM-DD HH:MM:SS.
4. `TIMESTAMP` - used for storing date and time values in the format YYYY- MM-DD HH:MM:SS. It has a range of 1970-01-01 00:00:01 UTC to 2038-01-19 03:14:07 UTC.
5. `YEAR` - used for storing year values in 2-digit or 4-digit format (YYYY or YY).If the year is specified with 2 digits, it is assumed to be in the range 1970-2069 (inclusive).\

## DATETIME Functions

1. **CURR_DATE()**: Returns the current date from the system clock.
```sql
SELECT CURR_DATE() AS current_date;
```

2. **CURR_TIME()**: Retrieve the current time from the system clock
```sql
SELECT CURR_TIME() AS current_time;
```

3. **NOW()**: Retrieve the current date and time from the system clock.
```sql
SELECT NOW() AS current_datetime;
```

### Extraction Function
1. **DATE() and TIME()**: `DATE()` function is typically used to extract the date part from a given datetime expression.`TIME()` function is typically used to extract the time part from a datetime expression. 
```sql
SELECT DATE(datetime_column) AS date_only FROM your_table;
SELECT TIME(datetime_column) AS time_only FROM your_table;
```

2. **YEAR()**: Used to extract the year part from a date or datetime expression.
```sql
SELECT YEAR(date_column) AS year_only FROM your_table;
```

3. **DAY() or DAYOFMONTH()()**: `DAY()` and `DAYOFMONTH()` functions are commonly used to extract the day of the month from a date or datetime expression.
```sql
SELECT DAY(date_column) AS day_only FROM your_table;
SELECT DAYOFMONTH(date_column) AS day_only FROM your_table;
```

4. **DAYOFWEEK()**: Retrieve the day of the week from a given date.
```sql
SELECT DAYOFWEEK(date_column) AS day_of_week FROM your_table;
```

5. **DAYOFYEAR()**: Retrieve the day of the year from a given date.
```sql
SELECT DAYOFYEAR(date_column) AS day_of_year FROM your_table;
```

6. **MONTH() and MONTHNAME()**: `MONTH()` and `MONTHNAME()` functions are commonly used to extract and manipulate the month part of a date or datetime expression.
```sql
SELECT MONTH(date_column) AS month_number FROM your_table;
SELECT MONTHNAME(date_column) AS month_name FROM your_table;
```

7. **QUARTER()**: Extract the quarter from a given date.
```sql
SELECT QUARTER(date_column) AS quarter FROM your_table;
```

8. **WEEK() or WEEKOFYEAR()**: `WEEK()` function returns the week number for a given date. `WEEKOFYEAR()` function returns the week number for a given date, where the week begins on a specific day of the week (e.g., Sunday or Monday) and ends on the following day.
```sql
SELECT WEEK(date_column) AS week_number FROM your_table;
SELECT WEEKOFYEAR(date_column) AS week_of_year FROM your_table;
```
9. **HOUR() -> MINUTE() -> SECOND()**: `HOUR()`, `MINUTE()`, and `SECOND()` functions are used to extract the hour, minute, and second parts from a given time or datetime expression
```sql
SELECT HOUR(time_column) AS hour FROM your_table;
SELECT MINUTE(time_column) AS minute FROM your_table;
SELECT SECOND(time_column) AS second FROM your_table;
```

10. **LAST_DAY()**: Return the last day of the month for a given date or datetime expression
```sql
SELECT LAST_DAY(date_column) AS last_day_of_month FROM your_table;
```


## Datetime Formatting
[Datetime-formatting](https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format)

1. **DATE_FORMAT()**: Used to format date and time values according to a specified format string.
```sql
SELECT DATE_FORMAT(date_column, '%Y-%m-%d') AS formatted_date FROM your_table;
```

2. **TIME_FORMAT()**: Used to format time values according to a specified format string.
```sql
SELECT TIME_FORMAT(time_column, '%H:%i:%s') AS formatted_time FROM your_table;
```

## Type conversion

1. **Implicit Type Conversion**
2. **Explicit Type Conversion -> STR_TO_DATE()**: Used to convert a string representation of a date and/or time into a proper DATE, TIME, or DATETIME value based on a specified format. This function is particularly useful when dealing with date values stored as strings in non-standard formats.
```sql
SELECT STR_TO_DATE(date_string, '%Y-%m-%d') AS date_value FROM your_table;
```

## DATETIME Arithmetic
1. **DATEDIFF()**: Calculates the difference between two dates and returns the result as an integer.
```sql
SELECT DATEDIFF('2024-02-14', '2024-02-10') AS date_difference;
```

2. **TIMEDIFF()**: Calculate the difference between two time or datetime values and returns the result as a time interval.
```sql
SELECT TIMEDIFF('14:30:00', '12:00:00') AS time_difference;
```

3. **DATE_ADD() and DATE_SUB() INTERVAL**: `DATE_ADD()` and `DATE_SUB()` functions are used to add or subtract intervals from a given date or datetime value.
```sql
SELECT DATE_ADD('2024-02-14', INTERVAL 3 DAY) AS new_date;
SELECT DATE_SUB('2024-02-14', INTERVAL 1 MONTH) AS new_date;
```

4. **ADDTIME() and SUBTIME()**: Used to perform datetime arithmetic by adding or subtracting time intervals from given time or datetime values.
```sql
SELECT ADDTIME('12:00:00', '01:30:00') AS new_time;
SELECT SUBTIME('14:30:00', '00:45:00') AS new_time;
```