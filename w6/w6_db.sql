CREATE SCHEMA mercado_online;
USE mercado_online;

create table salary_survey(
country varchar(50),
years_experience bigint,
employment_status varchar(50),
job_title varchar(50),
is_manager varchar(5),
education_level varchar(50)
);

CREATE TABLE order_items(
order_item_id ,
created_at,
order_id,
price_id,
cogs_ud,
website_session_id
);

CREATE TABLE employees_audit (
id INT AUTO_INCREMENT PRIMARY KEY,
employeeNumber INT NOT NULL,
lastname VARCHAR(50) NOT NULL,
changedat DATETIME DEFAULT NULL,
action VARCHAR(50) DEFAULT NULL
);

CREATE TRIGGER tgr_employee_update
BEFORE UPDATE ON employees
FOR EACH ROW
INSERT INTO employees_audit
SET action = 'update',
employeeNumber = OLD.employeeNumber,
lastname = OLD.lastname,
changedat = NOW();

CREATE TABLE membros (id INT
AUTO_INCREMENT, nome VARCHAR(100)
NOT NULL, email VARCHAR(255),
dataNascimento DATE, PRIMARY KEY (id));

CREATE TABLE lembrete (id INT
AUTO_INCREMENT, membroId INT,
mensagem VARCHAR(255) NOT NULL,
PRIMARY KEY (id , membroId));

#Triggers

DELIMITER $$
CREATE TRIGGER after_membros_insert
AFTER INSERT
ON members FOR EACH ROW
BEGIN
IF NEW.dataNascimento IS NULL THEN
INSERT INTO lembrete(membroId, mensagem)
VALUES(new.id,CONCAT(‘Olá ', NEW.nome, ‘, por favor
atualize sua data de nascimento'));
END IF;
END$$
DELIMITER ;

INSERT INTO membros (nome, email, dataNascimento)
VALUES
('John Doe', 'john.doe@example.com', NULL),
('Jane Doe', 'jane.doe@example.com','2000-01-01');