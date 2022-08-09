SELECT * FROM employees;
SELECT * FROM departments; 

SELECT * FROM employees INNER JOIN
	departments ON employees.department_id = departments.department_id;
    
SELECT first_name, last_name, department_name
	FROM employees INNER JOIN
    departments ON employees.department_id = departments.department_id
    WHERE department_name = 'IT';
    
SELECT first_name, last_name, job_title, department_name
	FROM employees 
		INNER JOIN 
			jobs ON employees.job_id = jobs.job_id
		INNER JOIN
			departments ON employees.department_id = departments.department_id;