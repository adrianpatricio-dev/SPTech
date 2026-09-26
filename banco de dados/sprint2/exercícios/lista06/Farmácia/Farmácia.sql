USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE farmacia (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cnpj CHAR(14) UNIQUE
);

CREATE TABLE endereco (
	id INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(45),
    numero INT,
    bairro VARCHAR(45),
    cidade VARCHAR(45),
    fk_farmacia INT UNIQUE,
    CONSTRAINT fk_farmacia_endereco FOREIGN KEY (fk_farmacia) REFERENCES farmacia (id)
);

CREATE TABLE farmaceutico (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    crf CHAR(6),
    turno VARCHAR(10) CONSTRAINT ch_turno CHECK (turno IN('Manhã', 'Tarde', 'Noite')),
    fk_farmacia INT,
    CONSTRAINT fk_farmacia_farmaceutico FOREIGN KEY (fk_farmacia) REFERENCES farmacia (id)
);

-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO farmacia (nome, cnpj) VALUES
	('Farmácia Central', '12345678000101'),
	('Farmácia Saúde', '23456789000102'),
	('Farmácia Bem Estar', '34567890000103');
    
-- 2)
INSERT INTO endereco (rua, numero, bairro, cidade, fk_farmacia) VALUES
	('Rua das Flores', 100, 'Santana', 'São Paulo', 1),
	('Avenida Brasil', 250, NULL, 'São Paulo', 2);
    
-- 3)
INSERT INTO farmaceutico (nome, crf, turno, fk_farmacia) VALUES
	('Adrian Silva', 'CRF001', 'Manhã', 1),
	('Carlos Souza', 'CRF002', 'Tarde', 1),
	('Mariana Lima', 'CRF003', 'Noite', 2),
	('João Santos', 'CRF004', 'Noite', 2),
	('Beatriz Costa', 'CRF005', 'Manhã', 3);
    
-- 4)
SELECT * FROM farmacia;
SELECT * FROM endereco;
SELECT * FROM farmaceutico;

-- 5)
INSERT INTO endereco (rua, numero, bairro, cidade, fk_farmacia) VALUES
	('Rua Nova', 999, 'Centro', 'São Paulo', 1);
    
    -- Error Code: 1062. Duplicate entry '1' for key 'endereco.fk_farmacia'
    
-- PARTE 3 : CONSULTAS COM SELECT --

-- 1)
SELECT
    farmacia.nome,
    farmacia.cnpj
FROM farmacia;

-- 2)
SELECT 
	*
FROM farmaceutico WHERE farmaceutico.turno = 'Noite';

-- 3)
SELECT 
	*
FROM endereco ORDER BY endereco.cidade ASC;

-- 4)
SELECT
    farmaceutico.nome,
    farmaceutico.crf
FROM farmaceutico;

-- PARTE 4 : CONSULTAS COM AS (RENOMEAR COLUNAS) --

-- 1)
SELECT
    farmacia.nome 'Estabelecimento',
    farmacia.cnpj 'Documento'
FROM farmacia;

-- 2)
SELECT
    farmaceutico.nome 'Profissional',
    farmaceutico.turno 'Horario de Trabalho'
FROM farmaceutico;

-- 3)
SELECT
    endereco.rua 'Logradouro',
    endereco.numero 'Num.'
FROM endereco;

-- 4)
SELECT
    CONCAT(endereco.rua, ', ', endereco.numero) 'Endereço Completo'
FROM endereco;

-- PARTE 5 : CONSULTAS COM CASE --

-- 1)
SELECT
    farmaceutico.nome 'Profissional',
    CASE
        WHEN farmaceutico.turno = 'Manhã' THEN '06h-12h'
        WHEN farmaceutico.turno = 'Tarde' THEN '12h-18h'
        ELSE '18h-00h'
    END 'periodo'
FROM farmaceutico;

-- 2)
SELECT
    farmacia.nome 'Profissional',
    CASE
        WHEN farmacia.cnpj LIKE '1%' THEN 'Matriz'
        ELSE 'Filial'
    END 'tipo_cnpj'
FROM farmacia;

-- 3)
SELECT
    endereco.bairro 'Bairro',
    CASE
        WHEN endereco.bairro = 'Santana' THEN 'Zona Norte'
        WHEN endereco.bairro = 'Moema' THEN 'Zona Sul'
        ELSE 'Outra'
    END 'zona'
FROM endereco;

-- 4)
SELECT
    farmaceutico.nome 'Profissional',
    CASE
        WHEN farmaceutico.turno = 'Noite' THEN 'Adicional Noturno'
        ELSE 'Normal'
    END 'carga_horaria'
FROM farmaceutico;

-- PARTE 6 : CONSULTAS COM IFNULL E JOIN --

-- 1)
SELECT
    farmacia.nome 'Estabelecimento',
    IFNULL(endereco.rua, 'SEM ENDERECO') 'rua'
FROM farmacia LEFT JOIN endereco ON farmacia.id = endereco.fk_farmacia;

-- 2)
SELECT
    farmaceutico.nome 'Profissional',
    farmaceutico.crf 'CRF',
    farmacia.nome 'Estabelecimento'
FROM farmaceutico INNER JOIN farmacia ON farmaceutico.fk_farmacia = farmacia.id;

-- 3)
SELECT
    farmacia.nome 'Estabelecimento',
    endereco.cidade 'Cidade',
    farmaceutico.nome 'Profissional'
FROM farmacia
INNER JOIN endereco
    ON farmacia.id = endereco.fk_farmacia
INNER JOIN farmaceutico
    ON farmacia.id = farmaceutico.fk_farmacia;
    
-- 4)
SELECT
    CONCAT(farmaceutico.nome, ' - ', farmaceutico.crf, ' - ', farmacia.nome) 'info'
FROM farmaceutico INNER JOIN farmacia ON farmaceutico.fk_farmacia = farmacia.id;

-- 5)
SELECT
    endereco.rua 'Rua',
    IFNULL(endereco.bairro, 'Bairro não informado') 'bairro'
FROM endereco;