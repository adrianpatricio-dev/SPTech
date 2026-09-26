USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE time (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cidade VARCHAR(45),
    estadio VARCHAR(45)
);

CREATE TABLE jogador (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    posicao VARCHAR(20) CONSTRAINT ch_posicao CHECK (posicao IN('Defensor', 'Meia', 'Atacante')),
    numero_camisa INT,
    salario DECIMAL(10,2) CONSTRAINT ch_salario CHECK (salario > 0),
    fk_time INT,
    CONSTRAINT fk_time_pessoa FOREIGN KEY (fk_time) REFERENCES time (id)
);

-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO time (nome, cidade, estadio) VALUES
	('Corinthians', 'São Paulo', 'Neo Química Arena'),
	('Palmeiras', 'São Paulo', 'Neo Química Arena'),
	('Santos', 'Santos', NULL);
    
-- 2)
INSERT INTO jogador (nome, posicao, numero_camisa, salario, fk_time) VALUES
	('Gabriel Silva', 'Atacante', 9, 2500.00, 1),
	('Lucas Oliveira', 'Meia', 10, 1800.00, 1),
	('Rafael Santos', 'Defensor', 4, 1500.00, 2),
	('Pedro Costa', 'Atacante', 7, 5000.00, 2),
	('João Martins', 'Meia', 8, 12000.00, 3),
	('Carlos Souza', 'Defensor', 3, 6000.00, NULL);

-- 3)
SELECT * FROM time;
SELECT * FROM jogador;

-- PARTE 3 : CONSULTAS COM SELECT --

-- 1)
SELECT
	nome,
    salario
FROM jogador;

-- 2)
SELECT
	*
FROM jogador WHERE posicao = 'Atacante';

-- 3)
SELECT
	*
FROM jogador ORDER BY salario DESC;

-- 4)
SELECT
	* 
FROM jogador WHERE salario > 5000;

-- PARTE 4 : CONSULTAS COM AS (RENOMEAR COLUNAS) --

-- 1)
SELECT
	jogador.nome 'Nome do jogador',
    jogador.salario 'Salário Mensal'
FROM jogador;

-- 2)
SELECT
	time.nome 'Clube',
    time.estadio 'Arena'
FROM time;

-- 3)
SELECT
	jogador.salario * 12 'Salario Anual'
FROM jogador;

-- 4)
SELECT
	jogador.nome 'Atleta',
    jogador.numero_camisa 'Camisa'
FROM jogador;

-- PARTE 5 : CONSULTAS COM CASE --

-- 1)
SELECT
	jogador.nome 'Atleta',
    CASE
		WHEN jogador.salario < 3000 THEN 'Baixo'
        WHEN jogador.salario <= 8000 THEN 'Médio'
        ELSE 'Alto'
	END faixa_salarial
FROM jogador;

-- 2)
SELECT
	jogador.nome 'Atleta',
    CASE
		WHEN jogador.posicao = 'Goleiro' OR jogador.posicao = 'Defensor' THEN 'Linha de Defesa'
        WHEN jogador.posicao = 'Meia' THEN 'Meio Campo'
        ELSE 'Ataque'
	END tipo_posicao
FROM jogador;

-- 3)
SELECT
	time.nome 'Time',
    CASE
		WHEN time.estadio IS NOT NULL THEN 'Sim'
        ELSE 'Não'
	END possui_estadio
FROM time;

-- 4)
SELECT
	jogador.nome 'Atleta',
    CASE
		WHEN jogador.numero_camisa = 10 THEN 'Camisa 10 - Craque'
		ELSE 'Jogador'
    END destaque
FROM jogador;

-- PARTE 6 : CONSULTAS COM IFNULL E JOIN --

-- 1)
SELECT
	jogador.nome 'Atleta',
    IFNULL(fk_time, 'Sem time') fk_time
FROM jogador LEFT JOIN time ON time.id = jogador.fk_time;

-- 2)
SELECT
	jogador.nome 'Atleta',
    IFNULL(time.nome, 'SEM CLUBE') 'Clube'
FROM jogador LEFT JOIN time ON jogador.fk_time = time.id;

-- 3)
SELECT
	jogador.nome 'Atleta',
    jogador.posicao 'Posição',
    time.nome 'Time'
FROM jogador INNER JOIN time ON jogador.fk_time = time.id;

-- 4)
SELECT
	CONCAT(jogador.nome, ' - ', jogador.posicao, ' - ', time.nome) ficha
FROM jogador INNER JOIN time ON jogador.fk_time = time.id;

-- 5)
SELECT
	*
FROM jogador RIGHT JOIN time ON jogador.fk_time = time.id;