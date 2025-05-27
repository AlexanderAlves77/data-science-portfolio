CREATE DATABASE IF NOT EXISTS `cap06` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE cap06;

# Cria a tabela
CREATE TABLE cap06.TB_BIKES (
  `duracao_segundos` int DEFAULT NULL,
  `data_inicio` text,
  `data_fim` text,
  `numero_estacao_inicio` int DEFAULT NULL,
  `estacao_inicio` text,
  `numero_estacao_fim` int DEFAULT NULL,
  `estacao_fim` text,
  `numero_bike` text,
  `tipo_membro` text
 );
 
 # Carga de dados via linha de comando
# Conecte no MySQL via linha de comando
/usr/local/mysql/bin/mysql --local-infile=1 -u root -p

# Execute:
SET GLOBAL local_infile = true;


# Carrega os dados
LOAD DATA LOCAL INFILE 'D:/01_AECA/Formacao_Analista_Dados/01-SQLParaDataScience/06-WindowsFunctionsSubqueries/2012Q1-capitalbikeshare-tripdata.csv' INTO TABLE `cap06`.`TB_BIKES` CHARACTER SET UTF8 FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n' IGNORE 1 LINES;

CREATE TABLE cap06.TB_VENDAS (
    nome_funcionario VARCHAR(50) NOT NULL,
    ano_fiscal INT NOT NULL,
    valor_venda DECIMAL(14,2) NOT NULL,
    PRIMARY KEY(nome_funcionario,ano_fiscal)
);

INSERT INTO cap06.TB_VENDAS(nome_funcionario, ano_fiscal, valor_venda)
VALUES('Romario',2020,2000),
      ('Romario',2021,2500),
      ('Romario',2022,3000),
      ('Zico',2020,1500),
      ('Zico',2021,1000),
      ('Zico',2022,2000),
	  ('Pele',2020,2000),
      ('Pele',2021,1500),
      ('Pele',2022,2500);
	  
# Total de vendas
SELECT SUM(valor_venda) FROM cap06.TB_VENDAS;

# Total de vendas por ano fiscal
SELECT ano_fiscal, SUM(valor_venda) 
FROM cap06.TB_VENDAS
GROUP BY ano_fiscal
ORDER BY ano_fiscal;

# Total de vendas por funcionário
SELECT nome_funcionario, SUM(valor_venda) 
FROM cap06.TB_VENDAS
GROUP BY nome_funcionario
ORDER BY nome_funcionario;

# Total de vendas por funcionário, por ano
SELECT nome_funcionario, ano_fiscal, SUM(valor_venda) AS total_venda
FROM cap06.TB_VENDAS
GROUP BY nome_funcionario, ano_fiscal
ORDER BY ano_fiscal;

# Total de vendas por ano, por funcionário e total de vendas do ano
SELECT ano_fiscal, nome_funcionario, valor_venda, 
	SUM(valor_venda) OVER (PARTITION BY ano_fiscal) AS total_vendas_ano
FROM cap06.TB_VENDAS
ORDER BY ano_fiscal;

# Essa query não faria muito sentido
SELECT 
    ano_fiscal, 
    nome_funcionario,
    valor_venda,
    SUM(valor_venda) total_vendas,
    SUM(valor_venda) OVER (PARTITION BY ano_fiscal) total_vendas_ano
FROM cap06.TB_VENDAS
GROUP BY ano_fiscal, nome_funcionario, valor_venda
ORDER BY ano_fiscal;

# Total de vendas por ano, por funcionário e total de vendas do funcionário
SELECT ano_fiscal, nome_funcionario, valor_venda, 
	SUM(valor_venda) OVER (PARTITION BY nome_funcionario) AS total_vendas_func
FROM cap06.TB_VENDAS
ORDER BY ano_fiscal;

# Total de vendas por ano, por funcionário e total de vendas do ano
SELECT ano_fiscal, nome_funcionario, valor_venda, 
	SUM(valor_venda) OVER (PARTITION BY ano_fiscal) AS total_vendas_ano
FROM cap06.TB_VENDAS
ORDER BY ano_fiscal;

# Total de vendas por ano, por funcionário e total de vendas geral
SELECT ano_fiscal, nome_funcionario, valor_venda, 
	SUM(valor_venda) OVER () AS total_vendas_ano
