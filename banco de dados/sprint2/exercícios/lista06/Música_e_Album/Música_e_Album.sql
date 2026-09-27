USE sprint2;

-- PARTE 1 : CRIAR TABELAS --

CREATE TABLE musica (
	idMusica INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(45),
    artista VARCHAR(45),
    genero VARCHAR(45)
);

CREATE TABLE album (
	idAlbum INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    tipo VARCHAR(10) CONSTRAINT ch_tipo_ CHECK (tipo IN ('digital', 'fisico')),
    dtLancamento DATE
);

-- PARTE 2 : INSERIR OS DADOS --

-- 1)
INSERT INTO musica (titulo, artista, genero) VALUES
    ('Blinding Lights', 'The Weeknd', 'Pop'),
    ('Save Your Tears', 'The Weeknd', 'Pop'),
    ('Tempo Perdido', 'Legião Urbana', 'Rock'),
    ('Pais e Filhos', 'Legião Urbana', 'Rock');
    
-- 2)
INSERT INTO album (nome, tipo, dtLancamento) VALUES
    ('After Hours', 'digital', '2020-03-20'),
    ('Dois', 'fisico', '1986-01-01');
    
-- PARTE 3 : MODELAGEM E CHAVE ESTRANGEIRA --

-- 1)
SELECT * FROM musica;
SELECT * FROM album;

-- 2)
ALTER TABLE musica ADD COLUMN fk_album INT;

ALTER TABLE musica ADD CONSTRAINT fk_musica_album FOREIGN KEY (fk_album) REFERENCES album (idAlbum);

-- 3)
UPDATE musica SET musica.fk_album = 1 WHERE musica.titulo IN ('Blinding Lights', 'Save Your Tears');

UPDATE musica SET musica.fk_album = 2 WHERE musica.titulo IN ('Tempo Perdido', 'Pais e Filhos');

-- PARTE 4 : CONSULTAS COM JOIN --

-- 1)
SELECT 
    *
FROM musica INNER JOIN album ON musica.fk_album = album.idAlbum;

-- 2)
SELECT 
    musica.titulo 'Música',
    album.nome 'Álbum'
FROM musica INNER JOIN album ON musica.fk_album = album.idAlbum;

-- 3)
SELECT 
    *
FROM musica INNER JOIN album ON musica.fk_album = album.idAlbum WHERE album.tipo = 'digital';