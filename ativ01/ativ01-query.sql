-- BD02 | 2022
-- Aluno: Augusto dos Santos Souza
-- RA: GU3020207
-- Aluno: César Augusto Ramos Reigado 
-- RA: GU3019977 
-- Aluna: Larissa Trivinho Gelesov 
-- RA: GU3020142

-- Busca o título do filme onde o ID da linguagem é 1
SELECT title, language_id
	FROM film
    WHERE language_id = '1'
    GROUP BY title;

-- Numero de vezes que X filme foi alugada
select a.film_Id, a.title, count(b.film_id) as vezes_alugas
from film as a 
inner join inventory as b on a.film_id = b.film_id where a.film_id = ? and b.film_id = ?;

-- Filmes que participou
SELECT a.actor_id, concat(a.first_name , " " ,  a.last_name)  as nome , count(b.film_id) as filmes_que_participou
FROM actor as a inner join film_actor as b on  a.actor_id = b.film_id where a.actor_id = 1;

-- o que cada cliente alugou , quando e quando devolveu
select 
concat(c.first_name , " " ,  c.last_name) as cliente,
f.title as filme,
r.rental_date as diaAlugado,
r.return_date as diaDevolução
from 
rental as r 
inner join customer as c on c.customer_id = r.customer_id
inner join inventory as i on r.inventory_id = i.inventory_id
inner join film as f on f.film_id = i.film_id
order by cliente;

-- Média de valor pagos em um pedido
select avg(amount) as mediaDeValores from payment;

-- Soma o numero de filmes que uma categoria tem 
SELECT  c.name , count(f.category_id) as numeroDefilmes FROM film_category as f
inner join category as c on f.category_id = c.category_id group by f.category_id order by c.name;

-- numero de vezes que um filme foi alugado
select a.film_Id, a.title, count(b.film_id) as vezes_alugadas
from film as a 
inner join inventory as b on a.film_id = b.film_id group by(b.film_id) order by vezes_alugadas;

-- numero de pedidos de cada cliente
SELECT concat(c.first_name , " " ,  c.last_name) as cliente , count(p.customer_id) as numeroDePedidos FROM customer as c
inner join payment as p  on c.customer_id = p.customer_id group by p.customer_id order by numeroDePedidos;

-- descrição mais tecnicas dos filmes
SELECT f.title as titulo , f.description as descrição, release_year as lançamento, c.name as Categoria FROM film as f
inner join film_category as fc on f.film_id = fc.film_id
inner join category as c on fc.category_id = c.category_id order by titulo;

-- devolve uma lista de filmes com X categoria
SELECT f.film_id , f.title FROM film as f 
inner join film_category as fc on f.film_id = fc.film_id where fc.category_id = ?;
-- Busca o título do filme onde o ID da linguagem é 1 ou da linguagem original também é 1
SELECT title
	FROM film
    WHERE language_id = '1' OR original_language_id = '1';

-- Lista as cidades de acordo com os países em ordem decrescente
SELECT city
    FROM city ci
        INNER JOIN country co
            ON ci.country_id = co.country_id
            GROUP BY city_id
            ORDER BY city_id DESC;

-- Busca o nome do ator e o ID do filme
SELECT first_name, last_name, film_id
	FROM actor a
		INNER JOIN film_actor f
            ON a.actor_id = f.actor_id
            GROUP BY film_id;

-- Busca unindo colunas store_id e film_id das tabelas store e inventory
SELECT store_id FROM store
UNION
SELECT film_id FROM inventory
ORDER BY store_id;

-- Altera a tabela country adicionando a coluna continent
ALTER TABLE country
ADD continent varchar(100);

ALTER TABLE country
MODIFY continent SMALLINT;

-- Seleciona os filmes cuja duração de locação são entr 2 e 4 em ordem crescente
SELECT film_id, title, release_year, rental_duration
FROM film
WHERE rental_duration BETWEEN 2 AND 4
ORDER BY rental_duration ASC;

