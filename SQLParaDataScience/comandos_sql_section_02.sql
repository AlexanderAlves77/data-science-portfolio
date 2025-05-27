CREATE DATABASE IF NOT EXISTS `cap02` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE cap02;

CREATE TABLE `cap02`.`TB_NAVIOS` (
  `nome_navio` VARCHAR(50) NULL,
  `mes_ano` VARCHAR(10) NULL,
  `classificacao_risco` VARCHAR(15) NULL,
  `indice_conformidade` VARCHAR(15) NULL,
  `pontuacao_risco` INT NULL,
  `temporada` VARCHAR(200) NULL
);

SELECT * FROM cap02.TB_NAVIOS;

SELECT DISTINCT classificacao_risco FROM cap02.TB_NAVIOS;

SELECT * FROM cap02.TB_NAVIOS WHERE classificacao_risco = 'D';

SELECT nome_navio, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'D';

SELECT nome_navio, classificacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'D'
ORDER BY nome_navio;

SELECT nome_navio, classificacao_risco, pontuacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'D' AND pontuacao_risco > 1000
ORDER BY nome_navio;

SELECT nome_navio, classificacao_risco, pontuacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'D' OR pontuacao_risco > 3000
ORDER BY nome_navio;

SELECT nome_navio, classificacao_risco, indice_conformidade, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco 'A'
ORDER BY nome_navio;

SELECT nome_navio, classificacao_risco, indice_conformidade, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco IN ('A', 'B') AND indice_conformidade > 90
ORDER BY nome_navio;

SELECT nome_navio, classificacao_risco, indice_conformidade, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco IN ('A', 'B') AND indice_conformidade > 90
ORDER BY indice_conformidade
LIMIT 10;

SELECT nome_navio, classificacao_risco, indice_conformidade, temporada 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco IN ('A', 'B') AND indice_conformidade > 90
ORDER BY indice_conformidade, nome_navio
LIMIT 10;


# Em Abril de 2018 alguma embarcação teve índice de conformidade de 100% e pontuação de risco igual a 0?
SELECT nome_navio, classificacao_risco, indice_conformidade, pontuacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE indice_conformidade > 90 AND pontuacao_risco = 0 AND mes_ano = '04/2018'
ORDER BY indice_conformidade;

# Em Abril de 2018 alguma embarcação teve índice de conformidade de 100% e pontuação de risco igual a 0?
SELECT nome_navio, classificacao_risco, indice_conformidade, pontuacao_risco, temporada 
FROM cap02.TB_NAVIOS 
WHERE indice_conformidade IN (SELECT indice_conformidade					
					FROM cap02.TB_NAVIOS
					WHERE indice_conformidade > 90) 
					AND pontuacao_risco = 0 
					AND mes_ano = '04/2018'
ORDER BY indice_conformidade;


# Solução Exercício 1
# Item 1: Quais embarcações possuem pontuação de risco igual a 310?
SELECT * FROM cap02.TB_NAVIOS WHERE pontuacao_risco = 310;

# Item 2: Quais embarcações têm classificação de risco A e índice de conformidade maior ou igual a 95%?
SELECT * FROM cap02.TB_NAVIOS WHERE classificacao_risco = 'A' AND indice_conformidade >= 95;

# Item 3: Quais embarcações têm classificação de risco C ou D e índice de conformidade menor ou igual a 95%?
SELECT * 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'C' 
OR classificacao_risco = 'D' 
AND indice_conformidade <= 95;

# Item 4: Quais embarcações têm classificação de risco A ou pontuação de risco igual a 0?
SELECT * 
FROM cap02.TB_NAVIOS 
WHERE classificacao_risco = 'A' 
OR pontuacao_risco = 0;

# Item 5: [DESAFIO] Quais embarcações foram inspecionadas em Dezembro de 2016?
SELECT * 
FROM cap02.TB_NAVIOS 
WHERE temporada LIKE '%Dezembro 2016';