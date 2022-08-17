use hr; #Olhar nome do banco na Semana 2

# Trecho prório - tentativa errada / arrumar #
SELECT country_name, 
	COUNT(country_id) 
	FROM countries
	INNER JOIN locations
	GROUP BY region_id;

# Aula #
# Esta consulta retorna a quantidade de empregados por departamento #
SELECT department_name, 
	COUNT(employee_id) AS 'qtde de empregados'
	FROM employees INNER JOIN 
    departments ON employees.department_id = departments.department_id
    GROUP BY departments.department_id;

# Mesma consulta com 'apelido' nas tabelas #
SELECT department_name, 
	COUNT(employee_id) AS 'qtde de empregados'
	FROM employees e INNER JOIN 
    departments d ON e.department_id = d.department_id
    GROUP BY d.department_id;

# Consulta com ordenação de número de empregados decrescente #
SELECT department_name, 
	COUNT(employee_id) AS 'qtde_de_empregados'
	FROM employees e INNER JOIN 
    departments d ON e.department_id = d.department_id
    GROUP BY d.department_id
    ORDER BY COUNT(employee_id) DESC; #poderia ser COUNT(qtde_de_empregados)

#Usando HAVING na busca #
SELECT department_name, 
	COUNT(employee_id) AS 'qtde_de_empregados'
	FROM employees e 
    INNER JOIN departments d 
		ON e.department_id = d.department_id
    GROUP BY d.department_id
    HAVING qtde_de_empregados >=5
    ORDER BY COUNT(qtde_de_empregados) DESC;

# Calculando mínimo, máximo e média salarial por departamento #
SELECT department_name, 
	MIN(salary) AS 'Menor Sal.', 
    MAX(salary) AS 'Maior Sal.',
    AVG(salary) AS 'Media Sal.'
    FROM employees e
    INNER JOIN departments d
		ON e.department_id = d.department_id
    GROUP BY department_name;
    
# Calculando total salarial agrupado por departamento #
SELECT department_name,
	SUM(salary) AS 'Sal. Total'
    FROM employees e
    INNER JOIN departments d
		ON e.department_id = d.department_id
    GROUP BY department_name
    ORDER BY SUM(salary) ASC;
    
# GROUP BY com múltiplas colunas #
SELECT department_name,
	job_title, 
    COUNT(employee_id) AS 'Total Empregados'
    FROM employees e
		INNER JOIN departments d
			ON e.department_id = d.department_id
		INNER JOIN jobs j
			ON e.job_id = j.job_id
    GROUP BY department_name, job_title;

# CASE SQL #
SELECT first_name, last_name, hire_date,
	CASE(2022 - YEAR(hire_date))
		WHEN 1 THEN '1 ANO DE EMPRESA'
        WHEN 2 THEN '2 ANOS DE EMPRESA'
        WHEN 3 THEN '3 ANOS DE EMPRESA'
	END aniversario
FROM employees
    
# Tentar terminar #
# CASE SQL #
SELECT first_name, last_name, hire_date;
	SET @year = 2022 - YEAR(hire_date);
    
	CASE(2022 - YEAR(hire_date))
		WHEN 1 THEN '1 ANO DE EMPRESA'
		WHEN 2 THEN '2 ANOS DE EMPRESA'
        WHEN 3 THEN '3 ANOS DE EMPRESA'
	END aniversario
    