-- Busca dos elementos de ID do endereço entre as tabelas store e staff
SELECT address_id FROM store
UNION ALL
SELECT address_id FROM staff
GROUP BY adress_id
ORDER BY address_id DESC;

-- Altera o cadastro de um ator ou atriz
UPDATE actor
    SET first_name = 'Alfredo', last_name = 'Pacino', last_update = '2006-02-14 04:34:33'
    WHERE actor_id = '1';

-- Esta consulta retorna a quantidade de empregados 
SELECT COUNT(staff_id) AS 'Qtd de empregados'
	FROM staff;

-- Calculando mínimo, máximo e média de pagamento de locação em todas as datas
SELECT payment_date, payment_id, 
	MIN(amount) AS 'Menor Pagamento', 
    MAX(amount) AS 'Maior Pagamento',
    AVG(amount) AS 'Media Pagamento'
    FROM payment
    GROUP BY payment_date
    ORDER BY payment_id ASC;

-- Esta consulta retorna a quantidade de consumidores que fizeram locação
SELECT COUNT(customer_id) AS 'qtde de consumidores'
	FROM rental r
        LEFT JOIN inventory i
            ON r.inventory_id = i.inventory_id
        ORDER BY i.inventory_id;

-- Busca retorna os valores de inventory e os em comum com store
SELECT manager_staff_id, inventory_id, film_id
	FROM store s 
		RIGHT JOIN inventory i 
			ON s.store_id = i.store_id
		GROUP BY manager_staff_id;

-- Busca retorna a quantidade de linguas disponíveis por filme em ordem decrescente
SELECT title, COUNT(language_id) AS 'linguas disponiveis'
	FROM film f 
    INNER JOIN film_category fc 
		ON f.film_id = fc.film_id
    GROUP BY title
    ORDER BY title DESC;

-- Compara o ID do consumidor com o ID de locação
SELECT customer.first_name, customer.customer_id, rental.rental_id
    FROM customer
    LEFT JOIN rental ON customer.customer_id = rental.rental_id
    ORDER BY customer.first_name;

-- Esta consulta retorna países com 10 ou mais cidades cadastradas
SELECT country, COUNT(city_id) as 'cidades>10'
	FROM country co
    INNER JOIN city ci
		ON ci.country_id = co.country_id
	GROUP BY country
	HAVING COUNT(city_id) >=10
    ORDER BY country ASC;

-- Busca alguma cidade que não esteja cadastrada em um país
SELECT city AS 'Cidade' FROM city
	WHERE country_id NOT IN (SELECT country_id FROM country);

-- Lista os clientes apenas ativos, ou seja, com active diferente de 0
SELECT first_name, last_name, email, active, payment_id
	FROM customer c
		INNER JOIN payment p
			ON c.customer_id = p.customer_id
		WHERE active != 0
	GROUP BY last_name;

-- Lista e classifica os clientes de acordo com os gastos, unindo as tabelas customer e payment
SELECT first_name, last_name, amount,
	CASE 
		WHEN amount < '1'
			THEN 'baixo'
        WHEN amount >= '1' and amount < '5'
			THEN 'médio'
		WHEN amount >= '5' 
			THEN 'alto'
	END AS pagto_locacao
FROM customer c
	INNER JOIN payment p 
		ON p.customer_id = c.customer_id
	GROUP BY amount
	ORDER BY amount ASC;

-- Selecione os clientes que atendem à condição do segundo endereço não ser nulo OU o cliente se chamar John
SELECT first_name AS 'nome', last_name AS 'sobrenome', 
	address AS 'endereço 1', address2 AS 'endereço 2'
	FROM customer c
        INNER JOIN address a
            ON a.address_id = c.address_id
        WHERE NOT first_name = 'John' OR address2 IS NOT NULL
    GROUP BY first_name;

