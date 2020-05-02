--DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments (
	dept_no VARCHAR(10),
	dept_name VARCHAR(30)
);
--DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
	emp_no INTEGER,
	birth_date VARCHAR(10),
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	gender VARCHAR(10),
	hire_date VARCHAR(10)
);
--DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
	emp_no INTEGER,
	dept_no VARCHAR(10),
	from_date VARCHAR(10),
	to_date VARCHAR(10)
);
--DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR(10),
	emp_no INTEGER,
	from_date VARCHAR(10),
	to_date VARCHAR(10)
);
--DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
	emp_no INTEGER,
	salary FLOAT(24),
	from_date VARCHAR(10),
	to_date VARCHAR(10)
);
--DROP TABLE IF EXISTS titles;
CREATE TABLE titles (
	emp_no INTEGER,
	title VARCHAR(20),
	from_date VARCHAR(10),
	to_date VARCHAR(10)
);

ALTER TABLE employees
ADD CONSTRAINT emp_no
	PRIMARY KEY (emp_no);
	
ALTER TABLE dept_emp
ADD CONSTRAINT emp_no 
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

ALTER TABLE dept_manager
ADD CONSTRAINT emp_no
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
	
ALTER TABLE salaries
ADD CONSTRAINT emp_no
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
	
ALTER TABLE titles
ADD CONSTRAINT emp_no
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no);
	
ALTER TABLE departments
ADD CONSTRAINT dept_no
	PRIMARY KEY (dept_no);
	
ALTER TABLE dept_emp
ADD CONSTRAINT dept_no
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no);
	
ALTER TABLE dept_manager
ADD CONSTRAINT dept_no
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no);

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

