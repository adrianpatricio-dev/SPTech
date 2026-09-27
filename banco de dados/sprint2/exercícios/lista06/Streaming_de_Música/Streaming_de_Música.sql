USE sprint2;

-- PARTE 1 : CRIAR AS TABELAS COM CONSTRAINTS --

CREATE TABLE sprint2.artista (
	id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    genero_musical VARCHAR(45),
    pais VARCHAR(45),
    ativo VARCHAR(10)
);

CREATE TABLE musica (
	id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45),
    duracao_segundos INT,
    ano_lancamento DATE,
    fk_artista INT,
    CONSTRAINT fk_artista_musica FOREIGN KEY (fk_artista ) REFERENCES artista (id)
);

-- PARTE 2 : INSERIR DADOS DE EXEMPLO --

-- 1)
INSERT INTO artista (nome, genero_musical, pais, ativo) VALUES
	('The Weeknd', 'Pop', 'Canadá', 'Sim'),
	('Legião Urbana', 'Rock', 'Brasil', 'Sim'),
	('Michael Jackson', 'Pop', NULL, 'Não');

-- 2)
INSERT INTO musica (titulo, duracao_segundos, ano_lancamento, fk_artista) VALUES
	('Blinding Lights', 200, '2020-01-01', 1),
	('Tempo Perdido', 285, '1986-01-01', 2),
	('Billie Jean', 294, '1982-01-01', 3),
	('Save Your Tears', 215, '2020-01-01', 1),
	('Musica Sem Artista', 170, '2023-01-01', NULL);
    
-- 3)
SELECT * FROM artista;
SELECT * FROM musica;

-- PARTE 3 : CONSULTAS COM SELECT --
 
-- 1)
SELECT
    musica.titulo,
    musica.duracao_segundos
FROM musica;

-- 2)
SELECT
    musica.titulo,
    musica.ano_lancamento
FROM musica WHERE musica.ano_lancamento > '2020-01-01';

-- 3)
SELECT
    artista.nome
FROM artista ORDER BY artista.nome ASC;

-- 4)
SELECT
    musica.titulo,
    musica.duracao_segundos
FROM musica WHERE musica.duracao_segundos > 200;

-- PARTE 4 : CONSULTAS COM AS (RENOMEAR COLUNAS) --

-- 1)
SELECT
    musica.titulo 'Nome da Música',
    musica.ano_lancamento 'Ano'
FROM musica;

-- 2)
SELECT
    artista.nome 'Cantor/Banda',
    artista.genero_musical 'Estilo'
FROM artista;

-- 3)
SELECT
    musica.duracao_segundos / 60 'Duração (min)'
FROM musica;

-- 4)
SELECT
    musica.titulo 'Faixa',
    musica.ano_lancamento 'Lançamento'
FROM musica;

-- PARTE 5 : CONSULTAS COM CASE --

-- 1)
SELECT
    musica.titulo 'Faixa',
    CASE
        WHEN musica.ano_lancamento < '2000-01-01' THEN 'Clássico'
        WHEN musica.ano_lancamento BETWEEN '2000-01-01' AND '2015-12-31' THEN 'Moderno'
        ELSE 'Atual'
    END 'era'
FROM musica;

-- 2)
SELECT
    artista.nome 'Cantor/Banda',
    CASE
        WHEN artista.ativo = 'Sim' THEN 'Em atividade'
        ELSE 'Inativo'
    END 'status'
FROM artista;

-- 3)
SELECT
    musica.titulo 'Faixa',
    CASE
        WHEN musica.duracao_segundos < 180 THEN 'Curta'
        WHEN musica.duracao_segundos BETWEEN 180 AND 300 THEN 'Normal'
        ELSE 'Longa'
    END 'tamanho'
FROM musica;

-- 4)
SELECT
    artista.nome 'Cantor/Banda',
    CASE
        WHEN artista.pais = 'Brasil' THEN 'Nacional'
        ELSE 'Internacional'
    END 'origem'
FROM artista;

-- PARTE 6 : CONSULTAS COM IFNULL E JOIN --

-- 1)
SELECT
    artista.nome 'Cantor/Banda',
    IFNULL(artista.pais, 'Pais desconhecido') 'Pais'
FROM artista;

-- 2)
SELECT
    musica.titulo 'Faixa',
    IFNULL(artista.nome, 'ARTISTA DESCONHECIDO') 'Cantor/Banda'
FROM musica LEFT JOIN artista ON musica.fk_artista = artista.id;

-- 3)
SELECT
    musica.titulo 'Faixa',
    musica.ano_lancamento 'Ano',
    artista.nome 'Cantor/Banda'
FROM musica INNER JOIN artista ON musica.fk_artista = artista.id;

-- 4)
SELECT
    CONCAT(musica.titulo, ' - ', artista.nome, ' - ', musica.ano_lancamento) 'catalogo'
FROM musica INNER JOIN artista ON musica.fk_artista = artista.id;

-- 5)
SELECT
    musica.titulo 'Faixa',
    artista.nome 'Cantor/Banda'
FROM musica RIGHT JOIN artista ON musica.fk_artista = artista.id;