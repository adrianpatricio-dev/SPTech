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
    modo_online CHAR(1)
);

-- INSERÇÃO DE DADOS --

-- 1)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
	('God of War', 'Ação', 199.90, 'PS4', '2018-04-20', NOW(), 'N');

-- 2)
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
    ('Minecraft', 'Sandbox', NULL, 'PC', '2011-11-18', NOW(), 'N');
    
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
INSERT INTO jogo (nome_jogo, genero, preco, plataforma, data_lancamento, data_cadastro, modo_online) VALUE
	('Fortnite', NULL, 0.00, 'PC', '2017-07-21', '2026-08-28 20:28:00', 'S');
    
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
SELECT * FROM jogo ORDER BY nome_jogo DESC;

-- 7)
SELECT * FROM jogo WHERE data_lancamento > '2020-01-01';

-- 8)
SELECT nome_jogo, preco AS 'Valor' FROM jogo;

-- 9)
SELECT
	CONCAT(nome_jogo, ' ' ,plataforma)
FROM jogo;

-- 10)
SELECT IFNULL(preco, 'Gratuito') FROM jogo;

-- 11)
SELECT IFNULL(genero, 'Não informado') FROM jogo;

-- 12)
SELECT nome_jogo, data_lancamento, data_cadastro, CONCAT('R$ ', preco) FROM jogo;

-- 13)
SELECT data_lancamento AS 'Lançamento' FROM jogo;

-- 14)
SELECT modo_online AS 'Modo Online' FROM jogo;

-- 15)
SELECT
	CONCAT(nome_jogo,' - ',genero)
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
		WHEN preco >= 200 THEN 'Caro'
        ELSE 'Acessível'
	END 'Preço'
FROM jogo;

-- 18)
SELECT 
	nome_jogo,
	CASE
		WHEN modo_online = 'S' THEN 'Online'
	END 'Modo'
FROM jogo;

-- 19)
SELECT 
	nome_jogo,
	CASE
		WHEN modo_online = 'N' THEN 'Offline'
	END 'Modo'
FROM jogo;

-- 20)
SELECT
	nome_jogo,
    CASE
		WHEN preco >= 200 THEN 'Caro'
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
SELECT * FROM jogo WHERE preco = 0 OR preco IS NULL ORDER BY nome_jogo ASC;

-- 28)
SELECT
	nome_jogo AS 'Nome do jogo',
    CASE
		WHEN plataforma = 'PC' THEN 'PC'
        ELSE 'Video Game'
	END 'Plataforma',
    CASE
		WHEN preco = 0 OR preco IS NULL THEN 'Gratuito'
        ELSE CONCAT('R$ ', preco)
	END 'Preço',
    CASE
		WHEN preco < 100 THEN 'Econômico'
        WHEN preco BETWEEN 100 AND 150 THEN 'Intermediário'
        ELSE 'Caro'
	END 'Classificação'
FROM jogo;

-- ATUALIZAÇÃO DE DADOS --

-- 1)
UPDATE jogo SET preco = 300 WHERE id = 1;

-- 2)
UPDATE jogo SET genero = 'Battle royale' WHERE id = 9;

-- 3)
UPDATE jogo SET modo_online = 'S' WHERE plataforma = 'PC';

-- 4)
UPDATE jogo SET preco = 0.00 WHERE preco IS NULL;

-- 5)
UPDATE jogo SET plataforma = 'PC' WHERE id = 2;

-- 6)
UPDATE jogo SET data_lancamento = '2026-01-01' WHERE id = 6;

-- 7)
UPDATE jogo SET modo_online = 'N';
-- Usando o modo SafeMode ele não permite a execução
-- Sem o SafeMode o comando é realizado, trocando o modo online de todos os jogos para 'N'

-- EXCLUSÃO DE DADOS --

-- 1)
DELETE FROM jogo WHERE id = 8;

-- 2)
DELETE FROM jogo WHERE preco = 0 OR preco IS NULL;

-- 3)
DELETE FROM jogo WHERE genero IS NULL;

-- 4)
DELETE FROM jogo WHERE data_lancamento < '2010-01-01';

-- 5)
DELETE FROM jogo; -- remove os registros, mas o contador AUTO_INCREMENT normalmente não é resetado.

-- ALTERAÇÃO DE ESTRUTURA DA TABELA --

-- 1)
ALTER TABLE jogo ADD COLUMN classificacao_indicativa VARCHAR(10);

-- 2)
ALTER TABLE jogo ADD COLUMN tamanho_jogo DECIMAL(5,2);

-- 3)
ALTER TABLE jogo ADD COLUMN desenvolvedora VARCHAR(45);

-- 4)
ALTER TABLE jogo ADD COLUMN modo_historia CHAR(1);

-- 5)
ALTER TABLE jogo ADD CONSTRAINT chModo CHECK (modo_historia IN('S', 'N'));

-- 6)
ALTER TABLE jogo MODIFY COLUMN nome_jogo VARCHAR(60);

-- 7)
ALTER TABLE jogo MODIFY COLUMN plataforma VARCHAR(20);

-- 8)
ALTER TABLE jogo MODIFY COLUMN preco DECIMAL(6,2);

-- 9)
ALTER TABLE jogo RENAME COLUMN modo_online TO modo_jogo;

-- 10)
ALTER TABLE jogo DROP COLUMN desenvolvedora;

-- 11)
ALTER TABLE jogo DROP COLUMN modo_historia;

-- 12)
ALTER TABLE jogo DROP COLUMN dificuldade; -- Não é possível remover a coluna dificuldade, checar se essa coluna existe;

-- 13)
ALTER TABLE jogo ADD CONSTRAINT chNome UNIQUE (nome_jogo);