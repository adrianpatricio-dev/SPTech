ALTER TABLE sprint2.loja 
	ADD COLUMN cnpj CHAR(14) NOT NULL UNIQUE,
	ADD COLUMN segmento VARCHAR(45),
    ADD COLUMN nome VARCHAR(50);

CREATE TABLE sprint2.produto (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    preco DECIMAL(4,2),
    tipo VARCHAR(20),
    cod_produto CHAR(8) UNIQUE,
    data_validade DATE,
    data_fabricacao DATETIME,
    CONSTRAINT chDtFabri CHECK (data_fabricacao < '2026-09-14'),
    fk_loja INT, -- CHAVE ESTRANGEIRA (FK)
    CONSTRAINT chFkLoja FOREIGN KEY (fk_loja) REFERENCES sprint2.loja(id)
);

DESC sprint2.loja;
DESC sprint2.produto;

INSERT INTO sprint2.loja (nome, cnpj, segmento) VALUES
	('Americanas', '321.265.0001/5', 'Varejo');
    
SELECT * FROM sprint2.loja;
SELECT * FROM sprint2.produto;

-- INSERÇÃO FORÇANDO O ERRO DA FK
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sprint2`.`produto`, CONSTRAINT `chFkLoja` FOREIGN KEY (`fk_loja`) REFERENCES `loja` (`id`)) 
INSERT INTO sprint2.produto VALUES 
	(DEFAULT, 'Bis X', 5.50, 'doce', '56248751', '2026-10-05', '2026-09-01', 999);

-- INSERÇÃO CERTA
INSERT INTO sprint2.produto VALUES 
	(DEFAULT, 'Bis X', 5.50, 'doce', '56248751', '2026-10-05', '2026-09-01', 1);
    
-- SELECT JUNTANDO DUAS TABELAS
SELECT * FROM sprint2.produto JOIN sprint2.loja;

INSERT INTO sprint2.produto VALUES 
	(DEFAULT, 'Monster', 14.90, 'energético', '24588751', '2027-02-05', '2026-01-01', 1),
	(DEFAULT, 'Negresco', 3.55, 'bolacha', '5622361', '2026-11-24', '2025-09-02', 1),
	(DEFAULT, 'Miojo - turma da Mônica', 3.75, 'macarrão', '56246534', '2030-04-05', '1998-02-05', 1);
    
INSERT INTO sprint2.loja (nome, cnpj, segmento) VALUES
	('Pernambucanas', '356.785.0001/1', 'Varejo');
    
-- SELECT JUNTANDO DUAS TABELAS USANDO ON (ESPECÍFICA O QUE VOCÊ QUER TRAZER)
SELECT * FROM sprint2.produto JOIN sprint2.loja ON loja.id = produto.fk_loja; -- CONCEITUALEMTE É O CERTO (WHERE PODE SER USADO)

SELECT * FROM sprint2.produto LEFT JOIN sprint2.loja ON loja.id = produto.fk_loja;

SELECT * FROM sprint2.produto AS p JOIN sprint2.loja AS l ON l.id = p.fk_loja;
    
SELECT
	CONCAT(p.nome, ' - ', l.nome) AS produto_loja
FROM sprint2.produto AS p JOIN sprint2.loja AS l ON l.id = p.fk_loja;

UPDATE sprint2.produto SET fk_loja = NULL WHERE id = 6;

SELECT
	CONCAT(p.nome, ' - ', IFNULL(l.nome, 'SEM LOJA')) AS produto_loja
FROM sprint2.produto AS p LEFT JOIN sprint2.loja AS l ON l.id = p.fk_loja;