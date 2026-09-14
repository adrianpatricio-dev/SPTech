USE sprint1;

-- EXERCÍCIO 1: ATLETA

CREATE TABLE Atleta (
	idAtleta INT PRIMARY KEY,
    nome VARCHAR(40),
    modalidade VARCHAR(40),
    qtdMedalha INT
);

INSERT INTO Atleta VALUES 
	(1, 'Michael Phelps', 'natação', 28),
    (2, 'Usain Bolt', 'atletismo', 8),
    (3, 'Simone Biles', 'ginástica artística', 11),
    (4, 'César Cielo', 'natação', 3),
    (5, 'Vera', 'ginástica artística', 2);
    
-- 1)
SELECT * FROM Atleta;

-- 2)
UPDATE Atleta SET qtdMedalha = 20
	WHERE idAtleta = 1;
    
-- 3)
UPDATE Atleta SET qtdMedalha = 100
	WHERE idAtleta = 2 OR idAtleta = 3;
    
-- 4)
UPDATE Atleta SET nome = 'Rosana'
	WHERE idAtleta = 4;
    
-- 5)
ALTER TABLE Atleta ADD COLUMN dtNasc DATE;

-- 6)
UPDATE Atleta SET dtNasc = '1990-08-02' WHERE idAtleta = 1;    
UPDATE Atleta SET dtNasc = '2000-10-14' WHERE idAtleta = 2;    
UPDATE Atleta SET dtNasc = '2002-08-25' WHERE idAtleta = 3;    
UPDATE Atleta SET dtNasc = '1980-12-05' WHERE idAtleta = 4;    
UPDATE Atleta SET dtNasc = '1994-08-02' WHERE idAtleta = 5;

-- 7)
DELETE FROM Atleta WHERE idAtleta = 5;

-- 8)
SELECT * FROM Atleta 
	WHERE modalidade != 'natação';
    
-- 9)
SELECT * FROM Atleta
	WHERE qtdMedalha >= 3;
    
-- 10)
ALTER TABLE Atleta MODIFY COLUMN modalidade VARCHAR(60);

-- 11)
DESCRIBE Atleta modalidade;

-- 12)
TRUNCATE TABLE Atleta;