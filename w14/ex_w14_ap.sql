CREATE DATABASE IF NOT EXISTS ap_gu3019977;

USE ap_gu3019977;

#--Ex1
mysql -u root -p;

#--Ex2
CREATE USER IF NOT EXISTS ray_gu3019977 IDENTIFIED BY 'ray_gu3019977';
ALTER USER ray_gu3019977 PASSWORD EXPIRE INTERVAL 90 DAY;

GRANT SELECT, INSERT, UPDATE
ON ap_gu3019977.vendors
TO ray_gu3019977;

GRANT SELECT, INSERT, UPDATE
ON ap_gu3019977.invoices
TO ray_gu3019977;

GRANT SELECT, INSERT
ON ap_gu3019977.invoice_line_items
TO ray_gu3019977;

GRANT USAGE
ON *.*
TO ray_gu3019977
WITH GRANT OPTION;

#--Ex3
SHOW GRANTS FOR ray_gu3019977;

#--Ex4
#Login com ray_gu3019977

#--Ex5
SELECT id FROM fornecedores;

#--Ex6
SELECT id FROM fornecedores
    WHERE id = 0;

#--Ex7
mysql -u root -p;

#--Ex8
GRANT UPDATE
ON ap_gu3019977.invoice_line_items
TO ray_gu3019977
WITH GRANT OPTION;

#--Ex9
CREATE USER IF NOT EXISTS dorothy_gu3019977 IDENTIFIED BY 'donuts';
CREATE ROLE IF NOT EXISTS ap_user;

GRANT SELECT, INSERT, UPDATE
ON ap_gu3019977.*
TO ap_user
WITH GRANT OPTION;

GRANT ap_user to dorothy_gu3019977;

#--Ex10
SHOW GRANTS FOR dorothy_gu3019977;

#--Ex11
#Login com dorothy_gu3019977

#--Ex12
SELECT CURRENT_ROLE();

#--Ex13
mysql -u root -p;

#--Ex14
SET DEFAULT ROLE ap_user_gu3019977 TO dorothy_gu3019977;

#--Ex15
#Login com dorothy_gu3019977
SELECT CURRENT_ROLE();