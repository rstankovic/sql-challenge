--#1
SELECT e.emp_no, e.last_name, e.first_name, e.gender,s.salary FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no;
--#2
SELECT emp_no, last_name, first_name, gender, hire_date FROM employees
WHERE CAST (SUBSTRING(hire_date,1,4) AS INTEGER) = 1986;

--#3
SELECT 
	m.dept_no, d.dept_name, m.emp_no, 
	e.last_name, e.first_name, m.from_date, m.to_date 
FROM departments AS d
INNER JOIN dept_manager AS m
ON d.dept_no = m.dept_no
INNER JOIN employees AS e
ON m.emp_no = e.emp_no;

--#4
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no
FROM employees AS e
INNER JOIN dept_emp AS d
ON d.emp_no = e.emp_no;
--#5
SELECT * FROM employees
WHERE first_name = 'Hercules' AND SUBSTRING(last_name,1,1) = 'B';

--#6
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no
FROM employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
INNER JOIN departments AS dp
ON d.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales';

--#7
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no
FROM employees AS e
INNER JOIN dept_emp AS d
ON e.emp_no = d.emp_no
INNER JOIN departments AS dp
ON d.dept_no = dp.dept_no
WHERE dp.dept_name = 'Sales' OR dp.dept_name = 'Development';

--#8
SELECT COUNT(last_name), last_name FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

