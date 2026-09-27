USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE equipe (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    regiao VARCHAR(20) CONSTRAINT ch_regiao CHECK (regiao IN('Americas', 'Europa', 'Asia')),
    ranking INT
);

CREATE TABLE jogador_cs (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nickname VARCHAR(45),
    nome_real VARCHAR(45),
    funcao VARCHAR(20) CONSTRAINT ch_funcao CHECK (funcao IN('Rifler', 'AWPer', 'Entry', 'IGL', 'Suporte')),
    fk_equipe INT,
    CONSTRAINT fk_equipe_jogador FOREIGN KEY (fk_equipe) REFERENCES equipe (id)
);

-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO equipe (nome, regiao, ranking) VALUES
	('FURIA', 'Americas', 8),
	('Natus Vincere', 'Europa', 3),
	('Paper Rex', 'Asia', NULL);

-- 2)
INSERT INTO jogador_cs (nickname, nome_real, funcao, fk_equipe) VALUES
	('Fallen', 'Gabriel Toledo', 'IGL', 1),
	('KSCERATO', 'Kaike Cerato', 'Rifler', 1),
	('s1mple', 'Oleksandr Kostyliev', 'AWPer', 2),
	('w0nderful', 'Ihor Zhdanov', 'AWPer', 2),
	('f0rest', 'Patrik Lindberg', 'Rifler', NULL);
    
-- 3)
SELECT * FROM equipe;
SELECT * FROM jogador_cs;

-- PARTE 3 : CONSULTAS COM SELECT --
 
-- 1)
SELECT
    jogador_cs.nickname,
    jogador_cs.funcao
FROM jogador_cs;

-- 2)
SELECT
    jogador_cs.nickname,
    jogador_cs.funcao
FROM jogador_cs WHERE jogador_cs.funcao = 'AWPer';

-- 3)
SELECT
    equipe.nome,
    equipe.ranking
FROM equipe ORDER BY equipe.ranking ASC;

-- 4)
SELECT
    jogador_cs.nickname,
    jogador_cs.nome_real,
    jogador_cs.funcao
FROM jogador_cs WHERE jogador_cs.nickname LIKE 'F%';

-- PARTE 4 : CONSULTAS COM AS (RENOMEAR COLUNAS) --

-- 1)
SELECT
    jogador_cs.nickname 'Nick',
    jogador_cs.nome_real 'Nome Verdadeiro'
FROM jogador_cs;

-- 2)
SELECT
    equipe.nome 'Time',
    equipe.regiao 'Região Competitiva'
FROM equipe;

-- 3)
SELECT
    equipe.ranking 'Posição no Ranking Mundial'
FROM equipe;

-- 4)
SELECT
    CONCAT(jogador_cs.nickname, ' - ', jogador_cs.funcao) 'Jogador e Função'
FROM jogador_cs;

-- PARTE 5 : CONSULTAS COM CASE --

-- 1)
SELECT
    jogador_cs.nickname 'Nick',
    CASE
        WHEN jogador_cs.funcao IN ('Rifler', 'Entry') THEN 'Agressivo'
        WHEN jogador_cs.funcao = 'AWPer' THEN 'Sniper'
        ELSE 'Tático'
    END 'tipo_função'
FROM jogador_cs;

-- 2)
SELECT
    equipe.nome 'Time',
    CASE
        WHEN equipe.ranking <= 5 THEN 'Tier 1'
        WHEN equipe.ranking BETWEEN 6 AND 20 THEN 'Tier 2'
        ELSE 'Tier 3'
    END 'nivel'
FROM equipe;

-- 3)
SELECT
    equipe.nome 'Time',
    CASE
        WHEN equipe.regiao = 'Americas' THEN 'Ocidente'
        ELSE 'Oriente'
    END 'continente'
FROM equipe;

-- 4)
SELECT
    jogador_cs.nickname 'Nick',
    CASE
        WHEN jogador_cs.funcao = 'IGL' THEN 'Sim - In-Game Leader'
        ELSE 'Não'
    END 'líder'
FROM jogador_cs;

-- PARTE 6 : CONSULTAS COM IFNULL E JOIN --

-- 1)
SELECT 
	equipe.nome 'Time',
	IFNULL(equipe.ranking, 'Sem ranking') 'Posição no Ranking Mundial'
FROM equipe;

-- 2)
SELECT 
	jogador_cs.nickname 'Nick',
	IFNULL(equipe.nome, 'FREE AGENT') 'Time'
FROM jogador_cs LEFT JOIN equipe ON jogador_cs.fk_equipe = equipe.id;

-- 3)
SELECT 
	jogador_cs.nickname 'Nick',
	jogador_cs.funcao 'Função',
	equipe.nome 'Time'
FROM jogador_cs INNER JOIN equipe ON jogador_cs.fk_equipe = equipe.id;

-- 4)
SELECT 
	CONCAT(jogador_cs.nickname, ' - ', jogador_cs.funcao, ' - ', equipe.nome) 'perfil'
FROM jogador_cs INNER JOIN equipe ON jogador_cs.fk_equipe = equipe.id;

-- 5)
SELECT 
	jogador_cs.nickname 'Nick',
	equipe.nome 'Time'
FROM jogador_cs RIGHT JOIN equipe ON jogador_cs.fk_equipe = equipe.id;