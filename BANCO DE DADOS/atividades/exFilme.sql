USE sprint1;

-- EXERCÍCIO 3: Filme

CREATE TABLE Filme (
	idFilme INT PRIMARY KEY,
    titulo VARCHAR(50),
    genero VARCHAR(40),
    diretor VARCHAR(40)
);

INSERT INTO Filme VALUES
	(1, "Vingadores: Ultimato", "Super-herói", "Anthony Russo"),
	(2, "Batman: O Cavaleiro das Trevas", "Super-herói", "Christopher Nolan"),
	(3, "Homem-Aranha: Sem Volta para Casa", "Super-herói", "Jon Watts"),
	(4, "John Wick: De Volta ao Jogo", "Ação", "Chad Stahelski"),
	(5, "Interestelar", "Ficção científica", "Christopher Nolan"),
	(6, "Avatar", "Ficção científica", "James Cameron"),
	(7, "Duro de Matar", "Suspense", "John McTiernan");
    
-- 1)
SELECT * FROM Filme;

-- 2)
ALTER TABLE Filme ADD COLUMN protagonista VARCHAR(50);

-- 3)
UPDATE Filme SET protagonista = 'Homem de ferro' WHERE idFilme = 1;
UPDATE Filme SET protagonista = 'Batman' WHERE idFilme = 2;
UPDATE Filme SET protagonista = 'Homem aranha' WHERE idFilme = 3;
UPDATE Filme SET protagonista = 'John Wick' WHERE idFilme = 4;
UPDATE Filme SET protagonista = 'Joseph Cooper' WHERE idFilme = 5;
UPDATE Filme SET protagonista = 'Jake Sully' WHERE idFilme = 6;
UPDATE Filme SET protagonista = 'John McClane' WHERE idFilme = 7;

-- 4)
ALTER TABLE Filme MODIFY COLUMN diretor VARCHAR(150);

-- 5)
UPDATE Filme SET diretor = 'Christopher Nolan'
	WHERE idFilme = 5;

-- 6)
UPDATE Filme SET diretor = 'Adrian Patrício'
	WHERE idFilme = 2 OR idFilme = 7;

-- 7)
UPDATE Filme SET titulo = 'Avatar: fogo e cinzas'
	WHERE idFilme = 6;
    
-- 8)
DELETE FROM Filme
	WHERE idFilme = 3;

-- 9)
SELECT * FROM Filme
	WHERE genero != 'drama';
    
-- 10)
SELECT * FROM Filme
	WHERE genero = 'Suspense';

-- 11)
DESCRIBE Filme diretor;

-- 12) 
TRUNCATE TABLE Filme;