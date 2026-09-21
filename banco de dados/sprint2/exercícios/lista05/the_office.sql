USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE departamento (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    andar INT
    CONSTRAINT ch_andar CHECK (andar >= 1)
);

CREATE TABLE funcionario (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cargo VARCHAR(20),
    salario DECIMAL(8,2),
    data_contratacao DATE,
    ativo TINYINT DEFAULT 1,
    fk_departamento INT,
    CONSTRAINT ch_cargo CHECK (cargo IN ('Gerente', 'Vendedor', 'Recepcionista', 'Contador', 'Estagiário')),
    CONSTRAINT ch_salario CHECK (salario > 0),
    CONSTRAINT ch_fk_departamento FOREIGN KEY (fk_departamento) REFERENCES departamento (id)
);



-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO departamento (nome, andar) VALUES
	('Vendas', 2),
	('Contabilidade', 1),
	('Recepção', 1);
    
-- 2)
INSERT INTO funcionario (nome, cargo, salario, data_contratacao, ativo, fk_departamento) VALUES
	('Michael Scott', 'Gerente', 3500.00, '2005-03-24', 1, 1),
    ('Dwight Schrute','Vendedor', 2800.00, '2005-03-24', 1, 1),
    ('Jim Halpert', 'Vendedor', 2500.00, '2006-01-15', 1, 1),
    ('Pam Beesly', 'Recepcionista', 1800.00, '2005-03-24', 1, 3),
    ('Kevin Malone', 'Contador', 2200.00, '2005-03-24', 1, 2),
    ('Ryan Howard', 'Estagiario', 1200.00, '2007-08-10', 0, 1);
    
-- 3)
SELECT * FROM departamento;
SELECT * FROM funcionario;

-- 4)
INSERT INTO funcionario (nome, cargo, salario, data_contratacao, ativo, fk_departamento) VALUES
	('Adrian Patrício', 'Diretor', 3500.00, '2026-08-12', 1, 1);
    
    -- Error Code: 3819. Check constraint 'ch_cargo' is violated.

-- 5)
INSERT INTO funcionario (nome, cargo, salario, data_contratacao, ativo, fk_departamento) VALUES
	('Adrian Patrício', 'Gerente', -500.00, '2026-08-12', 1, 1);
    
    -- Error Code: 3819. Check constraint 'ch_salario' is violated.

