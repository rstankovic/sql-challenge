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
