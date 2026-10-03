USE sprint2;

-- MODELAGEM E CRIAÇÃO --

CREATE TABLE departamento (
	pkDepartamento INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    andar INT NOT NULL
);

CREATE TABLE funcionario (
	pkFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(80) NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    dataAdmissao DATE NOT NULL,
    fkDepartamento INT NOT NULL,
    fkSupervisor INT,
    CONSTRAINT fk_departamento_funcionario FOREIGN KEY (fkDepartamento) REFERENCES departamento (pkDepartamento),
    CONSTRAINT fk_funcionario_supervisor FOREIGN KEY (fkSupervisor) REFERENCES funcionario (pkFuncionario)
);

INSERT INTO departamento (nome, andar) VALUES
	('TI', 3),
	('RH', 1),
	('Financeiro', 2),
	('Comercial', 4);

INSERT INTO funcionario (nome, email, salario, dataAdmissao, fkDepartamento, fkSupervisor) VALUES
	('Carlos Silva', 'carlos.silva@empresa.com', 9500.00, '2018-03-12', 1, NULL),
	('Mariana Souza', 'mariana.souza@empresa.com', 6500.00, '2020-07-01', 1, 1),
	('Rafael Lima', 'rafael.lima@empresa.com', 5200.00, '2022-02-15', 1, 1),
	('Ana Pereira', 'ana.pereira@empresa.com', 7800.00, '2019-05-20', 2, NULL),
	('Bruno Costa', 'bruno.costa@empresa.com', 4300.00, '2023-01-10', 2, 4),
	('Juliana Alves', 'juliana.alves@empresa.com', 8800.00, '2017-09-05', 3, NULL),
	('Pedro Santos', 'pedro.santos@empresa.com', 5900.00, '2021-11-22', 3, 6),
	('Fernanda Rocha', 'fernanda.rocha@empresa.com', 4800.00, '2024-04-08', 4, NULL);

-- COMANDOS E MANIPULAÇÃO --

-- a)
SELECT
	funcionario.nome 'Funcionário',
    departamento.nome 'Departamento'
FROM funcionario INNER JOIN departamento ON funcionario.fkDepartamento = departamento.pkDepartamento;

-- b)
SELECT
	funcionario.nome 'Funcionário',
    funcionario.salario 'Salário',
    departamento.nome 'Departamento'
FROM funcionario INNER JOIN departamento ON funcionario.fkDepartamento = departamento.pkDepartamento WHERE funcionario.dataAdmissao > '2021-01-01';

-- c)
SELECT
	funcionario.nome 'Funcionário',
    departamento.nome 'Departamento'
FROM funcionario INNER JOIN departamento ON funcionario.fkDepartamento = departamento.pkDepartamento WHERE departamento.nome IN ('TI', 'Financeiro');

-- d)
SELECT
	funcionario.nome 'Funcionário',
    funcionario.salario 'Salário',
    departamento.nome 'Departamento'
FROM funcionario INNER JOIN departamento ON funcionario.fkDepartamento = departamento.pkDepartamento ORDER BY funcionario.salario DESC;

-- e)
SELECT
	funcionario.nome 'Funcionário',
    supervisor.nome 'Supervisor'
FROM funcionario INNER JOIN funcionario supervisor ON funcionario.fkSupervisor = supervisor.pkFuncionario;

-- f)
SELECT
	funcionario.nome 'Funcionário',
    funcionario.email 'E-mail'
FROM funcionario INNER JOIN funcionario supervisor ON funcionario.fkSupervisor = supervisor.pkFuncionario WHERE supervisor.nome = 'Carlos Silva';

-- g)
SELECT
	funcionario.nome 'Funcionário',
    supervisor.nome 'Supervisor'
FROM funcionario INNER JOIN funcionario supervisor ON funcionario.fkSupervisor = supervisor.pkFuncionario WHERE supervisor.nome LIKE 'C%';

-- h)
SELECT
	funcionario.nome 'Funcionário',
    supervisor.nome 'Supervisor',
    CASE
		WHEN funcionario.salario <= 5000 THEN 'Faixa Baixa'
        WHEN funcionario.salario <= 8000 THEN 'Faixa Média'
        ELSE 'Faixa Alta'
	END 'Classificação Salarial'
FROM funcionario LEFT JOIN funcionario supervisor ON funcionario.fkSupervisor = supervisor.pkFuncionario;

-- i)
UPDATE funcionario SET fkSupervisor = 4 WHERE pkFuncionario = 3;

-- j)
UPDATE funcionario SET fkSupervisor = NULL WHERE pkFuncionario = 2;

-- k)
DELETE FROM funcionario WHERE pkFuncionario = 3;