CREATE DATABASE IF NOT EXISTS `cap04` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE cap04;

CREATE TABLE `cap04`.`TB_CLIENTES` (
  `id_cliente` INT NULL,
  `nome_cliente` VARCHAR(50) NULL,
  `endereco_cliente` VARCHAR(50) NULL,
  `cidade_cliente` VARCHAR(50) NULL,
  `estado_cliente` VARCHAR(50) NULL
);

INSERT INTO `cap04`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (1, "Bob Silva", "Rua 67", "Fortaleza", "CE");

INSERT INTO `cap04`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (2, "Ronaldo Azevedo", "Rua 64", "Campinas", "SP");

INSERT INTO `cap04`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (3, "John Lenon", "Rua 42", "Rio de Janeiro", "RJ");

INSERT INTO `cap04`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (4, "Billy Joel", "Rua 39", "Campos", "RJ");

INSERT INTO `cap04`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (5, "Lady Gaga", "Rua 45", "Porto Alegre", "RS");


CREATE TABLE `cap04`.`TB_PEDIDOS` (
  `id_pedido` INT NULL,
  `id_cliente` INT NULL,
  `id_vendedor` INT NULL,
  `data_pedido` DATETIME NULL,
  `id_entrega` INT NULL
);

INSERT INTO `cap04`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`)
VALUES (1001, 1, 5, now(), 23);

INSERT INTO `cap04`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`)
VALUES (1002, 1, 7, now(), 24);

INSERT INTO `cap04`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`)
VALUES (1003, 2, 5, now(), 23);


CREATE TABLE `cap04`.`TB_VENDEDOR` (
  `id_vendedor` INT NULL,
  `nome_vendedor` VARCHAR(50) NULL
);

INSERT INTO `cap04`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`)
VALUES (1, "Vendedor 1");

INSERT INTO `cap04`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`)
VALUES (2, "Vendedor 2");

INSERT INTO `cap04`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`)
VALUES (3, "Vendedor 3");

INSERT INTO `cap04`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`)
VALUES (4, "Vendedor 4");

INSERT INTO `cap04`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`)
VALUES (5, "Vendedor 5");

