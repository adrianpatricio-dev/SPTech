USE sprint1;

-- ESTRUTURA DA TABELA --

CREATE TABLE jogo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome_jogo VARCHAR(45) NOT NULL,
    genero VARCHAR(15),
    preco DECIMAL(5,2),
    plataforma VARCHAR(10),
    data_lancamento DATE,
    data_cadastro DATETIME,
    modo_online CHAR(1) CONSTRAINT chOnline CHECK (modo_online IN('S', 'N'))
);

-- INSERÇÃO DE DADOS --

-- 1)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
	('God of War', 'Ação', 199.90, 'PS4', '2018-04-20', NOW(), 'N');

-- 2)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
    ('Minecraft', 'Sandbox', 99.90, NULL, '2011-11-18', NOW(), 'N');
    
-- 3)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE 
    ('FIFA 25', 'Esporte', 299.90, 'PS5', '2024-09-27', NOW(), 'S');
    
-- 4)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
    ('The Last of Us', 'Ação', 149.90, 'PS4', '2026-06-14', NOW(), 'N');
    
-- 5)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
	('Tony Hawk''s Pro Skater', 'Esporte', 49.90, 'PS1', '1999-10-22', NOW(), 'N');
    
-- 6)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
	('Cyberpunk 2077', 'RPG', 199.90, 'PC', '2020-12-10', NOW(), 'N');

-- 7)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
	('Doom', 'Ação', 99.90, 'PC', '1993-12-10', NOW(), 'N'),
    ('Doom', 'Ação', 199.90, 'PC', '2016-05-13', NOW(), 'S');
    
-- 8)
INSERT INTO jogo (nome_jogo, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
	('Fortnite', 0.00, 'PC', '2017-07-21', '2026-08-28 20:28:00', 'S');
    
-- 9)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUES
('Assassin''s Creed Odyssey', 'RPG', 199.90, 'PC', '2018-10-05', NOW(), 'N'),
('Assassin''s Creed Valhalla', 'RPG', 249.90, 'PC', '2020-11-10', NOW(), 'N'),
('Assassin''s Creed Origins', 'RPG', 149.90, 'PC', '2017-10-27', NOW(), 'N');

-- CONSULTAS E RELATÓRIOS --

-- 1)
SELECT * FROM jogo;

-- 2)
SELECT nome_jogo, preco FROM jogo;

-- 3)
SELECT * FROM jogo WHERE preco > 100;

-- 4)
SELECT * FROM jogo WHERE plataforma = 'PC';

-- 5)
SELECT * FROM jogo ORDER BY preco ASC;

-- 6)
SELECT * FROM jogo ORDER BY preco DESC;

-- 7)
SELECT * FROM jogo WHERE data_lancamento > '2020-01-01';

-- 8)
SELECT nome_jogo, preco AS 'Valor' FROM jogo;

-- 9)
SELECT
	CONCAT(nome_jogo, ' ', plataforma)
FROM jogo;

-- 10)
SELECT preco, IFNULL(preco, 'Gratuito') FROM jogo;

-- 11)
SELECT genero, IFNULL(genero, 'Não informado') FROM jogo;

-- 12)
SELECT nome_jogo, data_lancamento, data_cadastro, CONCAT('R$', preco) FROM jogo;

-- 13)
SELECT data_lancamento AS 'Lançamento' FROM jogo;

-- 14)
SELECT modo_online AS 'Modo Online' FROM jogo;

-- 15)
SELECT
	CONCAT(nome_jogo,'-',genero)
FROM jogo;

-- 16)
SELECT
	CASE
        WHEN preco IS NULL THEN CONCAT('O jogo ', nome_jogo, ' com a data de lançamento ', data_lancamento, ' está Grátis!')
        ELSE CONCAT('O jogo ', nome_jogo, ' com a data de lançamento ', data_lancamento, ' está custando R$ ', preco)
	END 'Mensagem'
FROM jogo;

-- 17)
SELECT 
	CASE
		WHEN preco > 200 THEN 'Caro'
        ELSE 'Acessível'
	END 'Preço'
FROM jogo;

-- 18)
SELECT 
	nome_jogo,
	CASE
		WHEN modo_online = 'S' THEN 'Online'
	END 'Modo'
FROM jogo WHERE modo_online = 'S';

-- 19)
SELECT 
	nome_jogo,
	CASE
		WHEN modo_online = 'N' THEN 'Offline'
	END 'Modo'
FROM jogo WHERE modo_online = 'N';

-- 20)
SELECT
	nome_jogo,
    CASE
		WHEN preco > 200 THEN 'Caro'
        ELSE 'Acessível'
	END 'Situação de preço',
    CASE
		WHEN modo_online = 'N' THEN 'Offline'
        WHEN modo_online = 'S' THEN 'Online'
	END 'Disponibilidade'
FROM jogo;

-- 21)
SELECT 
	nome_jogo,
    CASE 
		WHEN data_lancamento > '2026-01-01' THEN 'Lançamentos Recentes'
        ELSE 'Antigos'
	END 'Data'
FROM jogo;

-- 22)
SELECT 
	nome_jogo,
    CASE 
		WHEN preco IS NULL OR preco = 0 THEN 'Gratuitos'
        ELSE 'Pagos'
	END 'Preço'
FROM jogo;

-- 23)
SELECT 
	nome_jogo,
    CASE
		WHEN plataforma = 'PC' THEN 'Categoria PC'
        ELSE 'Categoria Video Game'
	END 'Categoria'
FROM jogo;

-- 24)
SELECT 
	nome_jogo,
    CASE
		WHEN preco < 100 THEN 'Econômico'
        WHEN preco BETWEEN 100 AND 150 THEN 'Intermediário'
        ELSE 'Caro'
	END 'Classificação'
FROM jogo;

-- 25)
SELECT
	nome_jogo,
    CASE
		WHEN data_lancamento < '2015-01-01' THEN 'Clássico/  Antigo'
        ELSE 'Novos'
	END 'Data'
FROM jogo;

-- 26)
SELECT * FROM jogo WHERE modo_online = 'S' AND preco IS NOT NULL;

-- 27)
SELECT * FROM jogo WHERE preco = 0 ORDER BY nome_jogo ASC;

-- 28)
SELECT
	nome_jogo AS 'Nome do jogo',
    CASE
		WHEN plataforma = 'PC' THEN 'PC'
        ELSE 'Video Game'
	END 'Plataforma',
    CASE
		WHEN preco = 0 THEN 'Gratuito'
        ELSE CONCAT('R$ ', preco)
	END 'Preço',
    CASE
		WHEN preco < 100 THEN 'Econômico'
        WHEN preco BETWEEN 100 AND 150 THEN 'Intermediário'
        ELSE 'Caro'
	END 'Classificação'
FROM jogo;