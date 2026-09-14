CREATE DATABASE liga_pokemon;

USE liga_pokemon;

CREATE TABLE liga_pokemon.treinador (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45) NOT NULL,
    idade TINYINT, -- númerico
    telefone CHAR(11),
    dataCadastro DATETIME
);

-- OUTRA MANEIRA DE REALIZAR O AUTO_INCREMENT
ALTER TABLE liga_pokemon.treinador AUTO_INCREMENT = 100;

-- DEFAULT : VALOR PADRÃO
-- NOW() : CAPTURA A DATA E O HORÁRIO ATUAL

INSERT INTO liga_pokemon.treinador VALUES
	(DEFAULT, 'Ash Ketchum', 12, '11956482366', NOW()),
	(DEFAULT, 'Misty', 12, NULL, NOW()),
	(DEFAULT, 'Brock', 15, '11956482555', NOW()),
	(DEFAULT, 'Lance', 60, NULL, NOW()),
	(DEFAULT, 'Serena', 14, '11956489999', NOW());


SELECT * FROM liga_pokemon.treinador;

-- DATE_FORMAT() : FORMARTAR A DATA, DEIXANDO O VALOR MAIS AGRADÁVEL (DIA/ MÊS/ ANO & HORA: MINUTO:  SEGUNDO)
SELECT nome, DATE_FORMAT(dataCadastro, '%d/%m/%Y %H:%i:%s') data_cadastro FROM liga_pokemon.treinador;

-- EXIBIR O TELEFONE SE ESTIVER NULO (IS NULL)
SELECT * FROM liga_pokemon.treinador WHERE telefone IS NULL;

-- EXIBIR O TELEFONE QUE NÃO É NULO (IS NOT NULL)
SELECT * FROM liga_pokemon.treinador WHERE telefone IS NOT NULL;

-- VALIDANDO O CAMPO TELEFONE & SUBSTITUINDO O VALOR (IFNULL)
SELECT nome, IFNULL(telefone, 'Telefone não informado') validaTelefone FROM liga_pokemon.treinador;

-- VERIFICA SE O VALOR É NULO | 0 = NULO 1 = NÃO NULO | (ISNULL)
SELECT nome, ISNULL(telefone) semTelefone FROM liga_pokemon.treinador;

-- QUANDO O CAMPO FOR 12, O VALOR COLOCADO NO LUGAR VAI SER 12 (NULLIF)
SELECT nome, NULLIF(idade, 12) 'idade diferente de 12' FROM liga_pokemon.treinador;

-- ALTERANDO DOIS CAMPOS EM UMA ÚNICA LINHA DE COMANDO
ALTER TABLE liga_pokemon.treinador ADD COLUMN cidade VARCHAR(45), DROP COLUMN telefone;

-- ATUALIZAR TRÊS REGISTROS DE UM ÚNICO ID
UPDATE liga_pokemon.treinador SET nome = 'Ash', idade = 13, cidade = 'Pallet' WHERE id = 100;

-- SEMPRE VALIDAR
SELECT * FROM liga_pokemon.treinador WHERE id = 100;

-- ATUALIZAR UM REGISTRO DE VÁRIOS IDs
UPDATE liga_pokemon.treinador SET cidade = 'Pallet' WHERE id IN (101, 103);

SELECT * FROM liga_pokemon.treinador WHERE id IN (101, 103);

CREATE TABLE liga_pokemon.pokemon (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    tipo VARCHAR(45) DEFAULT 'Água',
    nivel TINYINT,
    hp INT,
    atk INT
);

INSERT INTO liga_pokemon.pokemon (nome, nivel, hp, atk) VALUES
	('Squirtle', 2, 30, 10),
	('Greninja', 50, 120, 140),
	('Lapras', 40, 90, 100);
    
INSERT INTO liga_pokemon.pokemon (nome, nivel, hp, atk, tipo) VALUES
	('Pikachu', 100, 100, 70, 'Elétrico'),
	('Zapdos ', 70, 500, 300, 'Elétrico'),
	('Alakazam', 25, 120, 70, 'Psiquico');

-- SOMA
SELECT
	nome, 
    hp + atk AS poder_total
FROM pokemon;

-- SUBTRAÇÃO
SELECT
	nome, 
    hp - atk AS total
FROM pokemon;

-- MULTIPLICAÇÃO & DIVISÃO
SELECT
	nome, 
    hp * 2 dobra_da_vida,
    atk / 2 ataque_reduzido
FROM pokemon;

-- EXTRAÇÃO DAS DATAS
SELECT 
	nome,
    NOW() data_hora_atual,
    CURDATE() data_atual
FROM
	liga_pokemon.treinador;
    
-- EXTRAÇÃO SEPARADA
SELECT 
	nome,
    YEAR(NOW()) ano_atual,
    YEAR(dataCadastro) ano_cadastro,
    MONTH(dataCadastro) mes_cadastro,
    DAY(dataCadastro) dia_cadastro,
    CURDATE() data_atual
FROM
	liga_pokemon.treinador;

-- DIFERENÇA ENTRE DATAS
SELECT
	nome,
    TIMESTAMPDIFF(DAY, dataCadastro, '2026-09-24') dias_cadastro,
    TIMESTAMPDIFF(MONTH, dataCadastro, '2026-09-24') meses_cadastro,
    TIMESTAMPDIFF(YEAR, dataCadastro, '2026-09-24') anos_cadastro
FROM
	liga_pokemon.treinador;
    
-- IDADE | TIMESTAMPDIFF = MOSTRA, DIAS, MESES, ANOS & DATEDIFF = SOMENTE DIAS |
SELECT
    TIMESTAMPDIFF(YEAR, '2006-08-12', NOW()) idade;
    
SELECT
    DATEDIFF(NOW(), '2006-08-12') idade_em_dias;