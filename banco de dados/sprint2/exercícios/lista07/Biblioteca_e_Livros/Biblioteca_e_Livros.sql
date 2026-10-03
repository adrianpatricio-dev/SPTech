USE sprint2;

-- MODELAGEM E CRIAÇÃO --

CREATE TABLE autor (
	pkAutor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    nacionalidade VARCHAR(45) NOT NULL,
    dataNascimento DATE NOT NULL
);

CREATE TABLE livro (
	pkLivro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100) NOT NULL,
    paginas INT NOT NULL,
    anoPublicacao INT NOT NULL,
    preco DECIMAL(6,2) NOT NULL,
    situacao VARCHAR(20) NOT NULL,
    fkAutor INT NOT NULL,
    CONSTRAINT fk_autor_livro FOREIGN KEY (fkAutor) REFERENCES autor (pkAutor),
    CONSTRAINT ck_livro_paginas CHECK (paginas > 0)
);

INSERT INTO autor (nome, nacionalidade, dataNascimento) VALUES
	('Machado de Assis', 'Brasileira', '1839-06-21'),
	('Clarice Lispector', 'Brasileira', '1920-12-10'),
	('George Orwell', 'Britânica', '1903-06-25'),
	('Gabriel García Márquez', 'Colombiana', '1927-03-06'),
	('Agatha Christie', 'Britânica', '1890-09-15');

INSERT INTO livro (titulo, paginas, anoPublicacao, preco, situacao, fkAutor) VALUES
	('Dom Casmurro', 256, 1899, 29.90, 'Disponível', 1),
	('Memórias Póstumas de Brás Cubas', 368, 1881, 34.90, 'Emprestado', 1),
	('A Hora da Estrela', 88, 1977, 24.90, 'Disponível', 2),
	('A Paixão Segundo G.H.', 192, 1964, 39.90, 'Reservado', 2),
	('1984', 416, 1949, 44.90, 'Disponível', 3),
	('A Revolução dos Bichos', 152, 1945, 27.90, 'Emprestado', 3),
	('Cem Anos de Solidão', 448, 1967, 59.90, 'Disponível', 4),
	('Assassinato no Expresso do Oriente', 256, 1934, 36.90, 'Reservado', 5);
    
-- COMANDOS E MANIPULAÇÃO --

-- a)
SELECT * FROM livro;

-- b)
SELECT
	livro.titulo 'Livro',
    livro.anoPublicacao 'Ano de Publicação',
    autor.nome 'Autor'
FROM livro INNER JOIN autor ON livro.fkAutor = autor.pkAutor;

-- c)
SELECT
	livro.titulo 'Livro',
    livro.anoPublicacao 'Ano de Publicação',
    autor.nome 'Autor'
FROM livro INNER JOIN autor ON livro.fkAutor = autor.pkAutor WHERE livro.anoPublicacao > 1950;

-- d)
SELECT
	livro.titulo 'Livro',
    livro.anoPublicacao 'Ano de Publicação',
    autor.nome 'Autor'
FROM livro INNER JOIN autor ON livro.fkAutor = autor.pkAutor WHERE autor.nome = 'Machado de Assis';

-- e)
SELECT
	livro.titulo 'Livro',
    livro.preco 'Preço'
FROM livro WHERE livro.preco BETWEEN 30 AND 45;

-- f)
SELECT
	livro.titulo 'Livro',
    autor.nome 'Autor',
    livro.paginas 'Páginas',
    CASE
		WHEN livro.paginas <= 200 THEN 'Curto'
        WHEN livro.paginas <= 400 THEN 'Médio'
        ELSE 'Longo'
	END 'Classificação'
FROM livro INNER JOIN autor ON livro.fkAutor = autor.pkAutor;

-- g)
UPDATE livro SET preco = 32.90 WHERE pkLivro = 1;

-- h)
DELETE FROM livro WHERE pkLivro = 8;

-- i)
SELECT
	livro.titulo 'Livro',
    autor.nome 'Autor',
    livro.anoPublicacao 'Ano de Publicação'
FROM livro INNER JOIN autor ON livro.fkAutor = autor.pkAutor ORDER BY livro.anoPublicacao DESC;