-- BANCO DE DADOS E TABELA LIVRO --

-- 1)
CREATE DATABASE biblioteca;

-- 2)
USE biblioteca;

-- 3)
CREATE TABLE livro (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45),
    autor VARCHAR(45) DEFAULT 'Sem autor',
    ano_publicacao DATE
);

-- 4)
INSERT INTO livro (titulo, ano_publicacao) VALUES
	('O Hobbit', '1937-09-21'),
	('Dom Casmurro', '1899-01-01');

-- 5)
SELECT * FROM livro;

-- 6)
UPDATE livro SET autor = 'John Ronald Reuel Tolkien' WHERE codigo = 1;

-- 7)
SELECT titulo, autor FROM livro WHERE codigo = 1;

-- 8)
DELETE FROM livro WHERE codigo = 2;

-- 9)
DESCRIBE livro;

-- 10)
ALTER TABLE livro ADD COLUMN editora VARCHAR(45);

-- 11)
SELECT * FROM livro WHERE autor LIKE '%a%';

-- 12)
ALTER TABLE livro DROP COLUMN editora;


-- TABLEA USUARIO --

-- 13)
CREATE TABLE usuario (
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    tipo VARCHAR(20)
);

-- 14)
INSERT INTO usuario (nome) VALUES
	('Adrian'),
    ('Gabriel');
    
-- 15)
ALTER TABLE usuario ADD CONSTRAINT chTipo CHECK (tipo IN('docente', 'discente', 'visitante'));

-- 16)
UPDATE usuario SET tipo = 'docente' WHERE codigo = 1;
UPDATE usuario SET tipo = 'visitante' WHERE codigo = 2;

-- 17)
SELECT * FROM usuario WHERE nome LIKE '%m_';

-- 18)
ALTER TABLE usuario ADD COLUMN telefone CHAR(11);

-- 19)
ALTER TABLE usuario MODIFY COLUMN nome VARCHAR(50);


-- CONSULTAS --

-- 20)
ALTER TABLE usuario RENAME COLUMN nome TO nome_completo;

-- 21)
SELECT
	CONCAT(titulo, ' ', autor) AS detalhes
FROM livro;

-- 22)
SELECT
	titulo,
    ano_publicacao,
    CASE 
		WHEN ano_publicacao < '2000-01-01' THEN 'Antigo'
		ELSE 'Moderno'
    END AS classificacao
FROM livro;

-- 23)
SELECT * FROM livro ORDER BY titulo DESC;

-- 24)
SELECT * FROM usuario WHERE tipo != 'docente';


-- REMOÇÃO DO BANCO DE DADOS --

-- 25)
TRUNCATE TABLE livro;

-- 26)
DROP DATABASE biblioteca;