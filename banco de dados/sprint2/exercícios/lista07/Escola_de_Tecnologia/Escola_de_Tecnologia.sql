USE sprint2;

-- MODELAGEM E CRIAÇÃO --

CREATE TABLE curso (
	pkCurso INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    duracaoSemestres INT NOT NULL
);

CREATE TABLE turma (
	pkTurma INT PRIMARY KEY AUTO_INCREMENT,
    codigo VARCHAR(20) NOT NULL,
    semestreIngresso VARCHAR(6) NOT NULL,
    fkCurso INT NOT NULL,
    CONSTRAINT fk_curso_turma FOREIGN KEY (fkCurso) REFERENCES curso (pkCurso)
);

CREATE TABLE aluno (
	pkAluno INT PRIMARY KEY AUTO_INCREMENT,
    ra VARCHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(80) NOT NULL,
    dataNascimento DATE NOT NULL,
    fkTurma INT NOT NULL,
    CONSTRAINT fk_turma_aluno FOREIGN KEY (fkTurma) REFERENCES turma (pkTurma)
);

INSERT INTO curso (nome, sigla, duracaoSemestres) VALUES
	('Análise e Desenvolvimento de Sistemas', 'ADS', 5),
	('Ciência da Computação', 'CCO', 8),
	('Sistemas de Informação', 'SIS', 8);

INSERT INTO turma (codigo, semestreIngresso, fkCurso) VALUES
	('ADS-2025A', '2025/1', 1),
	('ADS-2026A', '2026/1', 1),
	('ADS-2026B', '2026/2', 1),
	('CCO-2024A', '2024/1', 2);

INSERT INTO aluno (ra, nome, email, dataNascimento, fkTurma) VALUES
	('01250001', 'Lucas Ferreira', 'lucas.ferreira@escola.com', '2005-02-14', 1),
	('01250002', 'Beatriz Martins', 'beatriz.martins@escola.com', '2004-08-30', 1),
	('01250003', 'Gustavo Almeida', 'gustavo.almeida@escola.com', '2003-11-05', 1),
	('01260001', 'Camila Ribeiro', 'camila.ribeiro@escola.com', '2006-01-19', 2),
	('01260002', 'Thiago Nunes', 'thiago.nunes@escola.com', '2005-06-23', 2),
	('01260003', 'Larissa Barbosa', 'larissa.barbosa@escola.com', '2006-09-12', 3),
	('01240001', 'Felipe Carvalho', 'felipe.carvalho@escola.com', '2004-04-07', 4),
	('01240002', 'Isabela Moreira', 'isabela.moreira@escola.com', '2003-12-28', 4);

-- COMANDOS E MANIPULAÇÃO --

-- a)
SELECT
	turma.codigo 'Turma',
    curso.nome 'Curso'
FROM turma INNER JOIN curso ON turma.fkCurso = curso.pkCurso;

-- b)
SELECT
	aluno.nome 'Aluno',
    aluno.ra 'RA',
    turma.codigo 'Turma',
    curso.nome 'Curso'
FROM aluno INNER JOIN turma ON aluno.fkTurma = turma.pkTurma INNER JOIN curso ON turma.fkCurso = curso.pkCurso;

-- c)
SELECT
	aluno.nome 'Aluno',
    turma.codigo 'Turma',
    curso.nome 'Curso'
FROM aluno INNER JOIN turma ON aluno.fkTurma = turma.pkTurma INNER JOIN curso ON turma.fkCurso = curso.pkCurso WHERE curso.nome = 'Análise e Desenvolvimento de Sistemas';

-- d)
SELECT
	aluno.nome 'Aluno',
    turma.codigo 'Turma',
    CASE
		WHEN turma.semestreIngresso >= '2026/1' THEN 'Ingressante'
        WHEN turma.semestreIngresso >= '2025/1' THEN 'Intermediário'
        ELSE 'Veterano'
	END 'Classificação'
FROM aluno INNER JOIN turma ON aluno.fkTurma = turma.pkTurma;

-- e)
SELECT
	curso.nome 'Curso',
    turma.codigo 'Turma'
FROM curso LEFT JOIN turma ON turma.fkCurso = curso.pkCurso;

-- f)
ALTER TABLE aluno ADD COLUMN telefone VARCHAR(15);

-- g)
UPDATE aluno SET telefone = '(11) 91234-5678' WHERE pkAluno = 1;
UPDATE aluno SET telefone = '(11) 98765-4321' WHERE pkAluno = 4;