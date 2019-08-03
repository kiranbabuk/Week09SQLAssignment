--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 
	emp.emp_no as "Employee Number"
	, emp.last_name as "Last Name"
	, emp.first_name as "First Name"
	, emp.gender as "Gender"
	, sal.salary as "Salary"
FROM
	employees emp
	, salaries sal
WHERE 
	emp.emp_no = sal.emp_no;

--List employees who were hired in 1986.
SELECT
	*
FROM
	employees emp
WHERE
	emp.hire_date like '1986%';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	dept.dept_no as "Department Number"
	, dept.dept_name as "Department Name"
	, dmgr.emp_no as "Manager''s Employee Number"
	, emp.last_name as "Last Name"
	, emp.first_name as "First Name"
	, dmgr.from_date as "Start Date"
	, dmgr.to_date as "End Date"
FROM
	dept_manager dmgr
	, departments dept
	, employees emp
WHERE
	dmgr.dept_no = dept.dept_no and
	dmgr.emp_no = emp.emp_no;

--List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	emp.emp_no as "Employee Number"
	, emp.last_name	as "Last Name"
	, emp.first_name as "First Name"
	, dept.dept_name as "Department Name"
FROM
	dept_emp de
	, employees emp
	, departments dept
WHERE
	de.emp_no = emp.emp_no and
	de.dept_no = dept.dept_no;
	
--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT
	*
FROM
	employees emp
WHERE
	emp.first_name = 'Hercules' and
	emp.last_name like 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	emp.emp_no as "Employee Number"
	, emp.last_name	as "Last Name"
	, emp.first_name as "First Name"
	, dept.dept_name as "Department Name"
FROM
	dept_emp de
	, employees emp
	, departments dept
WHERE
	de.emp_no = emp.emp_no and
	de.dept_no = dept.dept_no and
	dept.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	emp.emp_no as "Employee Number"
	, emp.last_name	as "Last Name"
	, emp.first_name as "First Name"
	, dept.dept_name as "Department Name"
FROM
	dept_emp de
	, employees emp
	, departments dept
WHERE
	de.emp_no = emp.emp_no and
	de.dept_no = dept.dept_no and
	dept.dept_name in ('Sales', 'Development');

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	last_name as "Employee Last Name"
	, count(1) as "Count"
FROM
	employees
GROUP BY
	last_name
ORDER BY
	2 DESC;