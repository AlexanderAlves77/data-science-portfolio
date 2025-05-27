CREATE DATABASE IF NOT EXISTS `cap03` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE cap03;

CREATE TABLE `cap03`.`TB_DADOS` (
  `classe` VARCHAR(100) NULL,
  `idade` VARCHAR(45) NULL,
  `menopausa` VARCHAR(45) NULL,
  `tamanho_tumor` VARCHAR(45) NULL,
  `inv_nodes` VARCHAR(45) NULL,
  `node_caps` VARCHAR(3) NULL,
  `deg_malig` INT NULL,
  `seio` VARCHAR(5) NULL,
  `quadrante` VARCHAR(10) NULL,
  `irradiando` VARCHAR(3) NULL
);

SELECT * FROM cap03.TB_DADOS;

# Binarização da variável classe (0/1)
SELECT DISTINCT classe FROM cap03.TB_DADOS;

# 0 na classe negativa e 1 na classe positiva
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0
		WHEN classe = 'recurrence-events' THEN 1
	END AS classe 
FROM cap03.TB_DADOS;

# Binarização da variável irradiando (0/1)
SELECT DISTINCT irradiando FROM cap03.TB_DADOS;

# 0 na irradiando negativa e 1 na irradiando positiva
SELECT 
	CASE 
		WHEN irradiando = 'no' THEN 0
		WHEN irradiando = 'yes' THEN 1
	END AS irradiando 
FROM cap03.TB_DADOS;


# Binarização da variável node_caps (0/1)
SELECT DISTINCT node_caps FROM cap03.TB_DADOS;

# 0 na node_caps negativa, 1 na node_caps positiva e 2 na node_caps = ?
SELECT 
	CASE 
		WHEN node_caps = 'no' THEN 0
		WHEN node_caps = 'yes' THEN 1
		ELSE 2
	END AS node_caps 
FROM cap03.TB_DADOS;

# Categorização da variável seio (E/D)
SELECT DISTINCT seios FROM cap03.TB_DADOS;

# E na seio esquerdo e D na seio direito
SELECT 
	CASE 
		WHEN seio = 'left' THEN 'E'
		WHEN seio = 'right' THEN 'D'
	END AS seio 
FROM cap03.TB_DADOS;

# Categorização da variável tamanho_tumor (6 categorias)
SELECT DISTINCT tamanho_tumor FROM cap03.TB_DADOS;

# E na seio tamanho_tumor e D na tamanho_tumor direito
SELECT 
	CASE 
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
		WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
		WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
		WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
		WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
		WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
	END AS tamanho_tumor 
FROM cap03.TB_DADOS;

# Label Encoding da variável quadrante (1,2,3,4,5)
SELECT DISTINCT quadrante FROM cap03.TB_DADOS;

SELECT 
	CASE 
		WHEN quadrante = 'left_low' THEN 1
		WHEN quadrante = 'right_up' THEN 2
		WHEN quadrante = 'left_up' THEN 3
		WHEN quadrante = 'right_low' THEN 4
		WHEN quadrante = 'central' THEN 5
		ELSE 0
	END AS quadrante 
FROM cap03.TB_DADOS;


CREATE TABLE cap03.TB_DADOS2
AS
SELECT 
	CASE 
		WHEN classe = 'no-recurrence-events' THEN 0
		WHEN classe = 'recurrence-events' THEN 1
	END AS classe, 
	idade, menopausa, 
	CASE 
		WHEN tamanho_tumor = '0-4' OR tamanho_tumor = '5-9' THEN 'Muito Pequeno'
		WHEN tamanho_tumor = '10-14' OR tamanho_tumor = '15-19' THEN 'Pequeno'
		WHEN tamanho_tumor = '20-24' OR tamanho_tumor = '25-29' THEN 'Medio'
		WHEN tamanho_tumor = '30-34' OR tamanho_tumor = '35-39' THEN 'Grande'
		WHEN tamanho_tumor = '40-44' OR tamanho_tumor = '45-49' THEN 'Muito Grande'
		WHEN tamanho_tumor = '50-54' OR tamanho_tumor = '55-59' THEN 'Tratamento Urgente'
	END AS tamanho_tumor,
	inv_nodes,
	CASE 
		WHEN node_caps = 'no' THEN 0
		WHEN node_caps = 'yes' THEN 1
		ELSE 2
	END AS node_caps,
	deg_malig,
		CASE 
		WHEN seio = 'left' THEN 'E'
		WHEN seio = 'right' THEN 'D'
	END AS seio,
	CASE 
		WHEN quadrante = 'left_low' THEN 1
		WHEN quadrante = 'right_up' THEN 2
		WHEN quadrante = 'left_up' THEN 3
		WHEN quadrante = 'right_low' THEN 4
		WHEN quadrante = 'central' THEN 5
		ELSE 0
	END AS quadrante,
	CASE 
		WHEN irradiando = 'no' THEN 0
		WHEN irradiando = 'yes' THEN 1
	END AS irradiando 
FROM cap03.TB_DADOS;


# Solução Exercício 2
# Item1: Aplique label encoding à variável menopausa.
# Binarização da variável classe (0/1)
SELECT DISTINCT menopausa FROM cap03.TB_DADOS2;

SELECT 
	CASE 
		WHEN menopausa = 'premeno' THEN 1
		WHEN menopausa = 'ge40' THEN 2
		WHEN menopausa = 'lt40' THEN 3
	END AS menopausa 
FROM cap03.TB_DADOS;

# Item2: [Desafio] Crie uma nova coluna chamada posicao_tumor concatenando as colunas inv_nodes e quadrante.
CONCAT(inv_nodes, '-', quadrante) AS posicao_tumor;

# Item3: [Desafio] Aplique One-Hot-Encoding à coluna deg_malig.
SELECT DISTINCT deg_malig FROM cap03.TB_DADOS2;

SELECT 
	CASE WHEN deg_malig = 1 THEN 1 ELSE 0 END AS deg_malig_cat1,
	CASE WHEN deg_malig = 2 THEN 1 ELSE 0 END AS deg_malig_cat2,
	CASE WHEN deg_malig = 3 THEN 1 ELSE 0 END AS deg_malig_cat3,
FROM cap03.TB_DADOS2;

# Item4: Crie um novo dataset com todas as variáveis após as transformações anteriores.
CREATE TABLE cap03.TB_DADOS3
AS
SELECT 
	classe, 
	idade, 
	CASE 
		WHEN menopausa = 'premeno' THEN 1
		WHEN menopausa = 'ge40' THEN 2
		WHEN menopausa = 'lt40' THEN 3
	END AS menopausa, 
	tamanho_tumor,
	CONCAT(inv_nodes, '-', quadrante) AS posicao_tumor,
	node_caps,
	CASE WHEN deg_malig = 1 THEN 1 ELSE 0 END AS deg_malig_cat1,
	CASE WHEN deg_malig = 2 THEN 1 ELSE 0 END AS deg_malig_cat2,
	CASE WHEN deg_malig = 3 THEN 1 ELSE 0 END AS deg_malig_cat3,
	seio,
	quadrante,
	irradiando 
FROM cap03.TB_DADOS2;