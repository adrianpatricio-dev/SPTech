USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE autores (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(20),
    CONSTRAINT ch_nacionalidade CHECK(nacionalidade IN('Brasileiro', 'Estrangeiro'))
);

CREATE TABLE livros (
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL UNIQUE,
    genero VARCHAR(50),
    ano_publicacao INT,
    fk_autor INT,
    CONSTRAINT ck_fk_autor FOREIGN KEY (fk_autor) REFERENCES autores (id_autor)
);

CREATE TABLE vendas (
	id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda DATE NOT NULL,
    quantidade INT DEFAULT 1,
    valor_total DECIMAL(10,2), 
    fk_livro INT,
    CONSTRAINT ch_valor_total CHECK(valor_total > 0),
    CONSTRAINT ch_fk_livro FOREIGN KEY (fk_livro) REFERENCES livros (id_livro)
);



-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO autores (nome, nacionalidade) VALUES 
	('Machado de Assis', 'Brasileiro'),
	('J.K. Rowling', 'Estrangeiro'),
	('Clarice Lispector', 'Brasileiro'),
	('George Orwell', 'Estrangeiro');
    
-- 2)
INSERT INTO livros (titulo, genero, ano_publicacao, fk_autor) VALUES 
	('Dom Casmurro', 'Romance', 1899, 1),
	('Harry Potter e a Pedra Filosofal', 'Fantasia', 1997, 2),
	('A Hora da Estrela', 'Romance', 1977, 3),
	('1984', 'Ficção Científica', 1949, 4),
	('Memórias Póstumas de Brás Cubas', 'Romance', 1881, 1),
	('A Revolução dos Bichos', 'Sátira', 1945, 4);
    
-- 3)
-- Venda com quantidade informada explicitamente
INSERT INTO vendas (data_venda, quantidade, valor_total, fk_livro) VALUES 
	('2026-06-01', 2, 89.90, 1),
	('2026-06-02', DEFAULT, 90.00,2),
	('2026-06-03', 1, 35.00, 3),
	('2026-06-04', DEFAULT,50.00, 4),
	('2026-06-05', 3, 120.00, 5);
    
-- 4)
SELECT * FROM autores;
SELECT * FROM livros;
SELECT * FROM vendas;

-- 5)
INSERT INTO autores (nome, nacionalidade) VALUES
	('William Shakespeare', 'Europeu');
    
	-- Error Code: 3819. Check constraint 'ch_nacionalidade' is violated.

-- 6)
INSERT INTO vendas (data_venda, quantidade, valor_total, fk_livro) VALUES 
	('2026-06-05', 3, -50.00, 1);
    
    -- Error Code: 3819. Check constraint 'ch_valor_total' is violated.
    
-- 7)
INSERT INTO livros (titulo, genero, ano_publicacao, fk_autor) VALUES 
	('Romeu e Juliete', 'Romance', 1597, 9);
    
    -- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`sprint2`.`livros`, CONSTRAINT `ck_fk_autor` FOREIGN KEY (`fk_autor`) REFERENCES `autores` (`id_autor`))



-- PARTE 3 : UPDATE (ATUALIZAÇÃO DE DADOS) --

-- 1)
UPDATE autores SET nome = 'Adrian Patrício' WHERE id_autor = 1;

-- 2)
UPDATE autores SET nacionalidade = 'Brasileiro' WHERE id_autor = 1;

-- 3)
UPDATE livros SET genero = 'Ação', ano_publicacao = 2026 WHERE id_livro = 1;

-- 4)
UPDATE livros SET fk_autor = 2 WHERE id_livro = 1;

-- 5)
UPDATE vendas SET quantidade = 10 WHERE id_venda = 1;

-- 6)
UPDATE vendas SET valor_total = 99.99 WHERE id_venda IN (1, 2);

-- 7)
UPDATE livros SET genero = 'Ação' WHERE fk_autor = 4;

-- 8)
UPDATE vendas SET data_venda = '2026-01-01' WHERE quantidade > 2;

-- 9)
UPDATE vendas SET valor_total = valor_total * 2 WHERE id_venda = 1;

-- 10)
UPDATE livros SET genero = 'Ficção';



