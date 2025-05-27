CREATE DATABASE IF NOT EXISTS `cap05` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE cap05;

CREATE TABLE `cap05`.`TB_CLIENTES` (
  `id_cliente` INT NULL,
  `nome_cliente` VARCHAR(50) NULL,
  `endereco_cliente` VARCHAR(50) NULL,
  `cidade_cliente` VARCHAR(50) NULL,
  `estado_cliente` VARCHAR(50) NULL
);


INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (1, "Bob Silva", "Rua 67", "Fortaleza", "CE");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (2, "Ronaldo Azevedo", "Rua 64", "Campinas", "SP");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (3, "John Lenon", "Rua 42", "Rio de Janeiro", "RJ");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (4, "Billy Joel", "Rua 39", "Campos", "RJ");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (5, "Lady Gaga", "Rua 45", "Porto Alegre", "RS");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (6, "Zico Nunes", "Rua 67", "Fortaleza", "CE");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (7, "Maria Aparecida", "Rua 61", "Natal", "RN");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (8, "Elton John", "Rua 22", "Ubatuba", "SP");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (9, "Dario Maravilha", "Rua 14", "Ubatuba", "SP");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (10, "Lebron James", "Rua 29", "Fortaleza", "CE");


CREATE TABLE `cap05`.`TB_PEDIDOS` (
  `id_pedido` INT NULL,
  `id_cliente` INT NULL,
  `id_vendedor` INT NULL,
  `data_pedido` DATETIME NULL,
  `id_entrega` INT NULL,
  `valor_pedido` DECIMAL(10,2) NULL
);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1001, 1, 5, now(), 23, 100.00);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1002, 1, 7, now(), 24, 112.00);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1003, 2, 5, now(), 23, 250.00);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1004, 3, 5, now(), 23, 340.00);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1005, 4, 7, now(), 24, 1290.00);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1006, 9, 5, now(), 23, 89.00);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1007, 5, 5, now(), 23, 468.50);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1008, 1, 7, now(), 24, 572.20);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1009, 8, 5, now(), 23, 187.45);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1010, 7, 7, now(), 24, 579.20);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1011, 10, 5, now(), 23, 192.45);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1012, 8, 5, now(), 23, 140.45);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1013, 5, 7, now(), 28, 573.20);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1014, 6, 5, now(), 27, 191.45);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1015, 6, 4, now(), 22, 154.37);


CREATE TABLE `cap05`.`TB_VENDEDOR` (
  `id_vendedor` INT NULL,
  `nome_vendedor` VARCHAR(50) NULL,
  `dept_vendedor` VARCHAR(50) NULL
);

INSERT INTO `cap05`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (1, "Vendedor 1", "Eletronicos");

INSERT INTO `cap05`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (2, "Vendedor 2", "Vestuario");

INSERT INTO `cap05`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (3, "Vendedor 3", "Eletronicos");

INSERT INTO `cap05`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (4, "Vendedor 4", "Moveis");

INSERT INTO `cap05`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (5, "Vendedor 5", "Eletrodomesticos");

INSERT INTO `cap05`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (6, "Vendedor 6", "Eletrodomesticos");

