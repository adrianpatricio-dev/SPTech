USE sprint1;

-- EXERCÍCIO 2: MÚSICA

CREATE TABLE Musica (
	idMusica INT PRIMARY KEY,
    titulo VARCHAR(40),
    artista VARCHAR(40),
    genero VARCHAR(40)
);

INSERT INTO Musica VALUES
	(1, 'Lugar secreto', 'Gabriela Rocha', 'Worship'),
	(2, 'Ousado amor', 'Isaias Saad', 'Worship'),
	(3, 'Me atraiu', 'Gabriela Rocha', 'Pop gospel'),
	(4, 'Bênçãos Que Não Têm Fim', 'Isadora Pompeo', 'Adoração Contemporânea'),
	(5, 'Deus de Promessas', 'Davi Sacer', 'Congregacional'),
	(6, 'Eu Navegarei', 'Gabriela Rocha', 'Pentecostal'),
	(7, 'Atos 2', 'Gabriela Rocha', 'Worship');
    
-- 1)
SELECT * FROM Musica;

-- 2)
ALTER TABLE Musica ADD COLUMN curtidas INT;

-- 3)
UPDATE Musica SET curtidas = 20 WHERE idMusica = 1;
UPDATE Musica SET curtidas = 10 WHERE idMusica = 2;
UPDATE Musica SET curtidas = 10 WHERE idMusica = 3;
UPDATE Musica SET curtidas = 30 WHERE idMusica = 4;
UPDATE Musica SET curtidas = 50 WHERE idMusica = 5;
UPDATE Musica SET curtidas = 15 WHERE idMusica = 6;
UPDATE Musica SET curtidas = 30 WHERE idMusica = 7;

-- 4)
ALTER TABLE Musica MODIFY COLUMN artista VARCHAR(80);

-- 5)
UPDATE Musica SET curtidas = 40
	WHERE idMusica = 1;
    
-- 6)
UPDATE Musica SET curtidas = 12
	WHERE idMusica = 2 OR idMusica = 3;
    
-- 7)
UPDATE Musica SET titulo = 'Emaus'
	WHERE idMusica = 5;
    
-- 8)
DELETE FROM Musica 
	WHERE idMusica = 4;
    
-- 9)
SELECT * FROM Musica
	WHERE genero != 'funk';
    
-- 10)
SELECT * FROM Musica
	WHERE curtidas >= 20;
    
-- 11)
DESCRIBE Musica artista;

-- 12)
TRUNCATE TABLE Musica;