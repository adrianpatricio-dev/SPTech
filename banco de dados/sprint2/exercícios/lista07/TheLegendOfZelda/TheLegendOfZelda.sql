USE sprint2;

-- ESTRUTURA DA TABELA --

CREATE TABLE sprint2.jogoZelda (
	pkJogo INT PRIMARY KEY AUTO_INCREMENT,
    nmJogo VARCHAR(45),
    anoLancamento INT,
    fkJogoAnterior INT,
    CONSTRAINT fk_jogo_jogoAnterior FOREIGN KEY (fkJogoAnterior) REFERENCES jogoZelda (pkJogo)
);

-- COMANDOS --

-- 1)
INSERT INTO sprint2.jogoZelda (nmJogo, anoLancamento, fkJogoAnterior) VALUES 
	('The Legend of Zelda', 1986, NULL),
	('Zelda II: The Adventure of Link', 1987, 1),
	('A Link to the Past', 1991, 2),
	('Links Awakening', 1993, 3),
	('Ocarina of Time ★', 1998, 4),
	('Majoras Mask', 2000, 5),
	('The Wind Waker', 2002, 6),
	('Twilight Princess', 2006, 7),
	('Skyward Sword', 2011, 8),
	('A Link Between Worlds', 2013, 9),
	('Breath of the Wild', 2017, 10),
	('Tears of the Kingdom', 2023, 11);
    
    select * from jogoZelda;
    
-- 2)
SELECT
	jogo.nmJogo 'Jogo',
	jogo_anterior.nmJogo 'Jogo anterior'
FROM jogoZelda jogo INNER JOIN jogoZelda jogo_anterior ON jogo.pkJogo = jogo_anterior.fkJogoAnterior;

-- 3)
SELECT
	jogoZelda.nmJogo 'Jogo',
    jogoZelda.anoLancamento 'Ano de lançamento',
    CASE
		WHEN anoLancamento < 1995 THEN 'Era Clássica'
        WHEN anoLancamento <= 2010 THEN 'Era Moderna'
        ELSE 'Era Contemporânea'
	END 'Período'
FROM jogoZelda ORDER BY anoLancamento ASC;

-- 4)
ALTER TABLE jogoZelda ADD COLUMN nmConsole VARCHAR(30);

-- 5)
UPDATE jogoZelda SET nmConsole = 'NES' WHERE pkJogo IN(1, 2);
UPDATE jogoZelda SET nmConsole = 'SNES' WHERE pkJogo = 3;
UPDATE jogoZelda SET nmConsole = 'Game Boy' WHERE pkJogo = 4;
UPDATE jogoZelda SET nmConsole = 'Nintendo 64' WHERE pkJogo IN(5, 6);
UPDATE jogoZelda SET nmConsole = 'GameCube' WHERE pkJogo = 7;
UPDATE jogoZelda SET nmConsole = 'Wii' WHERE pkJogo IN(8, 9);
UPDATE jogoZelda SET nmConsole = 'Wii' WHERE pkJogo = 10;
UPDATE jogoZelda SET nmConsole = 'Nintendo Switch' WHERE pkJogo IN(11, 12);

-- 6)
SELECT
	jogoZelda.nmConsole 'Console',
    jogoZelda.nmJogo 'Jogo'
FROM jogoZelda ORDER BY anoLancamento DESC;

-- 7)
SELECT
	CONCAT('[', jogo.nmJogo, '] é o sucessor de [', jogo_anterior.nmJogo, ']') 'Jogos e Antecessores'
FROM jogoZelda jogo INNER JOIN jogoZelda jogo_anterior ON jogo.pkJogo = jogo_anterior.fkJogoAnterior;

-- 8)
SELECT
    jogo.nmJogo 'Jogo',
    jogo.anoLancamento 'Ano lançamento'
FROM jogoZelda jogo LEFT JOIN jogoZelda jogo_anterior ON jogo.fkJogoAnterior = jogo_anterior.pkJogo WHERE jogo_anterior.pkJogo IS NULL;

-- 9)
DELETE FROM jogoZelda WHERE pkJogo = 12;