INSERT INTO `cap05`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`, `dept_vendedor`)
VALUES (7, "Vendedor 7", "Eletronicos");

# Lista os clientes
SELECT * FROM cap05.TB_CLIENTES;

# Contagem de clientes por cidade (query incorreta)
SELECT COUNT(id_cliente), cidade_cliente 
FROM cap05.TB_CLIENTES;

# Contagem de clientes por cidade (query correta)
SELECT COUNT(id_cliente), cidade_cliente 
FROM cap05.TB_CLIENTES
GROUP BY cidade_cliente;

# Contagem de clientes por cidade ordenado pela contagem
SELECT COUNT(id_cliente) AS contagem, cidade_cliente 
FROM cap05.TB_CLIENTES
GROUP BY cidade_cliente
ORDER BY contagem DESC;

# Contagem de clientes por cidade ordenado pela contagem
SELECT COUNT(id_cliente) AS contagem, cidade_cliente 
FROM cap05.TB_CLIENTES
GROUP BY cidade_cliente
ORDER BY contagem DESC;

# Lista os pedidos
SELECT * FROM cap05.TB_PEDIDOS;

# Média do valor dos pedidos
SELECT AVG(valor_pedido) AS media FROM cap05.TB_PEDIDOS;

# Média do valor dos pedidos por cidade
SELECT AVG(valor_pedido) AS media, cidade_cliente 
FROM cap05.TB_PEDIDOS P, cap05.TB_CLIENTES C
WHERE P.id_cliente = C.id_cliente
GROUP BY cidade_cliente;

# Média do valor dos pedidos por cidade arredondando a média
SELECT ROUND(AVG(valor_pedido), 2) AS media, cidade_cliente 
FROM cap05.TB_PEDIDOS P, cap05.TB_CLIENTES C
WHERE P.id_cliente = C.id_cliente
GROUP BY cidade_cliente;

# Média do valor dos pedidos por cidade
SELECT ROUND(AVG(valor_pedido), 2) AS media, cidade_cliente 
FROM cap05.TB_PEDIDOS P, cap05.TB_CLIENTES C
WHERE P.id_cliente = C.id_cliente
GROUP BY cidade_cliente
ORDER BY media DESC;

# Média do valor dos pedidos por cidade com INNER JOIN
SELECT ROUND(AVG(valor_pedido), 2) AS media, cidade_cliente 
FROM cap05.TB_PEDIDOS P 
INNER JOIN cap05.TB_CLIENTES C
ON P.id_cliente = C.id_cliente
GROUP BY cidade_cliente
ORDER BY media DESC;

# Insere um novo registro na tabela de clientes
INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (11, "Michael Jordan", "Rua 21", "Palmas", "TO");

# Média do valor dos pedidos por cidade com INNER JOIN
SELECT ROUND(AVG(valor_pedido), 2) AS media, cidade_cliente 
FROM cap05.TB_PEDIDOS P 
INNER JOIN cap05.TB_CLIENTES C
ON P.id_cliente = C.id_cliente
GROUP BY cidade_cliente
ORDER BY media DESC;

# Média do valor dos pedidos por cidade com RIGHT JOIN
SELECT ROUND(AVG(valor_pedido), 2) AS media, cidade_cliente 
FROM cap05.TB_PEDIDOS P 
RIGHT JOIN cap05.TB_CLIENTES C
ON P.id_cliente = C.id_cliente
GROUP BY cidade_cliente
ORDER BY media DESC;

# Média do valor dos pedidos por cidade com RIGHT JOIN e CASE
SELECT 
	CASE 
		WHEN ROUND(AVG(valor_pedido), 2) IS NULL THEN 0
		ELSE ROUND(AVG(valor_pedido), 2)
	END AS media,
	cidade_cliente
FROM cap05.TB_PEDIDOS P 
RIGHT JOIN cap05.TB_CLIENTES C
ON P.id_cliente = C.id_cliente
GROUP BY cidade_cliente
ORDER BY media DESC;

# Lista os pedidos
SELECT * FROM cap05.TB_PEDIDOS;

# Soma (total) do valor dos pedidos
SELECT SUM(valor_pedido) AS total FROM cap05.TB_PEDIDOS;

# Soma (total) do valor dos pedidos por cidade
SELECT SUM(valor_pedido) AS total, cidade_cliente 
FROM cap05.TB_PEDIDOS AS P, cap05.TB_CLIENTES AS C
WHERE P.id_cliente = C.id_cliente
GROUP BY cidade_cliente;

# Insere mais 2 clientes
INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (12, "Bill Gates", "Rua 14", "Santos", "SP");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (13, "Jeff Bezos", "Rua 29", "Osasco", "SP");

# Insere mais 3 pedidos
INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1016, 11, 5, now(), 27, 234.09);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1017, 12, 4, now(), 22, 678.30);

INSERT INTO `cap05`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`, `valor_pedido`)
VALUES (1018, 13, 4, now(), 22, 978.30);