INSERT INTO `cap04`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`)
VALUES (6, "Vendedor 6");

INSERT INTO `cap04`.`TB_VENDEDOR` (`id_vendedor`, `nome_vendedor`)
VALUES (7, "Vendedor 7");


SELECT * FROM cap04.TB_CLIENTES;
SELECT * FROM cap04.TB_PEDIDOS;
SELECT * FROM cap04.TB_VENDEDOR;

SELECT P.id_pedido, C.nome_cliente 
FROM cap04.TB_PEDIDOS AS P
INNER JOIN cap04.TB_CLIENTES AS C 
ON P.id_cliente = C.id_cliente;

SELECT P.id_pedido, C.nome_cliente 
FROM cap04.TB_PEDIDOS AS P, cap04.TB_CLIENTES AS C 
WHERE P.id_cliente = C.id_cliente;

SELECT P.id_pedido, C.nome_cliente, V.nome_vendedor  
FROM ((cap04.TB_PEDIDOS AS P
INNER JOIN cap04.TB_CLIENTES AS C ON P.id_cliente = C.id_cliente)
INNER JOIN cap04.TB_VENDEDOR AS V ON P.id_vendedor = V.id_vendedor);

SELECT P.id_pedido, C.nome_cliente, V.nome_vendedor 
FROM cap04.TB_PEDIDOS AS P, cap04.TB_CLIENTES AS C, cap04.TB_VENDEDOR AS V 
WHERE P.id_cliente = C.id_cliente
AND P.id_vendedor = V.id_vendedor;

SELECT P.id_pedido, C.nome_cliente 
FROM cap04.TB_PEDIDOS AS P
INNER JOIN cap04.TB_CLIENTES AS C
ON P.id_cliente = C.id_cliente;

SELECT P.id_pedido, C.nome_cliente 
FROM cap04.TB_PEDIDOS AS P
JOIN cap04.TB_CLIENTES AS C
USING (id_cliente);

# Retornar id do produto e nome do cliente
# INNER JOIN
SELECT P.id_pedido, C.nome_cliente 
FROM cap04.TB_PEDIDOS AS P
INNER JOIN cap04.TB_CLIENTES AS C
USING (id_cliente)
WHERE C.nome_cliente LIKE 'Bob%'
ORDER BY P.id_pedido DESC;

# Retornar todos os clientes, com ou sem pedido associado
# LEFT JOIN - Indica que queremos todos os dados da tabela da esquerda mesmo sem correspondente na tabela da direita
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
LEFT JOIN cap04.TB_PEDIDOS AS P
ON C.id_cliente = P.id_cliente;

# RIGHT JOIN - Indica que queremos todos os dados da tabela da esquerda mesmo sem correspondente na tabela da direita
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_PEDIDOS AS P
RIGHT JOIN cap04.TB_CLIENTES AS C
ON C.id_cliente = P.id_cliente;

# Retornar a data do pedido, o nome do cliente, todos os vendedores, com ou sem pedido associado, e ordenar o resultado pelo nome do cliente.
SELECT P.data_pedido, C.nome_cliente, V.nome_vendedor 
FROM ((cap04.TB_PEDIDOS AS P  
JOIN cap04.TB_CLIENTES AS C ON P.id_cliente = C.id_cliente)
RIGHT JOIN cap04.TB_VENDEDOR AS V ON P.id_vendedor = V.id_vendedor)
ORDER BY C.nome_cliente;

SELECT 
	CASE 
		WHEN P.data_pedido IS NULL THEN "Sem Pedido"
		ELSE P.data_pedido
	END as data_pedido,
	CASE 
		WHEN C.nome_cliente IS NULL THEN "Sem Pedido"
		ELSE C.nome_cliente
	END as nome_cliente,
	V.nome_vendedor 
FROM ((cap04.TB_PEDIDOS AS P  
JOIN cap04.TB_CLIENTES AS C ON P.id_cliente = C.id_cliente)
RIGHT JOIN cap04.TB_VENDEDOR AS V ON P.id_vendedor = V.id_vendedor)
ORDER BY C.nome_cliente;

# Vamos inserir um registro na tabela de pedidos que será "órfão" e queremos retornar todos os dados de ambas as tabelas mesmo sem correspondência
INSERT INTO `cap04`.`TB_PEDIDOS` (`id_pedido`, `id_cliente`, `id_vendedor`, `data_pedido`, `id_entrega`)
VALUES (1004, 10, 6, now(), 23);

# LEFT JOIN 
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
LEFT JOIN cap04.TB_PEDIDOS AS P
ON C.id_cliente = P.id_cliente;

# RIGHT JOIN 
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
RIGHT JOIN cap04.TB_PEDIDOS AS P
ON C.id_cliente = P.id_cliente;

# FULL OUTER JOIN (alguns SGBDs não implementam essa junção)
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
FULL OUTER JOIN cap04.TB_PEDIDOS AS P
ON C.id_cliente = P.id_cliente;

# Resolvemos o problema com o UNION e UNION ALL
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
LEFT JOIN cap04.TB_PEDIDOS AS P
ON C.id_cliente = P.id_cliente
UNION
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
RIGHT JOIN cap04.TB_PEDIDOS AS P
ON C.id_cliente = P.id_cliente;

SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
LEFT JOIN cap04.TB_PEDIDOS AS P
ON C.id_cliente = P.id_cliente
UNION ALL
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
RIGHT JOIN cap04.TB_PEDIDOS AS P
ON C.id_cliente = P.id_cliente;

# Inserir mais um registro na tabela de clientes
INSERT INTO `cap04`.`TB_CLIENTES` (`id_cliente`, `nome_cliente`, `endereco_cliente`, `cidade_cliente`, `estado_cliente`)
VALUES (6, "Madona", "Rua 45", "Campos", "RJ");


# Retornar clientes que sejam da mesma cidade
# SELF JOIN 
SELECT A.nome_cliente, A.cidade_cliente
FROM cap04.TB_CLIENTES AS A, cap04.TB_CLIENTES AS B
WHERE A.id_cliente <> B.id_cliente
AND A.cidade_cliente = B.cidade_cliente;

# Retornar todos os dados de todas as tabelas
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
CROSS JOIN cap04.TB_PEDIDOS AS P;

# CROSS JOIN
SELECT P.id_pedido, C.nome_cliente
FROM cap04.TB_PEDIDOS AS P, cap04.TB_CLIENTES AS C;

# CROSS JOIN com WHERE tem o mesmo comportamento do INNER JOIN
SELECT C.nome_cliente, P.id_pedido
FROM cap04.TB_CLIENTES AS C
CROSS JOIN cap04.TB_PEDIDOS AS P
WHERE C.id_cliente = P.id_cliente;


# Solução Exercício 3
# Item 1: Quem são os técnicos (coaches) e atletas das equipes de Handball?
SELECT name FROM exec3.TB_COACHES WHERE discipline = 'Handball';
SELECT name FROM exec3.TB_ATLETAS WHERE discipline = 'Handball';

# Item 2: Quem são os técnicos (coaches) dos atletas da Austrália que receberam medalhas de Ouro?
Os dados fornecidos não contém integridade referencial e não é possível fazer um relacionamento confíavel entre as tabelas.
SELECT name, gold
FROM exec3.TB_COACHES A, exec3.TB_MEDALS B
WHERE A.noc = B.noc
AND A.noc = 'Australia'
AND gold > 0
ORDER BY gold DESC;

# Item 3: Quais países tiveram mulheres conquistando medalhas de Ouro?
Os dados fornecidos não contém integridade referencial e não é possível fazer um relacionamento confíavel entre as tabelas.

# Item 4: Quais atletas da Noruega receberam medalhas de Ouro ou Prata?
Os dados fornecidos não contém integridade referencial e não é possível fazer um relacionamento confíavel entre as tabelas.
SELECT A.noc, gold, silver 
FROM exec3.TB_ATLETAS A, exec3.TB_MEDALS B
WHERE A.noc = B.noc
AND A.noc = 'Norway'

# Item 5: Quais atletas Brasileiros não receberam medalhas?
Os dados fornecidos não contém integridade referencial e não é possível fazer um relacionamento confíavel entre as tabelas.