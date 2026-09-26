USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE sprint2.restaurante (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    bairro VARCHAR(45),
    nota_avaliacao INT,
    CONSTRAINT ch_nota_avaliacao CHECK (nota_avaliacao BETWEEN 0 AND 5)
);

CREATE TABLE sprint2.prato (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo VARCHAR(45) CONSTRAINT ch_tipo CHECK (tipo IN('Sushi', 'Sashimi', 'Temaki', 'Ramem', 'Yakisoba')),
    preco DECIMAL(5,2) CONSTRAINT ch_preco CHECK (preco > 0),
    disponivel TINYINT,
	fk_restaurante INT,
    CONSTRAINT fk_restaurante_prato FOREIGN KEY (fk_restaurante) REFERENCES restaurante (id)
);

-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO restaurante (nome, bairro, nota_avaliacao) VALUES
	('Sushi House', 'Liberdade', 5),
	('Tokyo Ramen', 'Moema', 4),
	('Nippon Food', 'Vila Mariana', NULL);

-- 2)
INSERT INTO prato (nome, tipo, preco, disponivel, fk_restaurante) VALUES
	('Salmão Nigiri', 'Sushi', 32.90, 1, 1),
	('Sashimi de Atum', 'Sashimi', 45.90, 1, 1),
	('Temaki de Salmão', 'Temaki', 28.50, 1, 2),
	('Ramen Tradicional', 'Ramem', 39.90, 0, 2),
	('Yakisoba de Frango', 'Yakisoba', 34.90, 1, 3),
	('Temaki de Atum', 'Temaki', 29.90, 1, 3);
    
-- 3)
SELECT * FROM restaurante;
SELECT * FROM prato;
    
-- PARTE 3 : CONSULTAS COM SELECT --

-- 1)
SELECT
	prato.nome 'Nome do prato',
    prato.preco 'Preço do prato'
FROM prato;

-- 2)
SELECT
	*
FROM prato WHERE tipo = 'Ramem';

-- 3)
SELECT
	*
FROM prato ORDER BY preco DESC;

-- 4)
SELECT
	*
FROM prato WHERE preco > 30;

-- PARTE 4 : CONSULTAS COM AS (RENOMEAR COLUNAS) --

-- 1)
SELECT
	prato.nome 'Prato',
    prato.preco 'Valor (R$)'
FROM prato;

-- 2)
SELECT
	restaurante.nome 'Estabelecimento',
    restaurante.bairro 'Localização'
FROM restaurante;

-- 3)
SELECT
	prato.nome 'Prato',
	prato.preco * 1.10 'Preço (R$)'
FROM prato;

-- 4)
SELECT
	prato.nome 'Item do cardápio',
    prato.tipo 'Categoria'
FROM prato;

-- PARTE 5 : CONSULTAS COM CASE --

-- 1)
SELECT 
	prato.nome 'Prato',
    CASE
		WHEN preco < 25 THEN 'Barato'
		WHEN preco <= 50 THEN 'Moderado'
        ELSE 'Premium'
	END faixa_preco
FROM prato;

-- 2)
SELECT
	prato.nome 'Prato',
    CASE
		WHEN disponivel = 1 THEN 'Disponível'
        ELSE 'Indisponível'
	END 'status'
FROM prato;

-- 3)
SELECT
	restaurante.nome 'Estabelecimento',
    CASE
		WHEN nota_avaliacao > 4 THEN 'Excelente'
        WHEN nota_avaliacao >= 3 THEN 'Bom'
        ELSE 'Regular'
	END 'classificação'
FROM restaurante;

-- 4) 
SELECT
	prato.nome 'Prato',
    CASE
		WHEN tipo = 'Sushi' THEN 'Prato Frio'
        WHEN tipo = 'Sashimi' THEN 'Prato Frio'
        ELSE 'Prato Quente'
	END 'origem'
FROM prato;

-- PARTE 6 : CONSULTAS COM IFNULL E JOIN --

-- 1)
SELECT
	restaurante.nome 'Estabelecimento',
    IFNULL(nota_avaliacao, 'Sem avaliação') 'Avaliação'
FROM restaurante;

-- 2)
SELECT
	IFNULL(prato.nome, 'NENHUM PRATO') 'Prato'
FROM restaurante LEFT JOIN prato ON restaurante.id = prato.fk_restaurante;

-- 3)
SELECT
	prato.nome 'Prato',
    prato.preco 'Valor (R$)',
    restaurante.nome
FROM prato INNER JOIN restaurante ON prato.fk_restaurante = restaurante.id;

-- 4)
SELECT
	CONCAT(prato.nome, ' - ', prato.tipo, ' - ', restaurante.nome) cardapio
FROM prato INNER JOIN restaurante ON prato.fk_restaurante = restaurante.id;

-- 5)
SELECT
	*
FROM prato RIGHT JOIN restaurante ON prato.fk_restaurante = restaurante.id;