USE sprint2;

CREATE TABLE sprint2.pessoa1 (
	idPessoa INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dataNascim DATE
);

CREATE TABLE sprint2.pessoa2 (
	idPessoa2 INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    dtNascim DATE,
    fkPessoa1 INT,
    CONSTRAINT fkPessoa1_Pessoa2 FOREIGN KEY (fkPessoa1) REFERENCES pessoa1 (idPessoa)
);

INSERT INTO pessoa1 (idPessoa, nome, dataNascim) VALUES
	(1, 'Adrian', '2005-03-15'),
	(2, 'Carlos', '1998-07-20'),
	(3, 'Mariana', '2002-11-10'),
	(4, 'João', '1995-05-25'),
	(5, 'Beatriz', '2008-09-12');
    
INSERT INTO pessoa2 (idPessoa2, nome, dtNascim, fkPessoa1) VALUES
	(1, 'Lucas', '2001-06-18', 1),
	(2, 'Fernanda', '1999-02-10', 2),
	(3, 'Rafael', '2003-08-22', 3),
	(4, 'Camila', '1997-12-05', 4),
	(5, 'Gabriel', '2007-04-30', 5);
    
-- CONSULTAS --

-- 1)
SELECT
	*
FROM pessoa1 INNER JOIN pessoa2 ON pessoa1.idPessoa = pessoa2.fkPessoa1;

-- 2)
SELECT
	*
FROM pessoa1 INNER JOIN pessoa2 ON pessoa1.idPessoa = pessoa2.fkPessoa1 WHERE pessoa1.idPessoa = 1;

-- 3)
SELECT
	*
FROM pessoa2 INNER JOIN pessoa1 ON pessoa1.idPessoa = pessoa2.fkPessoa1 WHERE pessoa2.idPessoa2 = 1;

-- 4)
SELECT
	pessoa1.nome,
    pessoa2.nome
FROM pessoa1 INNER JOIN pessoa2 ON pessoa1.idPessoa = pessoa2.fkPessoa1;

-- 5)
SELECT
	*
FROM pessoa1 INNER JOIN pessoa2 ON pessoa1.idPessoa = pessoa2.fkPessoa1 WHERE pessoa2.dtNascim > '2000-01-01';