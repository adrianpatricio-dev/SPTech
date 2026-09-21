USE sprint2;

-- CRIAÇÃO DE TABELAS -- 

CREATE TABLE empresa (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL
);

CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
    ra CHAR(8) NOT NULL UNIQUE,
    nome VARCHAR(45),
    email VARCHAR(50),
    fk_empresa INT,
    INDEX fk_alunoempresa_idx (fk_empresa), -- Pesquisa rápida no banco de dados (VÁRIOS ÍNDICES GERAM LENTIDÃO)
    CONSTRAINT fk_alunoempresa FOREIGN KEY (fk_empresa) REFERENCES empresa (id)
);

CREATE TABLE representante (
	nome VARCHAR(45) NOT NULL,
    fk_empresa INT,
    UNIQUE INDEX fk_representante_empresa_idx (fk_empresa), -- O índice não pode se repetir
    CONSTRAINT fk_representante_empresa FOREIGN KEY (fk_empresa) REFERENCES empresa (id)
);

ALTER TABLE aluno ADD COLUMN data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP;

-- ERRO FORÇADO --
INSERT INTO representante VALUES
	('Bianca', 1);

-- ERRO DUPLICIDADE (1062) --
INSERT INTO representante VALUES
	('Julia Lima', 1);

INSERT INTO empresa (nome) VALUES
	('Octea'),
	('Indra'),
	('PWC'),
	('C6 BANK');
    
INSERT INTO representante VALUES
	('Marcus Piombo', 1),
	('Brandão', 2),
	('Brian', 3);

INSERT INTO aluno (ra, nome, email, fk_empresa) VALUES
	('01201002', 'Julia Lima', 'julia@sptech.school', NULL),
	('01262050', 'Brian', 'brian@sptech.school', 1),
	('01262105', 'José', 'josé@sptech.school', 3),
	('01262035', 'Pedro Luca', 'pedro@sptech.school', 2),
	('01222077', 'Murilo', 'murilo@sptech.school', NULL),
	('01262091', 'Mayara', 'mayara@sptech.school', 4),
	('01262136', 'Yasmin', 'yasmin@sptech.school', 4);
    
-- AS : ALIAS --
SELECT
	nome AS NOME_ALUNO, -- com AS
    email EMAIL_ALUNO   -- sem AS
FROM aluno;

-- CONCAT --
SELECT
	CONCAT('Aluno: ', nome, ' | Email: ', email, ' | ID: ', id) INFORMACAO
FROM aluno;

-- INNSER JOIN --
SELECT
	*
FROM aluno INNER JOIN empresa ON aluno.fk_empresa = empresa.id;

SELECT
	*
FROM aluno INNER JOIN empresa ON aluno.fk_empresa = empresa.id
		   INNER JOIN representante ON representante.fk_empresa = empresa.id;
           
SELECT
	e.nome 'EMPRESA',
    r.nome 'REPRESENTANTE',
    a.nome 'ALUNO'
FROM aluno a INNER JOIN empresa e ON a.fk_empresa = e.id INNER JOIN representante r ON r.fk_empresa = e.id;

-- LEFT JOIN --
SELECT
	*
FROM aluno LEFT JOIN empresa ON aluno.fk_empresa = empresa.id;

-- RIGHT JOIN --
SELECT
	*
FROM representante RIGHT JOIN empresa ON empresa.id = representante.fk_empresa;

SELECT
	*
FROM aluno RIGHT JOIN empresa ON aluno.fk_empresa = empresa.id RIGHT JOIN representante ON empresa.id = representante.fk_empresa;

-- DESABILIDAR SAFE MODE : SET SQL_SAFE_UPDATE = 0 ou 1 --

-- DELETAR REGISTROS --
DELETE FROM representante WHERE fk_empresa = 1;
DELETE FROM aluno WHERE fk_empresa = 1;