FROM cap06.TB_VENDAS
ORDER BY ano_fiscal;

# Número de vendas por ano, por funcionário e número total de vendas em todos os anos
SELECT 
	ano_fiscal, 
	nome_funcionario, 
	COUNT(*) num_vendas_ano, 
	COUNT(*) OVER () AS num_vendas_geral
FROM cap06.TB_VENDAS
GROUP BY ano_fiscal, nome_funcionario
ORDER BY ano_fiscal;

# Reescrevendo a query anterior usando subquery
SELECT 
    ano_fiscal, 
    nome_funcionario,
    COUNT(*) num_vendas_ano,
	(SELECT COUNT(*) FROM cap06.TB_VENDAS) as num_vendas_geral
FROM cap06.TB_VENDAS
GROUP BY ano_fiscal, nome_funcionario
ORDER BY ano_fiscal;

# Duração total do aluguel das bikes (em horas)
SELECT SUM(duracao_segundos/60/60) AS duracao_total_horas
FROM cap06.TB_BIKES;

# Duração total do aluguel das bikes (em horas), ao longo do tempo (soma acumulada)
SELECT duracao_segundos,
	SUM(duracao_segundos/60/60) OVER(ORDER BY data_inicio) AS duracao_total_horas
FROM cap06.TB_BIKES;

# Duração total do aluguel das bikes (em horas), ao longo do tempo, por estação de início do aluguel da bike,
# quando a data de início foi inferior a '2012-01-08'
SELECT estacao_inicio, duracao_segundos,
	SUM(duracao_segundos/60/60) OVER(PARTITION BY estacao_inicio ORDER BY data_inicio) AS duracao_total_horas
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';

# Mesma query anterior sem ORDER BY no Partition
SELECT estacao_inicio, duracao_segundos,
	SUM(duracao_segundos/60/60) OVER(PARTITION BY estacao_inicio) AS duracao_total_horas
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';


# Estatísticas
# Qual a média de tempo (em horas) de aluguel de bike da estação de início 31017?
SELECT estacao_inicio,
	AVG(duracao_segundos/60/60) AS duracao_total_horas
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31017
GROUP BY estacao_inicio;

# Qual a média de tempo (em horas) de aluguel da estação de início 31017, ao longo do tempo (média móvel)?
SELECT estacao_inicio,
	AVG(duracao_segundos/60/60) OVER(PARTITION BY estacao_inicio ORDER BY data_inicio) AS duracao_total_horas
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31017;

# Retornar:
# Estação de início, data de início e duração de cada aluguel de bike em segundos
# Duração total de aluguel das bikes ao longo do tempo por estação de início
# Duração média do aluguel de bikes ao longo do tempo por estação de início
# Número de aluguéis de bikes por estação ao longo do tempo 
# Somente os registros quando a data de início for inferior a '2012-01-08'
# Esta query calcula estatísticas, mas não ao longo do tempo!

SELECT estacao_inicio, data_inicio, duracao_segundos,
	SUM(duracao_segundos/60/60) AS duracao_total_horas,
	AVG(duracao_segundos/60/60) AS media_tempo_aluguel,
	COUNT(duracao_segundos/60/60) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
GROUP BY estacao_inicio, data_inicio, duracao_segundos;


# Esta query calcula estatísticas, ao longo do tempo!
SELECT estacao_inicio, data_inicio, duracao_segundos,
	SUM(duracao_segundos/60/60) OVER(PARTITION BY estacao_inicio ORDER BY data_inicio) AS duracao_total_horas,
	AVG(duracao_segundos/60/60) OVER(PARTITION BY estacao_inicio ORDER BY data_inicio) AS media_tempo_aluguel,
	COUNT(duracao_segundos/60/60) OVER(PARTITION BY estacao_inicio ORDER BY data_inicio) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';


# Retornar:
# Estação de início, data de início de cada aluguel de bike e duração de cada aluguel em segundos
# Número de aluguéis de bikes (independente da estação) ao longo do tempo 
# Somente os registros quando a data de início for inferior a '2012-01-08'
# Solução 1
SELECT estacao_inicio, data_inicio, duracao_segundos,	
	COUNT(duracao_segundos/60/60) OVER(ORDER BY data_inicio) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';


# Solução 2
SELECT estacao_inicio, data_inicio, duracao_segundos,	
	ROW_NUMBER() OVER(ORDER BY data_inicio) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';


