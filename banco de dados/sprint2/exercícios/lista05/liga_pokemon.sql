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
	nome, 
    ISNULL(telefone) AS semtelefone
FROM treinador;

-- 5)
SELECT
	nome,
    NULLIF(idade, 12) AS idade_diferente_de_12
FROM treinador;