# Soma (total) do valor dos pedidos por cidade
SELECT SUM(valor_pedido) AS total, cidade_cliente
FROM cap05.TB_PEDIDOS P, cap05.TB_CLIENTES C
WHERE P.id_cliente = C.id_cliente
GROUP BY cidade_cliente;

# Soma (total) do valor dos pedidos por estado
SELECT SUM(valor_pedido) AS total, estado_cliente
FROM cap05.TB_PEDIDOS P, cap05.TB_CLIENTES C
WHERE P.id_cliente = C.id_cliente
GROUP BY estado_cliente;

# Soma (total) do valor dos pedidos por cidade e estado (query incorreta)
SELECT SUM(valor_pedido) AS total, cidade_cliente, estado_cliente
FROM cap05.TB_PEDIDOS P, cap05.TB_CLIENTES C
WHERE P.id_cliente = C.id_cliente
GROUP BY estado_cliente;

# Soma (total) do valor dos pedidos por cidade e estado (query correta)
SELECT SUM(valor_pedido) AS total, cidade_cliente, estado_cliente 
FROM cap05.TB_PEDIDOS AS P, cap05.TB_CLIENTES AS C
WHERE P.id_cliente = C.id_cliente
GROUP BY cidade_cliente, estado_cliente
ORDER BY estado_cliente;

# Soma (total) do valor dos pedidos por cidade e estado (query correta)


# Insere mais 2 clientes
INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (14, "Melinda Gates", "Rua 14", "Barueri", "SP");

INSERT INTO `cap05`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (15, "Barack Obama", "Rua 29", "Barueri", "SP");

# Soma(total) do valor dos pedidos por cidade e estado com RIGHT JOIN e CASE
SELECT 
	CASE 
		WHEN FLOOR(SUM(valor_pedido)) IS NULL THEN 0
		ELSE FLOOR(SUM(valor_pedido))
	END AS total,
	cidade_cliente, estado_cliente
FROM cap05.TB_PEDIDOS AS P 
RIGHT JOIN cap05.TB_CLIENTES AS C
ON P.id_cliente = C.id_cliente
GROUP BY cidade_cliente, estado_cliente
ORDER BY total DESC;

# Supondo que a comissão de cada vendedor seja de 10%, quanto cada vendedor ganhou de comissão nas vendas no estado do Ceará?
# Retorne 0 se não houve ganho de comissão

# Soma (total) do valor dos pedidos por cidade e estado (query correta)
SELECT SUM(valor_pedido * 0.10) AS comissao, nome_vendedor, estado_cliente
FROM cap05.TB_PEDIDOS P, cap05.TB_CLIENTES C, cap05.TB_VENDEDOR V
WHERE P.id_cliente = C.id_cliente
AND P.id_vendedor = V.id_vendedor
AND estado_cliente = 'CE'
GROUP BY nome_vendedor, estado_cliente
ORDER BY estado_cliente;

SELECT SUM(valor_pedido * 0.10) AS comissao, nome_vendedor, estado_cliente
FROM cap05.TB_PEDIDOS P INNER JOIN cap05.TB_CLIENTES C RIGHT JOIN cap05.TB_VENDEDOR V
ON P.id_cliente = C.id_cliente
AND P.id_vendedor = V.id_vendedor
AND estado_cliente = 'CE'
GROUP BY nome_vendedor, estado_cliente
ORDER BY estado_cliente;


# Soma (total) do valor dos pedidos por cidade e estado (query correta)
SELECT 
	CASE
		WHEN ROUND(SUM(valor_pedido * 0.10)) IS NULL THEN 0
		ELSE ROUND(SUM(valor_pedido * 0.10))
	END AS comissao,
    nome_vendedor,
	CASE
		WHEN estado_cliente IS NULL THEN 'Não Atua no CE'
		ELSE estado_cliente
	END AS estado_cliente
FROM cap05.TB_PEDIDOS P INNER JOIN cap05.TB_CLIENTES C RIGHT JOIN cap05.TB_VENDEDOR V
ON P.id_cliente = C.id_cliente
AND P.id_vendedor = V.id_vendedor
AND estado_cliente = 'CE'
GROUP BY nome_vendedor, estado_cliente
ORDER BY estado_cliente;