# E se quisermos o mesmo resultado anterior, mas a contagem por estação?
SELECT estacao_inicio, data_inicio, duracao_segundos,
	ROW_NUMBER() OVER(PARTITION BY estacao_inicio ORDER BY data_inicio) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';


# Classificação do Campeonato Brasileiro:
# Flamengo - 35 pontos
# Palmeiras - 35 pontos
# Santos - 32 pontos
# Internacional - 30 pontos
# Fluminense - 30 pontos
# Fortaleza - 29 pontos

# ROW_NUMBER():
# 1- Flamengo - 35 pontos
# 2- Palmeiras - 35 pontos
# 3- Santos - 32 pontos
# 4- Internacional - 30 pontos
# 5- Fluminense - 30 pontos
# 6- Fortaleza - 29 pontos

# DENSE_RANK():
# 1- Flamengo - 35 pontos
# 1- Palmeiras - 35 pontos
# 2- Santos - 32 pontos
# 3- Internacional - 30 pontos
# 3- Fluminense - 30 pontos
# 4- Fortaleza - 29 pontos

# RANK():
# 1- Flamengo - 35 pontos
# 1- Palmeiras - 35 pontos
# 3- Santos - 32 pontos
# 4- Internacional - 30 pontos
# 4- Fluminense - 30 pontos
# 6- Fortaleza - 29 pontos

# Estação, data de início, duração em segundos do aluguel e número de aluguéis ao longo do tempo
SELECT estacao_inicio, data_inicio, duracao_segundos,
	ROW_NUMBER() OVER(PARTITION BY estacao_inicio ORDER BY data_inicio) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';

# Estação, data de início, duração em segundos do aluguel e número de aluguéis ao longo do tempo
# para a estação de id 31000
SELECT estacao_inicio, data_inicio, duracao_segundos,
	ROW_NUMBER() OVER(PARTITION BY estacao_inicio ORDER BY data_inicio) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
AND numero_estacao_inicio = 31000;

# Estação, data de início, duração em segundos do aluguel e número de aluguéis ao longo do tempo
# para a estação de id 31000, com a coluna de data_inicio convertida para o formato date
SELECT estacao_inicio, 
	CAST(data_inicio as date) AS data_inicio, 
	duracao_segundos,
	ROW_NUMBER() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
AND numero_estacao_inicio = 31000;

# Estação, data de início, duração em segundos do aluguel e número de aluguéis ao longo do tempo
# para a estação de id 31000, com a coluna de data_inicio convertida para o formato date
# Queremos a ordem (classificação ou ranking) dos dias de aluguel ao longo do tempo
# DENSE_RANK() concede todas as linhas idênticas a mesma classificação (ranking) e salta para o próximo item no ranking
SELECT estacao_inicio, 
	CAST(data_inicio as date) AS data_inicio, 
	duracao_segundos,
	DENSE_RANK() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
AND numero_estacao_inicio = 31000;

# Estação, data de início, duração em segundos do aluguel e número de aluguéis ao longo do tempo
# para a estação de id 31000, com a coluna de data_inicio convertida para o formato date
# Queremos a ordem (classificação ou ranking) dos dias de aluguel ao longo do tempo
# RANK() concede todas as linhas idênticas a mesma classificação (ranking) e salta para o próximo item no ranking
SELECT estacao_inicio, 
	CAST(data_inicio as date) AS data_inicio, 
	duracao_segundos,
	RANK() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
AND numero_estacao_inicio = 31000;

# Comparando as funções
SELECT estacao_inicio, 
	CAST(data_inicio as date) AS data_inicio, 
	duracao_segundos,
	ROW_NUMBER() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_alugueis,
	DENSE_RANK() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_alugueis,
	RANK() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_alugueis
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
AND numero_estacao_inicio = 31000;


# NTILE
# A função NTILE() é uma função de janela (window) que distribui linhas de uma partição ordenada em um número predefinido 
# de grupos aproximadamente iguais. A função atribui a cada grupo um número a partir de 1. 

