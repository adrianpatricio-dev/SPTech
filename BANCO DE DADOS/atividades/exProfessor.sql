USE sprint1;

-- EXERCÍCIO 4: PROFESSOR

CREATE TABLE Professor (
	idProfessor INT PRIMARY KEY,
    nome VARCHAR(50),
    especialidade VARCHAR(40),
    dtNasc DATE
);

INSERT INTO Professor VALUES
	(1, 'Julia', 'Banco de dados', '1982-04-15'),
	(2, 'Murilo', 'Banco de dados', '1978-11-03'),
	(3, 'Frizza', 'Algoritmo', '1979-12-07'),
	(4, 'Lucas', 'Algoritmo', '1980-01-30'),
	(5, 'Fernando', 'TI', '1978-11-30'),
	(6, 'Marcos', 'TI', '1978-11-30');

-- 1)
SELECT * FROM Professor;

-- 2)
ALTER TABLE Professor ADD COLUMN funcao VARCHAR(50);

ALTER TABLE Professor ADD CONSTRAINT chFuncao 
	CHECK (funcao = 'monitor' OR funcao = 'assistente' OR funcao = 'titular');
    
-- 3)
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 1;
UPDATE Professor SET funcao = 'assistente' WHERE idProfessor = 2;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 3;
UPDATE Professor SET funcao = 'monitor' WHERE idProfessor = 4;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 5;
UPDATE Professor SET funcao = 'titular' WHERE idProfessor = 6;

-- 4)
INSERT INTO Professor VALUE
	(7, 'Adrian', 'Algoritmo', '2006-08-12', 'titular');
    
-- 5)
DELETE FROM Professor WHERE
	idProfessor = 5;
    
-- 6)
SELECT nome FROM Professor
	WHERE funcao = 'titular';
    
-- 7)
SELECT especialidade, dtNasc FROM Professor
	WHERE funcao = 'monitor';

-- 8)
UPDATE Professor SET dtNasc = '1976-07-11' WHERE idProfessor = 3;

-- 9)
TRUNCATE TABLE Professor;