-- PARTE 4 : DELETE (EXCLUSÃO DE DADOS) --

-- 1)
DELETE FROM vendas WHERE id_venda = 1;

-- 2)
DELETE FROM vendas WHERE quantidade = 1;

-- 3)
DELETE FROM vendas WHERE valor_total < 50;

-- 4)
DELETE FROM vendas WHERE id_venda = 2;
DELETE FROM livros WHERE id_livro = 1;

-- 5)
DELETE FROM autores WHERE id_autor = 2;

	-- Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`sprint2`.`livros`, CONSTRAINT `ck_fk_autor` FOREIGN KEY (`fk_autor`) REFERENCES `autores` (`id_autor`))

DELETE FROM livros WHERE fk_autor = 2;
DELETE FROM autores WHERE id_autor = 2;

-- 6)
DELETE FROM livros WHERE genero = 'Ficção';

-- 7)
DELETE FROM livros WHERE ano_publicacao < 2000;

-- 8)
DELETE FROM vendas WHERE id_venda IN (2, 4);

-- 9)
DELETE FROM vendas;

-- 10)
TRUNCATE vendas;



-- PARTE 5 : ALTER TABLE : ADICIONAR COLUNAS E CONSTRAINTS --

-- 1)
ALTER TABLE vendas ADD COLUMN forma_pagamento VARCHAR(10) DEFAULT 'Dinheiro';

-- 2)
ALTER TABLE vendas ADD CONSTRAINT ch_formaPagamento CHECK(forma_pagamento IN('Dinheiro', 'Cartão', 'Pix'));

-- 3)
ALTER TABLE autores ADD CONSTRAINT ch_nacionalidade UNIQUE (nacionalidade);

-- 4)
DESCRIBE vendas;
DESCRIBE autores;

-- 5)
INSERT INTO autores (nome, nacionalidade) VALUES
	('Machado de Assis', 'Brasileiro'),
	('Clarice Lispector', 'Brasileiro');
	
    -- Error Code: 1062. Duplicate entry 'Brasileiro' for key 'autores.ch_nacionaidade'



-- PARTE 6 : ALTER TABLE : REMOVER CONSTRAINTS E CONFIGURAÇÕES --

-- 1)
ALTER TABLE vendas MODIFY COLUMN data_venda DATE NULL;

-- 2)
ALTER TABLE autores DROP INDEX ch_nacionalidade;

-- 3)
ALTER TABLE vendas MODIFY COLUMN forma_pagamento VARCHAR(10);

-- 4)
ALTER TABLE vendas DROP CHECK ch_formaPagamento;

-- 5)
ALTER TABLE vendas DROP CHECK ch_valor_total;

-- 6)
ALTER TABLE vendas DROP FOREIGN KEY ch_fk_livro;

INSERT INTO vendas (data_venda, quantidade, valor_total, fk_livro) VALUES 
	('2026-06-01', 2, 89.90, 1);
    
-- 7)
ALTER TABLE livros DROP FOREIGN KEY ck_fk_autor;

-- 8)
DESCRIBE vendas;
DESCRIBE livros;



-- PARTE 7 : CONSULTAS COM JOIN ENTRE AS TABELAS --

-- 1)
SELECT 
	livros.titulo, 
    autores.nome 
FROM livros JOIN autores ON livros.fk_autor = autores.id_autor;

-- 2)
SELECT 
	livros.titulo, 
	vendas.data_venda, 
    vendas.valor_total 
FROM livros JOIN vendas ON livros.id_livro = vendas.fk_livro;

-- 3)
SELECT
	autores.nome,
	livros.titulo,
    vendas.data_venda,
    vendas.valor_total
FROM autores 
	JOIN livros ON autores.id_autor = livros.fk_autor 
    JOIN vendas ON livros.id_livro = vendas.fk_livro;
    
-- 4)
SELECT
	CONCAT(livros.titulo, ' - ', autores.nome, ' - ', livros.genero) 'inforamções'
FROM livros JOIN autores ON livros.fk_autor = autores.id_autor;

-- 5)
SELECT
	livros.*,
    IFNULL(valor_total, 'Sem vendas') 'Status'
FROM livros LEFT JOIN vendas ON livros.id_livro = vendas.fk_livro;