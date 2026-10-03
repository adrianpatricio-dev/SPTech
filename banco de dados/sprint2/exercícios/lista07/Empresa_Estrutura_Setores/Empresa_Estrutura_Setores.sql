USE sprint2;

-- MODELAGEM E CRIAÇÃO --

CREATE TABLE setor (
	pkSetor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    sigla VARCHAR(10) NOT NULL,
    fkSetorSuperior INT,
    CONSTRAINT fk_setor_superior FOREIGN KEY (fkSetorSuperior) REFERENCES setor (pkSetor)
);

CREATE TABLE funcionario (
	pkFuncionario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    email VARCHAR(80) NOT NULL,
    salario DECIMAL(8,2) NOT NULL,
    dataAdmissao DATE NOT NULL,
    fkSetor INT NOT NULL,
    CONSTRAINT fk_setor_funcionario FOREIGN KEY (fkSetor) REFERENCES setor (pkSetor)
);

CREATE TABLE projeto (
	pkProjeto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    descricao VARCHAR(150) NOT NULL,
    dataInicio DATE NOT NULL,
    dataPrevistaTermino DATE NOT NULL,
    fkSetor INT NOT NULL,
    CONSTRAINT fk_setor_projeto FOREIGN KEY (fkSetor) REFERENCES setor (pkSetor)
);

INSERT INTO setor (nome, sigla, fkSetorSuperior) VALUES
	('Diretoria', 'DIR', NULL),
	('Tecnologia', 'TEC', 1),
	('Financeiro', 'FIN', 1),
	('Desenvolvimento', 'DEV', 2),
	('Infraestrutura', 'INFRA', 2);

INSERT INTO funcionario (nome, email, salario, dataAdmissao, fkSetor) VALUES
	('Carlos Silva', 'carlos.silva@empresa.com', 9500.00, '2018-03-12', 2),
	('Mariana Souza', 'mariana.souza@empresa.com', 6500.00, '2020-07-01', 2),
	('Rafael Lima', 'rafael.lima@empresa.com', 5200.00, '2022-02-15', 4),
	('Ana Pereira', 'ana.pereira@empresa.com', 4300.00, '2023-01-10', 4),
	('Juliana Alves', 'juliana.alves@empresa.com', 8800.00, '2017-09-05', 3),
	('Pedro Santos', 'pedro.santos@empresa.com', 5900.00, '2021-11-22', 5);

INSERT INTO projeto (nome, descricao, dataInicio, dataPrevistaTermino, fkSetor) VALUES
	('Portal do Cliente', 'Desenvolvimento do novo portal web para clientes', '2026-01-10', '2026-08-30', 2),
	('Migração para Nuvem', 'Migração dos servidores locais para a nuvem', '2026-02-01', '2026-12-15', 2),
	('Sistema de Estoque', 'Sistema interno para controle de estoque', '2026-03-05', '2026-09-20', 4),
	('Aplicativo Mobile', 'Aplicativo mobile para acompanhamento de pedidos', '2026-04-12', '2027-02-28', 4),
	('Reestruturação Orçamentária', 'Revisão do orçamento anual dos setores', '2026-05-03', '2026-11-30', 3),
	('Monitoramento de Servidores', 'Painel de monitoramento da infraestrutura', '2026-06-15', '2026-10-31', 5);

-- COMANDOS E MANIPULAÇÃO --

-- a)
SELECT
	funcionario.nome 'Funcionário',
    setor.nome 'Setor'
FROM funcionario INNER JOIN setor ON funcionario.fkSetor = setor.pkSetor;

-- b)
SELECT
	projeto.nome 'Projeto',
    setor.nome 'Setor Responsável'
FROM projeto INNER JOIN setor ON projeto.fkSetor = setor.pkSetor;

-- c)
SELECT
	funcionario.nome 'Funcionário',
    funcionario.dataAdmissao 'Data de Admissão',
    setor.nome 'Setor'
FROM funcionario INNER JOIN setor ON funcionario.fkSetor = setor.pkSetor WHERE funcionario.dataAdmissao > '2021-01-01';

-- d)
SELECT
	setor.nome 'Setor Subordinado',
    superior.nome 'Setor Superior'
FROM setor INNER JOIN setor superior ON setor.fkSetorSuperior = superior.pkSetor;

-- e)
SELECT
	setor.nome 'Setor',
    superior.nome 'Setor Superior'
FROM setor LEFT JOIN setor superior ON setor.fkSetorSuperior = superior.pkSetor;

-- f)
SELECT
	setor.nome 'Setor Subordinado',
    superior.nome 'Setor Superior'
FROM setor INNER JOIN setor superior ON setor.fkSetorSuperior = superior.pkSetor WHERE superior.nome = 'Tecnologia';

-- g)
SELECT
	setor.nome 'Setor',
    funcionario.nome 'Funcionário'
FROM setor LEFT JOIN funcionario ON funcionario.fkSetor = setor.pkSetor;

-- h)
SELECT
	funcionario.nome 'Funcionário',
    funcionario.salario 'Salário',
    setor.nome 'Setor',
    CASE
		WHEN funcionario.salario <= 5000 THEN 'Faixa Baixa'
        WHEN funcionario.salario <= 8000 THEN 'Faixa Média'
        ELSE 'Faixa Alta'
	END 'Classificação Salarial'
FROM funcionario INNER JOIN setor ON funcionario.fkSetor = setor.pkSetor;

-- i)
SELECT
	funcionario.nome 'Funcionário',
    setor.nome 'Setor'
FROM funcionario INNER JOIN setor ON funcionario.fkSetor = setor.pkSetor WHERE setor.nome IN ('Tecnologia', 'Financeiro');

-- j)
UPDATE setor SET fkSetorSuperior = 3 WHERE pkSetor = 5;

-- k)
UPDATE setor SET fkSetorSuperior = NULL WHERE pkSetor = 3;