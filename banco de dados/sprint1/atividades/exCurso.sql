USE sprint1;

CREATE TABLE Curso (
	idCurso INT PRIMARY KEY,
    nome VARCHAR(50),
    sigla CHAR(3),
    coordenador VARCHAR(50)
);

INSERT INTO Curso VALUES 
	(1, 'Sistemas da informação', 'SIS', 'Pedro'),
	(2, 'Ciência da computação', 'CCO', 'Júlia'),
	(3, 'Análise e Desenvolvimento de sistemas', 'ADS', 'Roger');
    

-- 1)
SELECT * FROM Curso;

-- 2)
SELECT coordenador FROM Curso;

-- 3)
SELECT * FROM Curso
	WHERE sigla = 'ADS';
    
-- 4)
SELECT * FROM Curso
	ORDER BY nome ASC;
    
-- 5)
SELECT * FROM Curso
	ORDER BY coordenador DESC;
    
-- 6)
SELECT * FROM Curso
	WHERE nome LIKE 'A%';
    
-- 7)
SELECT * FROM Curso
	WHERE nome LIKE '%o';
    
-- 8)
SELECT * FROM Curso
	WHERE nome LIKE '_n%';
    
-- 9)
SELECT * FROM Curso
	WHERE nome LIKE '%a_';
    
-- 10)
DROP TABLE Curso;