# Maior valor 
SELECT MAX(valor_pedido) AS maximo
FROM cap05.TB_PEDIDOS;

# Menor valor 
SELECT MIN(valor_pedido) AS minimo
FROM cap05.TB_PEDIDOS;

# Número de pedidos
SELECT COUNT(*) FROM cap05.TB_PEDIDOS;

# Número de clientes que fizeram pedidos (será?)
SELECT COUNT(id_cliente) FROM cap05.TB_PEDIDOS;

# Lista pedidos
SELECT * FROM cap05.TB_PEDIDOS ORDER BY id_cliente;

# Número de clientes que fizeram pedidos
SELECT COUNT(DISTINCT id_cliente) FROM cap05.TB_PEDIDOS;

# Número de pedidos de clientes do CE]
SELECT COUNT(C.id_cliente) AS total_cliente
FROM cap05.TB_PEDIDOS AS P, cap05.TB_CLIENTES AS C 
WHERE P.id_cliente = C.id_cliente
AND estado_cliente = 'CE';

# Número de clientes únicos do CE que fizeram pedidos com o nome de cada cliente (query incorreta)

# Número de clientes únicos do CE que fizeram pedidos com o nome de cada cliente
SELECT nome_cliente, cidade_cliente, COUNT(DISTINCT C.id_cliente) AS clientes_unicos
FROM cap05.TB_PEDIDOS AS P, cap05.TB_CLIENTES AS C 
WHERE P.id_cliente = C.id_cliente
AND estado_cliente = 'CE'
GROUP BY nome_cliente, cidade_cliente;

# Nome e cidade do cliente e número de pedidos
SELECT nome_cliente, cidade_cliente, COUNT(id_pedido) AS num_pedidos
FROM cap05.TB_PEDIDOS AS P, cap05.TB_CLIENTES AS C 
WHERE P.id_cliente = C.id_cliente
AND estado_cliente = 'CE'
GROUP BY nome_cliente, cidade_cliente;

# Algum vendedor participou de vendas cujo valor pedido tenha sido superior a 600 no estado de SP?
SELECT C.nome_cliente, V.nome_vendedor, P.valor_pedido, C.estado_cliente
FROM cap05.TB_PEDIDOS AS P, cap05.TB_CLIENTES AS C, cap05.TB_VENDEDOR AS V  
WHERE P.id_cliente = C.id_cliente
AND P.id_vendedor = V.id_vendedor
AND C.estado_cliente = 'SP'
AND P.valor_pedido > 600;


SELECT C.nome_cliente, V.nome_vendedor, P.valor_pedido, C.estado_cliente
FROM cap05.TB_PEDIDOS AS P
INNER JOIN cap05.TB_CLIENTES AS C
INNER JOINT cap05.TB_VENDEDOR AS V  
ON P.id_cliente = C.id_cliente
AND P.id_vendedor = V.id_vendedor
AND C.estado_cliente = 'SP'
AND P.valor_pedido > 600;

# Algum vendedor participou de vendas em que a média do valor_pedido por estado do cliente foi superior a 800?
SELECT estado_cliente, CEILING(AVG(valor_pedido)) AS media 
FROM cap05.TB_PEDIDOS AS P
INNER JOIN cap05.TB_CLIENTES AS C
ON P.id_cliente = C.id_cliente
GROUP BY estado_cliente;

SELECT estado_cliente, nome_vendedor, CEILING(AVG(valor_pedido)) AS media 
FROM cap05.TB_PEDIDOS AS P
INNER JOIN cap05.TB_CLIENTES AS C
INNER JOIN cap05.TB_VENDEDOR AS V 
ON P.id_cliente = C.id_cliente
AND P.id_vendedor = V.id_vendedor
GROUP BY estado_cliente, nome_vendedor
ORDER BY nome_vendedor;

