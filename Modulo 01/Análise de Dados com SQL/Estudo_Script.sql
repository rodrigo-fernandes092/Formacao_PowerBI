-- ANÁLISE DESCRITIVA 
SELECT * FROM Customer c ;
SELECT  COUNT(*) Qtd_Customer FROM Customer c; 

SELECT COUNT(*) FROM Customer c ;

-- Selecionando Company sem campo nulo

SELECT Company, Country FROM Customer c WHERE Company IS NOT NULL;



--	Caracterizando os registos dos artistas 

SELECT a2.ArtistId, a2.Name, count(*) as Records 
FROM Album a  INNER JOIN Artist a2 
GROUP BY 2 ORDER BY Records LIMIT 10 ;


-- Quantos clientes moram em São Paulo?

SELECT count(*) FROM Customer c WHERE City LIKE '%São Paulo%'; --Resposta 2



-- Selecionando dados presente entre duas tabelas com subquery
SELECT c.FirstName, c.LastName FROM  Customer c 
	WHERE Company IS NULL AND c.FirstName IN 
		(SELECT e.FirstName FROM Employee e);
	
-- Selecionando Dados presente nas duas tabelas com Inner Join

SELECT c.FirstName, c.LastName 
FROM Customer c INNER JOIN Employee e 
WHERE c.FirstName  = e.FirstName ;


-- Caracterizando os Registros de Invoice 

SELECT * FROM Invoice i LIMIT 20 ;

SELECT * FROM InvoiceLine il ORDER BY Quantity DESC LIMIT 20;


----- Quantidade de valores na base de dados ---Agrupamento de por valores
SELECT UnitPrice, COUNT(*) AS Records 
FROM InvoiceLine il GROUP BY UnitPrice ;



---


SELECT * FROM InvoiceLine il INNER JOIN Invoice i  LIMIT 10;


-- Query Lista de Clientes que possuem Invoice e a quantidade para cada cliente.
---- Utilizando as tabelas Invoice e InvoiceLine

SELECT c.CustomerId, C.FirstName, COUNT(*) AS Record FROM Invoice i 
	INNER JOIN InvoiceLine il 
	INNER JOIN Customer c ON c.CustomerId = i.CustomerId -- Condicional para associar FirstName com CustomerId
	GROUP BY 1 ORDER BY Record;

--- Classificando valores usando CASE

SELECT BillingCountry, Total, 
	CASE
		WHEN Total > 15 THEN 'Alto'
		WHEN Total > 10 THEN 'Médio'
		WHEN Total > 0 THEN 'Baixo'
		ELSE 'NA'
	END	AS Faixa_Valor 
	FROM Invoice i ;
	
SELECT Country, FROM Customer c ;