-- 6)
INSERT INTO funcionario (nome, cargo, salario, data_contratacao, ativo, fk_departamento) VALUES
	('Adrian Patrício', 'Gerente', 3500.00, '2026-08-12', 1, 4);

	-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sprint2`.`funcionario`, CONSTRAINT `ch_fk_departamento` FOREIGN KEY (`fk_departamento`) REFERENCES `departamento` (`id`))

-- 7)
INSERT INTO departamento (nome, andar) VALUES
	('TI', 0);
    
    -- Error Code: 3819. Check constraint 'ch_andar' is violated.



-- PARTE 3 : UPDATE (ATUALIZAÇÃO DE DADOS) --

-- 1)
UPDATE funcionario SET salario = 3800.00 WHERE id = 1;

-- 2)
UPDATE funcionario SET cargo = 'Vendedor' WHERE nome = 'Ryan Howard';

-- 3)
UPDATE funcionario SET ativo = 1 WHERE nome = 'Ryan Howard';

-- 4)
UPDATE departamento SET nome = 'Vendas e Atendimento' WHERE id = 1;

-- 5)
UPDATE funcionario SET salario = 2700.00, cargo = 'Vendedor' WHERE nome = 'Jim Halpert';

-- 6)
UPDATE funcionario SET ativo = 0 WHERE cargo = 'Estagiário';

-- 7)
UPDATE funcionario SET salario = 2900.0 WHERE id IN (2, 3);

-- 8)
UPDATE funcionario SET data_contratacao = '2010-01-01' WHERE fk_departamento = 2;

-- 9)
UPDATE funcionario SET salario = salario * 1.10 WHERE cargo = 'Vendedor';

-- 10)
UPDATE funcionario SET cargo = 'Estagiário';



-- PARTE 4 : DELETE (EXCLUSÃO DE DADOS) --

-- 1)
DELETE FROM funcionario WHERE id = 6;

-- 2)
DELETE FROM funcionario WHERE ativo = 0;

-- 3)
DELETE FROM funcionario WHERE salario < 1500;

-- 4)
DELETE FROM departamento WHERE id = 1;

	-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`sprint2`.`funcionario`, CONSTRAINT `ch_fk_departamento` FOREIGN KEY (`fk_departamento`) REFERENCES `departamento` (`id`))

DELETE FROM funcionario WHERE fk_departamento = 1;
DELETE FROM departamento WHERE id = 1;

-- 5)
DELETE FROM funcionario WHERE cargo = 'Estagiário';

-- 6)
DELETE FROM funcionario WHERE data_contratacao < '2006-01-01';

-- 7)
DELETE FROM funcionario WHERE id IN (4, 5);

-- 8)
DELETE FROM funcionario;
TRUNCATE funcionario;



-- PARTE 5 - ALTER TABLE : ADICIONAR COLUNAS E CONSTRAINTS --

-- 1)
ALTER TABLE funcionario ADD COLUMN email VARCHAR(100);

-- 2)
ALTER TABLE departamento ADD COLUMN telefone VARCHAR(15);

-- 3)
ALTER TABLE funcionario ADD CONSTRAINT ch_email CHECK (email LIKE '%@%');

-- 4)
ALTER TABLE funcionario ADD CONSTRAINT ch_email UNIQUE (email);

-- 5)
DESC funcionario;

-- 6)
INSERT INTO funcionario (nome, cargo, salario, data_contratacao, ativo, fk_departamento, email) VALUES
	('Adrian Patrício', 'Gerente', 3500.00, '2026-08-12', 1, 4, 'semArroba');
    
    -- Error Code: 3819. Check constraint 'ch_email' is violated.
    


-- PARTE 6 : REMOVER CONSTRAINTS E CONFIGURAÇÕES --

-- 1)
ALTER TABLE departamento MODIFY COLUMN nome VARCHAR(50) NULL;

-- 2)
ALTER TABLE funcionario DROP INDEX ch_email;

-- 3)
ALTER TABLE funcionario DROP CONSTRAINT ch_email;

-- 4)
ALTER TABLE funcionario MODIFY COLUMN ativo TINYINT;

-- 5)
ALTER TABLE funcionario DROP CONSTRAINT ch_salario;

-- 6)
ALTER TABLE funcionario DROP CONSTRAINT ch_cargo;

-- 7)
ALTER TABLE funcionario DROP FOREIGN KEY ch_fk_departamento;

INSERT INTO funcionario (nome, cargo, salario, data_contratacao, ativo, fk_departamento, email) VALUES
	('Adrian Patrício', 'Gerente', 3500.00, '2026-08-12', 20, 4, 'adrian@email.com');

-- 8)
DESC funcionario;
DESC departamento;



-- PARTE 7 : CONSULTAS COM JOIN ENTRE AS TABELAS --

-- 1)
SELECT
	funcionario.nome,
    departamento.nome
FROM departamento INNER JOIN funcionario ON departamento.id = funcionario.fk_departamento;

-- 2)
SELECT
	f.nome,
    d.nome
FROM departamento AS d INNER JOIN funcionario AS f ON d.id = f.fk_departamento;

-- 3)
SELECT
	departamento.nome,
    funcionario.cargo
FROM departamento JOIN funcionario ON departamento.id = funcionario.fk_departamento WHERE cargo = 'Vendedor';
    

-- 4)
SELECT
	CONCAT(funcionario.nome, ' - ', funcionario.cargo, ' - ', departamento.nome) 'ficha'
FROM funcionario INNER JOIN departamento ON funcionario.fk_departamento = departamento.id;

-- 5)
SELECT
	IFNULL(d.nome, 'SEM DEPARTAMENTO')
FROM departamento AS d INNER JOIN funcionario AS f ON d.id = f.fk_departamento;