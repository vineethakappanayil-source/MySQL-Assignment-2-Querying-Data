# MySQL Assignment 2 – Querying Data

## Overview

This assignment practices querying and updating data in the `employee` database created in Assignment 1. It uses the supplied employee data and demonstrates filtering, sorting, aggregate functions, grouping, and joins in MySQL.

## Database schema used

The solution uses these exact table and column names from the assignment files:

- `departments`: `department_id`, `department_name`
- `location`: `location_id`, `location`
- `employees`: `employee_id`, `employee_name`, `gender`, `age`, `hire_date`, `designation`, `department_id`, `location_id`, `salary`

`employees.department_id` relates employees to `departments.department_id`, and `employees.location_id` relates employees to `location.location_id`.

## Requirements

- MySQL and the Assignment 1 database and tables.
- The supplied `employee data.sql` insert script.


## How to run

1. Complete Assignment 1 so the `employee` database and its three tables exist.
2. In MySQL Workbench, open and run the supplied `employee data.sql` script once to insert the sample data. Do not run it again if those rows are already present; duplicate primary keys may cause errors.
3. Open `mysql_assignment_2_solution.sql` and execute it in the same MySQL connection. Its first statement selects the `employee` database.
4. Review each query's result grid. The comments in the SQL file label each section to match the assignment.

The solution does not drop or recreate the database or tables.

## Assignment coverage

### Distinct values and aliases

- Lists distinct salary values.
- Displays `age` as `Employee_Age` and `salary` as `Employee_Salary`.

### Filtering and updating

- Finds employees earning more than 50000 who were hired before `2016-01-01`.
- Finds the employee with a missing `designation`, then fills it with `Data Scientist` as required. In the provided data, this updates employee 5004, Kiara Malhotra.

### Sorting, limiting, and aggregates

- Sorts employees by `department_id` ascending and `salary` descending.
- Shows the first five employees hired in 2018, ordered by hire date.
- Calculates the total salary for the Finance department and the minimum employee age.

### Grouping and HAVING

- Finds the maximum salary for each location.
- Calculates average salary by designation for designations containing `Analyst`.
- Lists departments with fewer than three employees, including departments with no employees.
- Finds locations where female employees' average age is below 30.

### Joins

- Uses an inner join to list employees assigned to departments with their department names.
- Uses a left join to list every department and its employee count, including zero-count departments.
- Uses a right join to list every location and its employees, showing `NULL` when a location has no assigned employees.

## MySQL notes

- Use `IS NULL` to find a missing value; `= NULL` does not work as expected in SQL.
- The employee-count query counts `employee_id`, so the unmatched row created by a left join is not counted as an employee.
- The female average-age query filters to `gender = 'F'` before grouping, so only female employees contribute to each average.
- The solution uses MySQL-supported `LIMIT` and `RIGHT JOIN` syntax.