SELECT estacao_inicio, 
	duracao_segundos,
	ROW_NUMBER() OVER(PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_alugueis,
	NTILE(2) OVER(PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_dois,
	NTILE(4) OVER(PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_quatro,
	NTILE(5) OVER(PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_cinco
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
AND numero_estacao_inicio = 31000;


# NTILE
SELECT estacao_inicio, 
	CAST(data_inicio as date) AS data_inicio, 
	duracao_segundos,
	ROW_NUMBER() OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_alugueis,
	NTILE(2) OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_grupo_dois,
	NTILE(4) OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_grupo_quatro,
	NTILE(16) OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_grupo_cinco
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
AND numero_estacao_inicio = 31000;

# LAG e LEAD
SELECT estacao_inicio, 
	CAST(data_inicio as date) AS data_inicio, 
	duracao_segundos,
	LAG(duracao_segundos, 1) OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS registro_lag,
	LEAD(duracao_segundos, 1) OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS registro_lead
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
AND numero_estacao_inicio = 31000;

# LAG com Subquery
SELECT *
  FROM (
    SELECT estacao_inicio,
        CAST(data_inicio as date) AS data_inicio,
        duracao_segundos,
        duracao_segundos - LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS diferenca
    FROM cap06.TB_BIKES
    WHERE data_inicio < '2012-01-08'
    AND numero_estacao_inicio = 31000) resultado
 WHERE resultado.diferenca IS NOT NULL;

# Window Alias
# NTILE
SELECT estacao_inicio,
       CAST(data_inicio as date) AS data_inicio,
       duracao_segundos,
       NTILE(2) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_grupo_dois,
       NTILE(4) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_grupo_quatro,
       NTILE(5) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS numero_grupo_cinco
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08';

# Criamos um alias para a janela e particionamos novamente a janela
SELECT estacao_inicio, 
	CAST(data_inicio as date) AS data_inicio,
	duracao_segundos,
	NTILE(2) OVER(PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_dois,
	NTILE(4) OVER(PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_quatro,
	NTILE(5) OVER(PARTITION BY estacao_inicio ORDER BY duracao_segundos) AS numero_grupo_cinco
FROM cap06.TB_BIKES
WHERE data_inicio < '2012-01-08'
WINDOW ntile_window AS (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date))
ORDER BY estacao_inicio;


# Extraindo itens específicos da data
SELECT data_inicio,
    DATE(data_inicio),
    TIMESTAMP(data_inicio),
    YEAR(data_inicio),
    MONTH(data_inicio),
    DAY(data_inicio)
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;

# Extraindo o mês da data
SELECT EXTRACT(MONTH FROM data_inicio) AS mes, duracao_segundos
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;

# Adicionando 10 dias à data de início
SELECT data_inicio, DATE_ADD(data_inicio, INTERVAL 10 DAY) AS data_inicio, duracao_segundos
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;

# Retornando dados de 10 dias anteriores à data de início do aluguel da bike
SELECT data_inicio, duracao_segundos
FROM cap06.TB_BIKES
WHERE DATE_SUB("2012-03-31", INTERVAL 10 DAY) <= data_inicio
AND numero_estacao_inicio = 31000;

# Diferença entre data_inicio e data_fim
SELECT data_inicio, data_fim, DATEDIFF(data_inicio, data_fim)
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;

# Diferença entre data_inicio e data_fim
SELECT DATE_FORMAT(data_inicio, "%H") AS hora_inicio, 
    DATE_FORMAT(data_fim, "%H") AS hora_fim, 
    DATEDIFF(data_inicio, data_fim)
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;

# Diferença entre data_inicio e data_fim
SELECT DATE_FORMAT(data_inicio, "%H") AS hora_inicio, 
    DATE_FORMAT(data_fim, "%H") AS hora_fim, 
    (DATE_FORMAT(data_fim, "%H") - DATE_FORMAT(data_inicio, "%H")) AS diff
FROM cap06.TB_BIKES
WHERE numero_estacao_inicio = 31000;


# Solução exercício 5
# 1- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro?
SELECT tipo_membro,
	AVG(duracao_segundos) AS media_tempo_aluguel
FROM exec5.TB_BIKES 
GROUP BY tipo_membro;

# 2- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e por estação fim (onde as bikes são entregues após o aluguel)?
SELECT estacao_fim, tipo_membro,
	AVG(duracao_segundos) AS media_tempo_aluguel
FROM exec5.TB_BIKES 
GROUP BY estacao_fim, tipo_membro;

# 3- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e por estação fim (onde as bikes são entregues após o aluguel) ao longo do tempo?
SELECT EXTRACT(HOUR FROM data_inicio) as hora,
	COUNT(duracao_segundos) AS num_alugueis
FROM exec5.TB_BIKES 
WHERE numero_bike = 'W01182'
GROUP BY hora
ORDER BY num_alugueis DESC;

# 4- Qual hora do dia (independente do mês) a bike de número W01182 teve o maior número de aluguéis considerando a data de início?
SELECT estacao_fim, tipo_membro,
	AVG(duracao_segundos) OVER(PARTITION BY tipo_membro ORDER BY data_inicio) AS media_tempo_aluguel
FROM exec5.TB_BIKES;

# 5- Qual o número de aluguéis da bike de número W01182 ao longo do tempo considerando a data de início?
SELECT CAST(data_inicio as date) AS data_inicio,
	AVG(duracao_segundos) OVER(PARTITION BY tipo_membro ORDER BY CAST(data_inicio as date)) AS num_alugueis
FROM exec5.TB_BIKES
WHERE numero_bike = 'W01182'
ORDER BY data_inicio;

# 6- Retornar:
# Estação fim, data fim de cada aluguel de bike e duração de cada aluguel em segundos
# Número de aluguéis de bikes (independente da estação) ao longo do tempo
# Somente os registros quando a data fim foi no mês de Abril
SELECT estacao_fim, data_fim, duracao_segundos,
	COUNT(duracao_segundos) OVER(ORDER BY data_fim) AS num_alugueis
FROM exec5.TB_BIKES
WHERE EXTRACT(MONTH FROM data_fim) = 04;

# 7- Retornar:
# Estação fim, data fim e duração em segundos do aluguel
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos a ordem (classificação ou ranking) dos dias de aluguel ao longo do tempo
# Retornar os dados para os aluguéis entre 7 e 11 da manhã
SELECT estacao_fim, 
	DATE_FORMAT(data_fim, "%d/%M/%Y %H:%i:%S") AS data_fim, 
	duracao_segundos,
	DENSE_RANK() OVER(PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) AS ranking_aluguel
FROM exec5.TB_BIKES
WHERE EXTRACT(HOUR FROM data_fim) BETWEEN 07 AND 11;

# 8- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para
outro, considerando data de início do aluguel e estação de início?
# A data de início deve ser retornada no formato: Sat/Jan/12 00:00:00 (Sat = Dia da semana
abreviado e Jan igual mês abreviado). Retornar os dados para os aluguéis entre 01 e 03 da manhã
SELECT estacao_fim, 
	DATE_FORMAT(data_fim, "%d/%M/%Y %H:%i:%S") AS data_fim, 
	duracao_segundos,
	duracao_segundos - LAG(duracao_segundos, 1) OVER(PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) AS diferenca
FROM exec5.TB_BIKES
WHERE EXTRACT(HOUR FROM data_fim) BETWEEN 01 AND 03;

# 9- Retornar:
# Estação fim, data fim e duração em segundos do aluguel
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos os registros divididos em 4 grupos ao longo do tempo por partição
# Retornar os dados para os aluguéis entre 8 e 10 da manhã
# Qual critério usado pela função NTILE para dividir os grupos?
SELECT estacao_fim, 
	DATE_FORMAT(data_fim, "%d/%M/%Y %H:%i:%S") AS data_fim, 
	duracao_segundos,
	NTILE(4) OVER(PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) AS ranking_aluguel
FROM exec5.TB_BIKES
WHERE EXTRACT(HOUR FROM data_fim) BETWEEN 08 AND 11;

# 10- Quais estações tiveram mais de 35 horas de duração total do aluguel de bike ao longo do
tempo considerando a data fim e estação fim?
# Retorne os dados entre os dias '2012-04-01' e '2012-04-02'
# Dica: Use função window e subquery
SELECT * FROM
	(SELECT estacao_fim, 
		CAST(data_fim as date) AS data_fim,
		SUM(duracao_segundos/60/60) OVER (PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) AS tempo_total_horas
	FROM exec5.TB_BIKES
	WHERE data_fim BETWEEN '2012-04-01' AND '2012-04-02') AS resultado
WHERE resultado.tempo_total_horas > 35
ORDER BY resultado.estacao_fim;



normalizar = (value - min) / (max - min)



