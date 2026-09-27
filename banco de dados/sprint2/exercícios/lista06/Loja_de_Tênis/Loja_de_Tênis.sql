USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE marca (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    pais_origem VARCHAR(45)
);

CREATE TABLE tenis (
	id INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(45),
    tamanho INT,
    preco DECIMAL(5,2) CONSTRAINT ch_precos CHECK (preco > 0),
    categoria VARCHAR(10) CONSTRAINT ch_categoria CHECK (categoria IN('Corrida', 'Casual', 'Basquete', 'Futebol')),
    fk_marca INT,
    CONSTRAINT fk_marca_tenis FOREIGN KEY (fk_marca) REFERENCES marca (id)
);

-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO marca (nome, pais_origem) VALUES
    ('Nike', 'Estados Unidos'),
    ('Adidas', 'Alemanha'),
    ('Olympikus', NULL);
    
-- 2)
INSERT INTO tenis (modelo, tamanho, preco, categoria, fk_marca) VALUES
    ('Air Max', 42, 499.90, 'Corrida', 1),
    ('Ultraboost', 40, 699.90, 'Corrida', 2),
    ('Court Vision', 39, 199.90, 'Casual', 1),
    ('Superstar', 41, 349.90, 'Casual', 2),
    ('Precision', 43, 549.90, 'Basquete', 1),
    ('Tenis Generico', 37, 149.90, 'Futebol', NULL);
    
-- 3)
SELECT * FROM marca;
SELECT * FROM tenis;

-- PARTE 3 : CONSULTAS COM SELECT --
 
-- 1)
SELECT 
	tenis.modelo,
    tenis.preco
FROM tenis;

-- 2)
SELECT 
    tenis.modelo,
    tenis.preco
FROM tenis WHERE tenis.categoria = 'Corrida';

-- 3)
SELECT 
    tenis.modelo,
    tenis.preco
FROM tenis ORDER BY tenis.preco DESC;

-- 4)
SELECT 
    tenis.modelo,
    tenis.tamanho
FROM tenis WHERE tenis.tamanho >= 40;

-- PARTE 4 : CONSULTAS COM AS (RENOMEAR COLUNAS) --

-- 1)
SELECT 
    tenis.modelo 'Produto',
    tenis.preco 'Valor (R$)'
FROM tenis;

-- 2)
SELECT 
    marca.nome 'Fabricante',
    marca.pais_origem 'Pais'
FROM marca;

-- 3)
SELECT 
    tenis.preco * 1.15 'Preço com Frete'
FROM tenis;

-- 4)
SELECT 
    CONCAT(tenis.modelo, ' - ', tenis.tamanho) 'Descrição do Produto'
FROM tenis;

-- PARTE 5 : CONSULTAS COM CASE --

-- 1)
SELECT 
    tenis.modelo 'Produto',
    CASE
        WHEN tenis.preco < 200 THEN 'Econômico'
        WHEN tenis.preco BETWEEN 200 AND 500 THEN 'Intermediário'
        ELSE 'Premium'
    END 'faixa_preço'
FROM tenis;

-- 2)
SELECT 
    tenis.modelo 'Produto',
    CASE
        WHEN tenis.categoria = 'Corrida' THEN 'Esporte - Performance'
        WHEN tenis.categoria = 'Casual' THEN 'Dia a Dia'
        ELSE 'Esporte - Específico'
    END 'uso'
FROM tenis;

-- 3)
SELECT 
    marca.nome 'Fabricante',
    CASE
        WHEN marca.pais_origem = 'Brasil' THEN 'Nacional'
        ELSE 'Importada'
    END 'origem'
FROM marca;

-- 4)
SELECT 
    tenis.modelo 'Produto',
    CASE
        WHEN tenis.tamanho < 38 THEN 'Pequeno'
        WHEN tenis.tamanho BETWEEN 38 AND 42 THEN 'Médio'
        ELSE 'Grande'
    END 'numeração'
FROM tenis;

-- PARTE 6 : CONSULTAS COM IFNULL E JOIN --

-- 1)
SELECT 
    marca.nome 'Fabricante',
    IFNULL(marca.pais_origem, 'Origem desconhecida') 'Pais'
FROM marca;

-- 2)
SELECT 
    tenis.modelo 'Produto',
    IFNULL(marca.nome, 'MARCA GENERICA') 'Fabricante'
FROM tenis LEFT JOIN marca ON tenis.fk_marca = marca.id;

-- 3)
SELECT 
    tenis.modelo 'Produto',
    tenis.preco 'Valor (R$)',
    marca.nome 'Fabricante'
FROM tenis INNER JOIN marca ON tenis.fk_marca = marca.id;

-- 4)
SELECT 
    CONCAT(tenis.modelo, ' - ', tenis.categoria, ' - ', marca.nome) 'vitrine'
FROM tenis INNER JOIN marca ON tenis.fk_marca = marca.id;

-- 5)
SELECT 
    tenis.modelo 'Produto',
    marca.nome 'Fabricante'
FROM tenis RIGHT JOIN marca ON tenis.fk_marca = marca.id;