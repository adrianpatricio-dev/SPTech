USE sprint1;

-- CRIAÇÃO DA TABELA --

CREATE TABLE produto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    categoria VARCHAR(20) CONSTRAINT chCategoria CHECK (categoria IN('Camiseta', 'Blusa', 'Calça', 'Jaqueta', 'Short', 'Moletom')),
    tamanho CHAR(2) CONSTRAINT chTamanho CHECK (tamanho IN('P', 'M', 'G', 'GG')),
    preco DECIMAL(5,2),
    disponivel TINYINT,
    data_cadastro DATETIME
);

-- INSERÇÃO DE DADOS -- 

INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, data_cadastro) VALUES
	('Camiseta Azul', 'Camiseta', 'M', 49.90, 1, '2026-06-01 16:00:00'),
	('Moletom Preto', 'Moletom', 'G', 129.90, 1, NOW()),
	('Calça Jeans', 'Calça', 'GG', 159.90, 0, NOW()),
	('Jaqueta Couro', 'Jaqueta', 'P', 199.90, 1, '2026-07-10 16:45:00'),
	('Blusa Feminina', 'Blusa', 'M', 79.90, 1, '2026-02-15 11:00:00'),
	('Short Esportivo', 'Short', 'G', 59.90, 0, NOW());
    
-- CONSULTAS --

-- 1)
SELECT * FROM produto WHERE nome LIKE '%Camiseta%';

-- 2)
SELECT * FROM produto WHERE NOT tamanho = 'M';

-- 3)
SELECT * FROM produto WHERE data_cadastro > '2026-08-18';

-- 4)
SELECT * FROM produto WHERE disponivel = 1 AND categoria IN ('Camiseta', 'Blusa');

-- 5)
SELECT
	CONCAT(nome, ' - ', preco) produto_preco
FROM produto;

-- 6)
SELECT * FROM produto WHERE nome NOT LIKE '%Blusa%';

-- 7)
SELECT 
	*,
    CASE
		WHEN disponivel = 1 THEN 'Disponível'
        ELSE 'Insdiponível'
	END 'status'
FROM produto;

-- 8)
SELECT * FROM produto WHERE categoria = 'Calça' AND preco > 100;

-- 9)
SELECT * FROM produto WHERE nome NOT LIKE '%Camiseta%';

-- 10)
SELECT * FROM produto WHERE id IN(1, 3, 5);

-- 11)
SELECT * FROM produto WHERE tamanho NOT IN('P', 'M');

-- 12)
SELECT * FROM produto WHERE data_cadastro < '2025-08-18';

-- 13)
SELECT
	nome,
    preco AS produto_valor
FROM produto;

-- 14)
SELECT
	CONCAT(nome , ', ' , categoria , ', ' , preco) info_completa
FROM produto;

-- 15)
SELECT * FROM produto WHERE disponivel = 1 AND tamanho = 'M';

-- 16)
SELECT * FROM produto WHERE nome LIKE 'C%';

-- ATUALIZAÇÃO --

-- 1)
UPDATE produto SET preco = 270.00 WHERE nome = 'Jaqueta Couro';

-- 2)
UPDATE produto SET disponivel = 0 WHERE categoria = 'Blusa';

-- 3)
UPDATE produto SET tamanho = 'M' WHERE nome LIKE '%Short%';

-- 4)
UPDATE produto SET categoria = 'Camiseta' WHERE nome LIKE '%Camiseta%';

-- 5)
UPDATE produto SET disponivel = 1 WHERE data_cadastro > '2026-08-20';

-- 6)
UPDATE produto SET preco = preco * 1.05 WHERE preco < 100;

-- 7)
UPDATE produto SET nome = 'Short Esportivo Unissex' WHERE id = 4;

-- 8)
UPDATE produto SET disponivel = 0 WHERE nome LIKE '%Blusa%' OR nome LIKE '%Moletom%';

-- 9)
UPDATE produto SET data_cadastro = NOW() WHERE categoria = 'Camiseta';

-- SEGUNDA INSERÇÃO E CONSULTAS AVANÇADAS -- 

-- 1)
INSERT INTO produto (nome, categoria, tamanho, preco, disponivel, data_cadastro) VALUES
	('Camiseta Esportiva', 'Camiseta', 'G', 89.90, 1, '2026-08-22 09:00:00'),
	('Blusa de Frio', 'Blusa', 'GG', 119.90, 1, '2026-08-23 10:30:00'),
	('Calça Cargo', 'Calça', 'M', 149.90, 1, '2026-08-24 13:15:00'),
	('Jaqueta Corta-Vento', 'Jaqueta', 'G', 189.90, 0, '2026-08-25 15:45:00'),
	('Short Jeans', 'Short', 'P', 69.90, 1, '2026-08-26 11:20:00'),
	('Moletom', 'Moletom', 'M', 139.90, 1, '2026-08-27 16:00:00');

-- 2)
SELECT * FROM produto WHERE categoria = 'Jaqueta' AND disponivel = 0;

-- 3)
SELECT * FROM produto WHERE tamanho IN('GG', 'P') ORDER BY preco DESC;

-- 4)
SELECT nome, tamanho FROM produto WHERE data_cadastro BETWEEN '2026-08-01' AND '2026-08-31';

-- 5)
SELECT * FROM produto WHERE nome LIKE '%a';

-- 6)
SELECT * FROM produto WHERE categoria NOT IN('Camiseta', 'Calça', 'Short');

-- 7)
SELECT
	nome AS 'Nome do produto',
    preco AS 'Preço do produto'
FROM produto WHERE preco BETWEEN 50.00 AND 150.00;

-- 8)
SELECT 
	*,
    CONCAT(nome , ' - ' , categoria) info
FROM produto;

-- 9)
SELECT 
	nome,
    preco,
    'Em falta' AS 'status'
FROM produto WHERE disponivel = 0;

-- 10)
SELECT * FROM produto WHERE nome LIKE '% %';

-- 11)
SELECT
	nome AS nome_produto,
    preco AS preco_atual,
    data_cadastro,
    CONCAT(nome , ' -- ' , categoria , ' -- ' , preco) descricao,
    'Disponível' AS status_disponibilidade
FROM produto WHERE nome NOT LIKE '%Blusa%' AND tamanho IN('M', 'G') AND disponivel = 1 AND data_cadastro > '2025-08-15';