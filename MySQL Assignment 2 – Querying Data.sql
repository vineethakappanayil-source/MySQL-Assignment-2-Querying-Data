use employee;
-- 1. Distinct Values: 
-- a query to retrieve distinct salaries from the Employees table. 
select  distinct salary 
from employees
order by salary;
-- 2. Alias (AS): 
-- Provide aliases for the "age" and "salary" columns as "Employee_Age" and "Employee_Salary", respectively.
select age as Employee_Age ,
salary as Employee_Salary
from employees;
-- 3. Where Clause & Operators: 
--  Retrieve employees with a salary greater than ₹50000 and hired before 2016-01-01. 
select * from employees
where salary > 50000 and hire_date < '2016-01-01';
-- Find the employee whose designation is missing .
select* from employees where designation is null;
-- fill it with "Data Scientist". 
update employees
set designation = 'Data Scientist'
where  designation is null;
set sql_safe_updates=0;
select*
 from employees
where designation = 'Data Scientist';

-- Sorting and Grouping Data.
-- 1. ORDER BY: 
-- Find employees sorted by department ID in ascending order and salary in descending order.
select *  from employees
order by department_id asc, salary desc;
-- 2. LIMIT: 
-- Display the first 5 employees hired in the year 2018.
select * from employees
where hire_date>='2018-01-01'
  and hire_date < '2019-01-01'
order by hire_date asc
limit 5;
-- 3. Aggregate Functions: 
-- Calculate the sum of all salaries in the Finance department.
select sum(e.salary) as total_finance_salary
from employees e
join departments  d
    on e.department_id = d.department_id
where d.department_name = 'Finance';
-- Find the minimum age among all employees. 
select min(age) as min_age from employees;
-- 4. GROUP BY: 
-- List the maximum salary for each location. 
select l.location, MAX(e.salary) as maximum_salary
from location as l
join employees as e
on l.location_id = e.location_id
group by l.location_id, l.location
order by l.location;
 --  Calculate the average salary for each designation containing the word 'Analyst'. 
select designation, avg(salary) as average_salary
from employees
where designation like '%Analyst%'
group by designation
order by designation;
-- 5. HAVING: 
-- Find departments with less than 3 employees.
select d.department_id, d.department_name,
       count(e.employee_id)  as employee_count
FROM departments AS d
LEFT JOIN employees AS e
    ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name
HAVING COUNT(e.employee_id) < 3
ORDER BY d.department_id;
 -- Find locations with female employees whose average age is below 30. 
 SELECT l.location, AVG(e.age) AS avg_age
FROM employees e
JOIN location l ON e.location_id = l.location_id
WHERE e.gender = 'F'
GROUP BY l.location
HAVING AVG(e.age) < 30;
-- Joins: 
-- 1. Inner Join: 
--  List employee names, their designations, and department names where employees are assigned to a department. 
SELECT e.employee_name, e.designation, d.department_name
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id;
-- 2. Left Join: 
-- List all departments along with the total number of employees in each department, including departments with no employees.
SELECT d.department_name, COUNT(e.employee_id) AS total_employees
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id, d.department_name;
-- 3. Right Join: 
--  Display all locations along with the names of employees assigned to each location. If no employees are assigned to a location, display NULL for employee name. 
SELECT l.location, e.employee_name
FROM employees e
RIGHT JOIN location l ON e.location_id = l.location_id
ORDER BY l.location, e.employee_name;