SELECT estado_cliente, nome_vendedor, CEILING(AVG(valor_pedido)) AS media 
FROM cap05.TB_PEDIDOS AS P
INNER JOIN cap05.TB_CLIENTES AS C
INNER JOIN cap05.TB_VENDEDOR AS V 
ON P.id_cliente = C.id_cliente
AND P.id_vendedor = V.id_vendedor
GROUP BY estado_cliente, nome_vendedor
HAVING media > 800
ORDER BY nome_vendedor;


# Qual estado teve mais de 5 pedidos?
SELECT estado_cliente, COUNT(id_pedido) AS contagem 
FROM cap05.TB_PEDIDOS AS P
INNER JOIN cap05.TB_CLIENTES AS C
ON P.id_cliente = C.id_cliente
GROUP BY estado_cliente
ORDER BY contagem DESC;

# Qual estado teve mais de 5 pedidos? (Correta)
SELECT estado_cliente, COUNT(id_pedido) AS contagem 
FROM cap05.TB_PEDIDOS AS P
INNER JOIN cap05.TB_CLIENTES AS C
ON P.id_cliente = C.id_cliente
GROUP BY estado_cliente
HAVING contagem > 5
ORDER BY contagem DESC;

# Cria tabela
CREATE TABLE `cap05`.`TB_VENDAS` (
  `ano` INT NULL,
  `pais` VARCHAR(45) NULL,
  `produto` VARCHAR(45) NULL,
  `faturamento` INT NULL);


# Insere registros
INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2021, 'Brasil', 'Geladeira', 1130);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2021, 'Brasil', 'TV', 980);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2021, 'Argentina', 'Geladeira', 2180);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2021, 'Argentina', 'TV', 2240);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2021, 'Portugal', 'Smartphone', 2310);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2021, 'Portugal', 'TV', 1900);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2021, 'Inglaterra', 'Notebook', 1800);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2022, 'Brasil', 'Geladeira', 1400);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2022, 'Brasil', 'TV', 1345);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2022, 'Argentina', 'Geladeira', 2180);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2022, 'Argentina', 'TV', 1390);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2022, 'Portugal', 'Smartphone', 2480);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2022, 'Portugal', 'TV', 1980);

INSERT INTO `cap05`.`TB_VENDAS` (`ano`, `pais`, `produto`, `faturamento`)
VALUE (2022, 'Inglaterra', 'Notebook', 2300);

# Lista os dados
SELECT * FROM cap05.TB_VENDAS;

# Faturamento total por ano
SELECT ano, SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano;

# Faturamento total por ano a total geral
SELECT ano, SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano WITH ROLLUP;

# Faturamento total por ano a total geral filtrando por faturamento
SELECT ano, SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano WITH ROLLUP
HAVING faturamento > 13000;

# Faturamento total por ano a total geral ordernado por ano
SELECT ano, SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano WITH ROLLUP
ORDER BY ano;

# Faturamento total por ano e país
SELECT ano, SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano, pais;

# Faturamento total por ano e país e total geral
SELECT ano, pais, SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano, pais WITH ROLLUP;

# Faturamento total por ano e produto a total geral
SELECT ano, produto, SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano, produto WITH ROLLUP;

# Faturamento total por ano e produto a total geral, ordenado pelo agrupamento de produto
SELECT ano, produto, SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano, produto WITH ROLLUP
ORDER BY GROUPING(produto) DESC;

# Por que não podemos usar o CASE na query acima?
# Faturamento total por ano e país e total geral com agrupamento do resultado
SELECT 
	IF(GROUPING(ano), 'Total de Todos os Anos', ano) AS ano,
	IF(GROUPING(pais), 'Total de Todos os Países', pais) AS pais,
	IF(GROUPING(produto), 'Total de Todos os Produtos', produto) AS produto,
	SUM(faturamento) AS faturamento
FROM cap05.TB_VENDAS
GROUP BY ano, pais, produto WITH ROLLUP;



# ROLLUP e CUBE tem o mesmo propósito, gerar grouping sets (conjuntos de grupos de dados). 
# ROLLUP faz isso através da hierarquia dos dados.
# CUBE gera todas as combinações possíveis.
# CUBE não é suportado no MySQL. Aqui há um bom material de referência:
https://www.sqltutorial.org/sql-cube/