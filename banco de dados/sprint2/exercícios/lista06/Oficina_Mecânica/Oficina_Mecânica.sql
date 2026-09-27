USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE sprint2.cliente (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    telefone CHAR(11),
	email VARCHAR(100)
);

CREATE TABLE sprint2.veiculo (
	id INT PRIMARY KEY AUTO_INCREMENT,
    placa CHAR(7) UNIQUE,
    marca VARCHAR(45),
    modelo VARCHAR(45),
    ano DATE,
    fk_cliente INT,
    CONSTRAINT fk_cliente_veiculo FOREIGN KEY (fk_cliente) REFERENCES veiculo (id)
);

-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO cliente (nome, telefone, email) VALUES
	('João Silva', '11987654321', 'joao@email.com'),
	('Maria Santos', '11912345678', NULL),
	('Carlos Oliveira', '11955554444', 'carlos@email.com');
    
-- 2)
INSERT INTO veiculo (placa, marca, modelo, ano, fk_cliente) VALUES
	('ABC1D23', 'Fiat', 'Uno', '2012-01-01', 1),
	('EFG4H56', 'Chevrolet', 'Onix', '2021-01-01', 2),
	('IJK7L89', 'Volkswagen', 'Gol', '2018-01-01', 3),
	('MNO1P23', 'Toyota', 'Corolla', '2010-01-01', 1),
	('QRS4T56', 'Honda', 'Civic', '2023-01-01', NULL);
    
-- 3)
SELECT * FROM cliente;
SELECT * FROM veiculo;

-- PARTE 3 : CONSULTAS COM SELECT --
 
-- 1)
SELECT
    veiculo.placa,
    veiculo.marca,
    veiculo.modelo
FROM veiculo;

-- 2)
SELECT
    veiculo.placa,
    veiculo.marca,
    veiculo.modelo
FROM veiculo WHERE veiculo.marca = 'Fiat';

-- 3)
SELECT
    veiculo.placa,
    veiculo.marca,
    veiculo.modelo,
    veiculo.ano
FROM veiculo ORDER BY veiculo.ano DESC;

-- 4)
SELECT
    veiculo.placa,
    veiculo.marca,
    veiculo.modelo,
    veiculo.ano
FROM veiculo WHERE veiculo.ano < '2015-01-01';

-- PARTE 4 : CONSULTAS COM AS (RENOMEAR COLUNAS) --

-- 1)
SELECT
    veiculo.placa 'Placa do Veículo',
    veiculo.modelo 'Modelo do Carro'
FROM veiculo;

-- 2)
SELECT
    cliente.nome 'Proprietario',
    cliente.telefone 'Contato'
FROM cliente;

-- 3)
SELECT
    veiculo.ano,
    YEAR(CURDATE()) - YEAR(veiculo.ano) 'Idade do Veículo'
FROM veiculo;

-- 4)
SELECT
    CONCAT(veiculo.marca, ' - ', veiculo.modelo) 'Veículo Completo'
FROM veiculo;

-- PARTE 5 : CONSULTAS COM CASE --

-- 1)
SELECT
    veiculo.placa 'Placa',
    CASE
        WHEN YEAR(veiculo.ano) >= 2020 THEN 'Novo'
        WHEN YEAR(veiculo.ano) BETWEEN 2010 AND 2019 THEN 'Seminovo'
        ELSE 'Antigo'
    END 'classificação'
FROM veiculo;

-- 2)
SELECT
    veiculo.modelo 'Modelo',
    CASE
        WHEN veiculo.marca IN ('Fiat', 'Chevrolet', 'Volkswagen') THEN 'Nacional'
        ELSE 'Importado'
    END 'tipo_marca'
FROM veiculo;

-- 3)
SELECT
    cliente.nome 'Proprietario',
    CASE
        WHEN cliente.email IS NOT NULL THEN 'Sim'
        ELSE 'Não'
    END 'possui_email'
FROM cliente;

-- 4)
SELECT
    veiculo.placa 'Placa',
    CASE
        WHEN YEAR(veiculo.ano) BETWEEN 2000 AND 2009 THEN 'Anos 2000'
        WHEN YEAR(veiculo.ano) BETWEEN 2010 AND 2019 THEN 'Anos 2010'
        ELSE 'Anos 2020'
    END 'decada'
FROM veiculo;

-- PARTE 6 : CONSULTAS COM IFNULL E JOIN --

-- 1)
SELECT
    cliente.nome 'Proprietario',
    IFNULL(cliente.email, 'Email não cadastrado') 'Email'
FROM cliente;

-- 2)
SELECT
    veiculo.placa 'Placa',
    veiculo.modelo 'Modelo',
    IFNULL(cliente.nome, 'SEM DONO') 'Proprietario'
FROM veiculo LEFT JOIN cliente ON veiculo.fk_cliente = cliente.id;

-- 3)
SELECT
    veiculo.placa 'Placa',
    veiculo.modelo 'Modelo',
    cliente.nome 'Proprietario'
FROM veiculo INNER JOIN cliente ON veiculo.fk_cliente = cliente.id;

-- 4)
SELECT
    CONCAT(veiculo.placa, ' - ', veiculo.modelo, ' - ', cliente.nome) 'registro'
FROM veiculo INNER JOIN cliente ON veiculo.fk_cliente = cliente.id;

-- 5)
SELECT
    veiculo.placa 'Placa',
    veiculo.modelo 'Modelo',
    cliente.nome 'Proprietario'
FROM veiculo RIGHT JOIN cliente ON veiculo.fk_cliente = cliente.id;