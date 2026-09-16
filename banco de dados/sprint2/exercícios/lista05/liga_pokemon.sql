-- BANCO DE DADOS E TABELA : treinador --

-- 1)
CREATE DATABASE liga_pokemon;

USE liga_pokemon;

-- 2)
CREATE TABLE treinador (
	id_treinador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    idade TINYINT,
    telefone VARCHAR(20),
    data_cadastro DATETIME
);

-- 3)
ALTER TABLE treinador AUTO_INCREMENT = 100;

-- 4)
INSERT INTO treinador (id_treinador, nome, idade, telefone, data_cadastro) VALUES
	(DEFAULT ,'Ash Ketchum', 12, '11956482366', NOW()),
	(DEFAULT ,'Misty', 12, NULL, NOW()),
	(DEFAULT ,'Brock', 15, '11925626366', NOW()),
	(DEFAULT ,'Lance', 60, NULL, NOW()),
	(DEFAULT ,'Serena', 14, '11923487512', NOW());
    
-- 5)
SELECT * FROM treinador;



-- FUNÇÕES DE DATA --

-- 1)
SELECT 
	nome, 
    DATE_FORMAT(data_cadastro, '%d/%m/%Y') AS data_cadastro
FROM treinador;

-- 2)
SELECT 
	nome,
    YEAR(NOW()),
    YEAR(data_cadastro),
    MONTH(data_cadastro),
    DAY(data_cadastro)
FROM treinador;

-- 3)
SELECT 
	CURDATE(), 
    nome 
FROM treinador;

-- 4)
SELECT
	TIMESTAMPDIFF(DAY, data_cadastro, '2026-09-25') AS 'Dias'
FROM treinador;

SELECT
	TIMESTAMPDIFF(MONTH, data_cadastro, '2026-12-25') AS 'Mês'
FROM treinador;

SELECT
	TIMESTAMPDIFF(YEAR, data_cadastro, '2028-12-25') AS 'Ano'
FROM treinador;

-- 5)
SELECT 
	DATEDIFF(NOW(), '2006-08-12') AS 'Diferença entre data atual e data de nascimento'
FROM treinador;



-- FUNÇÕES DE NULO (IS NULL, IFNULL, ISNULL, NULLIF) --

-- 1)
SELECT 
	nome
FROM treinador WHERE telefone IS NULL;

-- 2)
SELECT
	*
FROM treinador WHERE telefone IS NOT NULL;

-- 3)
SELECT
	nome,
    IFNULL(telefone, 'Telefone não informado')
FROM treinador;

-- 4)
SELECT
	nome, 
    ISNULL(telefone) AS semtelefone
FROM treinador;

-- 5)
SELECT
	nome,
    NULLIF(idade, 12) AS idade_diferente_de_12
FROM treinador;



-- ALTER TABLE COM MÚLTIPLAS ALTERAÇÕES --

-- 1)
ALTER TABLE treinador ADD COLUMN 
	cidade VARCHAR(50), 
    DROP COLUMN telefone;

-- 2)
DESCRIBE treinador;



-- UPDATE : ATUALIZAÇÃO DE RESGITROS --

-- 1)
UPDATE treinador SET 
	nome = 'Ash', 
	idade = 13, 
    cidade = 'Pallet'
WHERE id_treinador = 100;

SELECT * FROM treinador;

-- 2)
UPDATE treinador SET 
	cidade = 'Pallet'  
WHERE id_treinador IN (101, 103);

SELECT * FROM treinador;

-- 3)
UPDATE treinador SET 
	cidade = 'São Paulo' 
WHERE cidade IS NULL;

SELECT * FROM treinador;

-- 4)
SELECT * FROM treinador WHERE id_treinador BETWEEN 101 AND 103 OR id_treinador = 100;



-- TABELA pokemon COM DEFAULT

-- 1)
CREATE TABLE pokemon (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    tipo VARCHAR(45) DEFAULT 'Água',
    nivel TINYINT,
    hp INT,
    atk INT
);

-- 2)
INSERT INTO pokemon (nome, nivel, hp, atk) VALUES
	('Squirtle', 2, 30, 10),
	('Greninja', 50, 120, 140),
	('Lapras', 40, 90, 100);
    
-- 3)
SELECT * FROM pokemon;

-- 4)
INSERT INTO pokemon (nome, nivel, hp, atk, tipo) VALUES
	('Pikachu', 100, 100, 70, 'Elétrico'),
	('Zapdos', 70, 500, 300, 'Elétrico'),
	('Alakazam', 25, 120, 70, 'Psíquico');
    
    
    
-- OPERAÇÕES ARITMÉTICAS NO SELECT --

-- 1)
SELECT
	nome,
    hp + atk AS poder_total
FROM pokemon;

-- 2)
SELECT
	nome,
    hp - atk AS total
FROM pokemon;

-- 3)
SELECT
	nome,
    hp * 2 AS dobra_da_vida,
    atk / 2 AS ataque_reduzido,
    atk
FROM pokemon;



-- ALTER TABLE : REMOVER E RECRIAR COLUNAS --

-- 1)
ALTER TABLE pokemon ADD COLUMN 
	tipo VARCHAR(20), -- COLUNA NÍVEL JÁ EXISTE
    DROP COLUMN nivel,
    ADD COLUMN nivel INT;

-- 2)
DESCRIBE pokemon;