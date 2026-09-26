USE sprint2;

CREATE TABLE pessoas (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cpf CHAR(11)
);

CREATE TABLE habilitacao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    catergoria VARCHAR(5),
    data_validade DATE,
    fk_pessoa INT,
    CONSTRAINT fk_pessoas_habilitacao FOREIGN KEY (fk_pessoa) REFERENCES pessoas (id)
);

INSERT INTO pessoas (nome, cpf) VALUES
	('Adrian', '12345678901'),
	('Carlos', '23456789012'),
	('Mariana', '34567890123'),
	('João', '45678901234'),
	('Beatriz', '56789012345');
    
INSERT INTO habilitacao (categoria, data_validade, fk_pessoa) VALUES
	('A', '2027-05-20', 1),
	('B', '2026-03-15', 2),
	('A+B', '2028-10-10', 3),
	('B', '2025-12-30', 4),
	('A', '2029-07-25', 5);
    
-- 1)
SELECT
	*
FROM pessoas INNER JOIN habilitacao ON pessoas.id = habilitacao.fk_pessoa;

-- 2)
SELECT 
	*
FROM pessoas INNER JOIN habilitacao ON pessoas.id = habilitacao.fk_pessoa WHERE pessoas.id = 1;

-- 3)
SELECT
	pessoas.nome 'Nome',
    habilitacao.categoria 'Categoria'
FROM pessoas INNER JOIN habilitacao ON pessoas.id = habilitacao.fk_pessoa;

-- 4)
SELECT
	pessoas.*
FROM pessoas INNER JOIN habilitacao ON pessoas.id = habilitacao.fk_pessoa WHERE categoria = 'A';

-- 5)
SELECT
	CONCAT('[', pessoas.nome,'] esta habilitado na categoria [', habilitacao.categoria, ']') AS 'Pessoas e sua habilitação'
FROM pessoas INNER JOIN habilitacao ON pessoas.id = habilitacao.fk_pessoa;

-- 6)
SELECT
	pessoas.*
FROM pessoas INNER JOIN habilitacao ON pessoas.id = habilitacao.fk_pessoa WHERE habilitacao.data_validade < CURRENT_DATE();